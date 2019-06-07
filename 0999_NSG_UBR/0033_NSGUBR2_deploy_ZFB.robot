*** Settings ***

Resource          	../../VNSPOC-variables/${SETUP}/vars_common.robot
Resource          	../../VNSPOC-variables/${SETUP}/vars_B.robot
Resource          	cats_lib/resources/cats_common.robot

Force Tags		  	usecase
Documentation		30.1.5 B2B UNDERLAY CONFIGURATION
Test Timeout		10 minutes

*** Test Cases ***

Checking NSG UBR2 availability
    [Setup]  Csproot User is logged in VSD

#	NSGUBR2 is not up in Monitoring
	NSGUBR2 is not configured
	NSGUBR2 is not bootstrapped
	
Generate NSG METRO BUILD Vars
    # this KW Sets Suite Variable w/ name ${cats_nsgs} and ${cats_nsg_templates}
    # which contains a dictionary of templated parameters
    Load NSGs Variables from YAML
    ...    fname=${CURDIR}/${cats_nsg_ubr2_vars_fname}
    ...    test_prefix=NSGUBR2
	
    # this KW Sets Suite Variable w/ name ${cats_nsg_build_vars}
    # which contains a dictionary of templated METRO build parameters
    Generate NSG METRO BUILD variables
    ...    nsgv_list=${cats_nsgs}
    ...    default_target_server=${default_target_server}
    ...    nuage_zipped_files_dir=${nuage_zipped_files_dir}
    ...    nuage_unzipped_files_dir=${nuage_unzipped_files_dir}
    ...    default_port1_bridge=${default_port1_bridge}
    ...    default_port2_bridge=${default_port2_bridge}
    ...    default_port3_bridge=${default_port3_bridge}
    ...    default_port4_bridge=${default_port4_bridge}
    ...    default_port5_bridge=${default_port5_bridge}
    ...    default_port6_bridge=${default_port6_bridge}
    ...    ansible_deployment_host=${ansible_deployment_host}
    ...    zfb_isos_dir=${zfb_isos_dir}

CSPROOT Logs In VSD
    Csproot user is logged in VSD

Download ZFB files
    Download ZFB data
    ...    cats_zfb_path=${CURDIR}
    ...    cats_yaml_vars=${cats_nsg_build_vars['mynsgvs']}
    ...    cats_org_name=${cats_org_name}

Upload ZFB files to the target host
    Login to METRO host
    Upload ZFB Files

Upload build_vars to the METRO host
    Login to METRO host
    Upload build_vars.yml file

Deploy NSG UBR2 with METRO
    Deploy NSGs with METRO

Wait for all NSGs to bootstrap (5 min timeout)
    Wait for NSG bootstrap    cats_timeout=300
    ...    cats_org_name=${cats_org_name}
    ...    cats_yaml_vars=${cats_nsgs}

*** Keywords ***

NSGUBR2 is not available
    ${id}=   Get NSG System ID
             ...    cats_org_name=${cats_org_name}
             ...    cats_nsg_name=${cats_nsg_name_ubr2}
   #Log to console    ${id}
   
Login to METRO host
    SSHLibrary.Open Connection    ${cats_METRO_host}
    SSHLibrary.Login    ${cats_METRO_host_login}
    ...                 ${cats_METRO_host_passwd}

Login to target host
    SSHLibrary.Open Connection    ${default_target_server}
    SSHLibrary.Login    ${cats_target_host_login}
    ...    		${cats_target_host_passwd}

Upload ZFB files
    SSHLibrary.Put File    ${CURDIR}/_CATS/ZFB/*.iso
    ...    destination=/var/lib/libvirt/images/${zfb_isos_dir}/

    SSHLibrary.Execute Command     chown qemu:qemu /var/lib/libvirt/images/${zfb_isos_dir}

    Empty Directory    ${CURDIR}/_CATS/ZFB/

Upload build_vars.yml file
    Prepare build vars file for nsgs    
    ...    cats_build_vars_filename=${build_vars_filename}
    ...    cats_yaml_vars=${cats_nsg_build_vars}
    ...    cats_test_suite_dir=${CURDIR}

    SSHLibrary.Put File    ${CURDIR}/_CATS/${build_vars_filename}
    ...    ${cats_METRO_path}

Deploy NSGs with METRO
    ${stdout}    ${rc} =    SSHLibrary.Execute command
    ...    cd ${cats_METRO_path} && ./metro-ansible build.yml -e build_vars_file=${build_vars_filename} 
    ...    return_rc=True
    Log    ${stdout}
    Should Be Equal    ${rc}    ${0}

    ${stdout}    ${rc} =    SSHLibrary.Execute command     cd ${cats_METRO_path} && ./metro-ansible nsgv_predeploy.yml
    ...    return_rc=True
    Log    ${stdout}
    Should Be Equal    ${rc}    ${0}