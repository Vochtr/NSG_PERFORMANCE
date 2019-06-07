*** Settings ***

Force Tags		  matrix
Documentation	  Test case for NSGv deployment and boostrapping  
Test Timeout	  60 minutes

Resource          ../_VARS/vars.robot
Resource          ../_VARS/create.robot
Resource          cats_lib/resources/cats_common.robot

*** Test Cases ***
# -----------------------------------------------------------------------
#                   NSG Provisioning
# -----------------------------------------------------------------------
Login csproot
    Login csproot user

Load NSG METRO BUILD Vars
    # this KW Sets Suite Variable w/ name ${cats_nsgs} and ${cats_nsg_templates}
    # which contains a dictionary of templated parameters
    Run Keyword If   "${nbr_NSGv}" == "01_05"    Load Variables NSG 01_05
    Run Keyword If   "${nbr_NSGv}" == "06_10"    Load Variables NSG 06_10
    Run Keyword If   "${nbr_NSGv}" == "11_15"    Load Variables NSG 11_15
    Run Keyword If   "${nbr_NSGv}" == "16_20"    Load Variables NSG 16_20
    Run Keyword If   "${nbr_NSGv}" == "21_25"    Load Variables NSG 21_25
    Run Keyword If   "${nbr_NSGv}" == "26_30"    Load Variables NSG 26_30
    Run Keyword If   "${nbr_NSGv}" == "31_35"    Load Variables NSG 31_35
    Run Keyword If   "${nbr_NSGv}" == "36_40"    Load Variables NSG 36_40
    Run Keyword If   "${nbr_NSGv}" == "41_45"    Load Variables NSG 41_45
    Run Keyword If   "${nbr_NSGv}" == "46_50"    Load Variables NSG 46_50
    
Generate NSG METRO BUILD Vars
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

Download ZFB files
    Download ZFB data
    ...    cats_zfb_path=${CURDIR}
    ...    cats_yaml_vars=${cats_nsg_build_vars['mynsgvs']}
    ...    cats_org_name=${cats_org_name}

Upload ZFB files and build_vars to the METRO host
    Login to METRO host
    Upload ZFB Files
    Upload build_vars.yml file

Deploy NSGs with METRO (build)
    Run METRO Playbook
    ...    nuage_metro_path=${cats_METRO_path}
    ...    command=./metro-ansible build.yml -e build_vars_file=${build_vars_filename}

Deploy NSGs with METRO (predeploy)
    Run METRO Playbook
    ...    nuage_metro_path=${cats_METRO_path}
    ...    command=./metro-ansible nsgv_predeploy.yml -e build_vars_file=${build_vars_filename}

Wait for all NSGs to bootstrap (10 min timeout)
    Wait for NSG bootstrap
    ...    cats_timeout=600
    ...    cats_org_name=${cats_org_name}
    ...    cats_yaml_vars=${cats_nsgs}

*** Keywords ***

Login to METRO host
    SSHLibrary.Open Connection    ${cats_METRO_host}
	SSHLibrary.Login    		  ${cats_METRO_host_login}
    ...    						  ${cats_METRO_host_passwd}

Upload ZFB files
    SSHLibrary.Put File    ${CURDIR}/_CATS/ZFB/*.iso
    ...    destination=/var/lib/libvirt/images/${zfb_isos_dir}/

    SSHLibrary.Execute Command     chown qemu:qemu /var/lib/libvirt/images/${zfb_isos_dir}

    Empty Directory    ${CURDIR}/_CATS/ZFB/

Upload build_vars.yml file
    Create Build Vars File
    ...    cats_build_vars_filename=${build_vars_filename}
    ...    cats_yaml_vars=${cats_nsg_build_vars}
    ...    cats_test_suite_dir=${CURDIR}

    SSHLibrary.Put File    ${CURDIR}/_CATS/${build_vars_filename}
    ...    destination=${cats_METRO_path}

Load Variables NSG 01_05
	Load NSGs Variables from YAML
    ...    fname=${CURDIR}/_VARS/cats_matrix_vars_01-05.yaml
    ...    test_prefix=${test_prefix}
	
Load Variables NSG 06_10
	Load NSGs Variables from YAML
    ...    fname=${CURDIR}/_VARS/cats_matrix_vars_06-10.yaml
    ...    test_prefix=${test_prefix}
	
Load Variables NSG 11_15
	Load NSGs Variables from YAML
    ...    fname=${CURDIR}/_VARS/cats_matrix_vars_11-15.yaml
    ...    test_prefix=${test_prefix}
	
Load Variables NSG 16_20
	Load NSGs Variables from YAML
    ...    fname=${CURDIR}/_VARS/cats_matrix_vars_16-20.yaml
    ...    test_prefix=${test_prefix}
	
Load Variables NSG 21_25
	Load NSGs Variables from YAML
    ...    fname=${CURDIR}/_VARS/cats_matrix_vars_21-25.yaml
    ...    test_prefix=${test_prefix}
	
Load Variables NSG 26_30
	Load NSGs Variables from YAML
    ...    fname=${CURDIR}/_VARS/cats_matrix_vars_26-30.yaml
    ...    test_prefix=${test_prefix}
	
Load Variables NSG 31_35
	Load NSGs Variables from YAML
    ...    fname=${CURDIR}/_VARS/cats_matrix_vars_31-35.yaml
    ...    test_prefix=${test_prefix}
	
Load Variables NSG 36_40
	Load NSGs Variables from YAML
    ...    fname=${CURDIR}/_VARS/cats_matrix_vars_36-40.yaml
    ...    test_prefix=${test_prefix}
	
Load Variables NSG 41_45
	Load NSGs Variables from YAML
    ...    fname=${CURDIR}/_VARS/cats_matrix_vars_41-45.yaml
    ...    test_prefix=${test_prefix}
	
Load Variables NSG 46_50
	Load NSGs Variables from YAML
    ...    fname=${CURDIR}/_VARS/cats_matrix_vars_46-50.yaml
    ...    test_prefix=${test_prefix}