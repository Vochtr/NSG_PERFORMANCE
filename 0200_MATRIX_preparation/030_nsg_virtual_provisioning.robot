*** Settings ***

Force Tags		  matrix
Documentation	  Test case for virtual NSG provisioning
Test Timeout	  1 minute

Resource          ../_VARS/vars.robot
Resource          ../_VARS/create.robot
Resource          cats_lib/resources/cats_common.robot

*** Test Cases ***
# -----------------------------------------------------------------------
#                            NSG Provisioning
# -----------------------------------------------------------------------
CSPROOT Logs In For Infra GW Provisioning
    Csproot user is logged in VSD

Computing NSG variables
    # this KW Sets Suite Variable w/ name ${cats_nsgs} and ${cats_nsg_templates}
    # which contains a dictionary of templated parameters
    Load NSGs Variables from YAML
    ...    fname=${CURDIR}/_VARS/${cats_nsg_vars_fname}
    ...    test_prefix=${test_prefix}

Create Infra GW Profile
    Create Infrastructure GW Profile
    ...    name=${cats_infra_gw_profile_name}
    ...    proxyDNSName=${cats_util1_fqdn}

Create VSC Profile
    Create VSC Profile
    ...    name=${cats_vsc_profile1_name}
    ...    firstController=${cats_vsc1_ip}
    ...    secondController=${cats_vsc2_ip}

Creating Infrastructure Access Profile
    Create Infrastructure Access Profile    
    ...    name=${cats_infra_access_profile_name}
    ...    userName=nuage
    ...    password=Alcateldc

# SINGLE UPLINK & 6 ports

Create NSG Template #1 (virtual SINGLE UPLINK - 6 ports)
    Create NSG Template
    ...    name=${cats_nsg_templates['template1']['name']}
    ...    cats_infra_gw_profile_name=${cats_infra_gw_profile_name}
	
Associate Infra Access Profile with NSG Template #1  
    Associate Infra Access Profile with NSG Template    
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_infra_access_profile_name=${cats_infra_access_profile_name}

Create Ports and VLANs in NSG Template #1
	#P1
    Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template1']['port1']['name']}
    ...    physicalName=port1
    ...    portType=NETWORK
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}

    Create VLAN Template in NSG Port Template
    ...    value=${cats_internet_uplink1_vlan}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template1']['port1']['name']}
	#P2
    Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template1']['port2']['name']}
    ...    physicalName=port2
    ...    portType=ACCESS
    ...    VLANRange=0-4094
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}

    Create VLAN Template in NSG Port Template
    ...    value=0
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template1']['port2']['name']}
    #P3 
    Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template1']['port3']['name']}
    ...    physicalName=port3
    ...    portType=ACCESS
    ...    VLANRange=0-4094
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}

    Create VLAN Template in NSG Port Template
    ...    value=${cats_nsg_matrix_spirent_vlan}
#	...    value=0
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template1']['port3']['name']}
    #P4
    Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template1']['port4']['name']}
    ...    physicalName=port4
    ...    portType=ACCESS
    ...    VLANRange=0-4094
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}

    Create VLAN Template in NSG Port Template
    ...    value=0
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template1']['port4']['name']}
    #P5
	Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template1']['port5']['name']}
    ...    physicalName=port5
    ...    portType=ACCESS
    ...    VLANRange=0-4094
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}

    Create VLAN Template in NSG Port Template
    ...    value=0
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template1']['port5']['name']}
	#P6
	Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template1']['port6']['name']}
    ...    physicalName=port6
    ...    portType=ACCESS
    ...    VLANRange=0-4094
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}

    Create VLAN Template in NSG Port Template
    ...    value=0
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template1']['port6']['name']}
	
Add VSC Profile to port1 of NSG Template #1
    Associate VSC Profile With NSG VLAN Template
    ...    cats_vlan_id=${cats_internet_uplink1_vlan}
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template1']['port1']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}

Create Uplink Connection to VLAN 200 of port1 of NSG Template #1
    Create Uplink Connection in NSG Vlan Template
    ...    mode=Dynamic
    ...    role=PRIMARY
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template1']['port1']['name']}
    ...    cats_vlan_id=${cats_internet_uplink1_vlan}

# DUAL UPLINK & 6 ports

Create NSG Template #2 (virtual DUAL UPLINK - 6 ports)
    Create NSG Template
    ...    name=${cats_nsg_templates['template2']['name']}
    ...    cats_infra_gw_profile_name=${cats_infra_gw_profile_name}
	
Associate Infra Access Profile with NSG Template #2  
    Associate Infra Access Profile with NSG Template    
    ...    cats_nsg_template_name=${cats_nsg_templates['template2']['name']}
    ...    cats_infra_access_profile_name=${cats_infra_access_profile_name}

Create Ports and VLANs in NSG Template #2
	#P1
    Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template2']['port1']['name']}
    ...    physicalName=port1
    ...    portType=NETWORK
    ...    cats_nsg_template_name=${cats_nsg_templates['template2']['name']}

    Create VLAN Template in NSG Port Template
    ...    value=${cats_internet_uplink1_vlan}
    ...    cats_nsg_template_name=${cats_nsg_templates['template2']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template2']['port1']['name']}
	#P2
    Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template2']['port2']['name']}
    ...    physicalName=port2
    ...    portType=NETWORK
    ...    VLANRange=0-4094
    ...    cats_nsg_template_name=${cats_nsg_templates['template2']['name']}

    Create VLAN Template in NSG Port Template
    ...    value=${cats_internet_uplink2_vlan}
    ...    cats_nsg_template_name=${cats_nsg_templates['template2']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template2']['port2']['name']}
    #P3 
    Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template2']['port3']['name']}
    ...    physicalName=port3
    ...    portType=ACCESS
    ...    VLANRange=0-4094
    ...    cats_nsg_template_name=${cats_nsg_templates['template2']['name']}

    Create VLAN Template in NSG Port Template
    ...    value=${cats_nsg_matrix_spirent_vlan}
    ...    cats_nsg_template_name=${cats_nsg_templates['template2']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template2']['port3']['name']}
    #P4
    Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template2']['port4']['name']}
    ...    physicalName=port4
    ...    portType=ACCESS
    ...    VLANRange=0-4094
    ...    cats_nsg_template_name=${cats_nsg_templates['template2']['name']}

    Create VLAN Template in NSG Port Template
    ...    value=0
    ...    cats_nsg_template_name=${cats_nsg_templates['template2']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template2']['port4']['name']}
    #P5
	Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template2']['port5']['name']}
    ...    physicalName=port5
    ...    portType=ACCESS
    ...    VLANRange=0-4094
    ...    cats_nsg_template_name=${cats_nsg_templates['template2']['name']}

    Create VLAN Template in NSG Port Template
    ...    value=0
    ...    cats_nsg_template_name=${cats_nsg_templates['template2']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template2']['port5']['name']}
	#P6
	Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template2']['port6']['name']}
    ...    physicalName=port6
    ...    portType=ACCESS
    ...    VLANRange=0-4094
    ...    cats_nsg_template_name=${cats_nsg_templates['template2']['name']}

    Create VLAN Template in NSG Port Template
    ...    value=0
    ...    cats_nsg_template_name=${cats_nsg_templates['template2']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template2']['port6']['name']}
	
Add VSC Profile to port1 of NSG Template #2
    Associate VSC Profile With NSG VLAN Template
    ...    cats_vlan_id=${cats_internet_uplink1_vlan}
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template2']['port1']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template2']['name']}

Add VSC Profile to port2 of NSG Template #2
    Associate VSC Profile With NSG VLAN Template
    ...    cats_vlan_id=${cats_internet_uplink2_vlan}
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template2']['port2']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template2']['name']}
	
Create Uplink Connection to VLAN 200 of port1 of NSG Template #2
    Create Uplink Connection in NSG Vlan Template
    ...    mode=Dynamic
    ...    role=PRIMARY
    ...    cats_nsg_template_name=${cats_nsg_templates['template2']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template2']['port1']['name']}
    ...    cats_vlan_id=${cats_internet_uplink1_vlan}

Create Uplink Connection to VLAN 201 of port2 of NSG Template #2
    Create Uplink Connection in NSG Vlan Template
    ...    mode=Dynamic
    ...    role=PRIMARY
    ...    cats_nsg_template_name=${cats_nsg_templates['template2']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template2']['port2']['name']}
    ...    cats_vlan_id=${cats_internet_uplink2_vlan}

# SINGLE UPLINK & 3 ports

Create NSG Template #3 (SINGLE UPLINK - 3 ports)
    Create NSG Template
    ...    name=${cats_nsg_templates['template3']['name']}
    ...    cats_infra_gw_profile_name=${cats_infra_gw_profile_name}
	
Associate Infra Access Profile with NSG Template #3 
    Associate Infra Access Profile with NSG Template    
    ...    cats_nsg_template_name=${cats_nsg_templates['template3']['name']}
    ...    cats_infra_access_profile_name=${cats_infra_access_profile_name}
	
Create Ports and VLANs in NSG Template #3
	#P1
    Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template3']['port1']['name']}
    ...    physicalName=port1
    ...    portType=NETWORK
    ...    cats_nsg_template_name=${cats_nsg_templates['template3']['name']}

    Create VLAN Template in NSG Port Template
    ...    value=${cats_internet_uplink1_vlan}
    ...    cats_nsg_template_name=${cats_nsg_templates['template3']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template3']['port1']['name']}
	#P2
    Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template3']['port2']['name']}
    ...    physicalName=port2
    ...    portType=ACCESS
    ...    VLANRange=0-4094
    ...    cats_nsg_template_name=${cats_nsg_templates['template3']['name']}

    Create VLAN Template in NSG Port Template
    ...    value=0
    ...    cats_nsg_template_name=${cats_nsg_templates['template3']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template3']['port2']['name']}
    #P3 
    Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template3']['port3']['name']}
    ...    physicalName=port3
    ...    portType=ACCESS
    ...    VLANRange=0-4094
    ...    cats_nsg_template_name=${cats_nsg_templates['template3']['name']}

    Create VLAN Template in NSG Port Template
    ...    value=${cats_nsg_matrix_spirent_vlan}
    ...    cats_nsg_template_name=${cats_nsg_templates['template3']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template3']['port3']['name']}	

Add VSC Profile to port1 of NSG Template #3
    Associate VSC Profile With NSG VLAN Template
    ...    cats_vlan_id=${cats_internet_uplink1_vlan}
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template3']['port1']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template3']['name']}

Create Uplink Connection to VLAN 200 of port1 of NSG Template #3
    Create Uplink Connection in NSG Vlan Template
    ...    mode=Dynamic
    ...    role=PRIMARY
    ...    cats_nsg_template_name=${cats_nsg_templates['template3']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template3']['port1']['name']}
    ...    cats_vlan_id=${cats_internet_uplink1_vlan}
	
# DUAL UPLINK & 3 ports

Create NSG Template #4 (DUAL UPLINK - 3 ports)
    Create NSG Template
    ...    name=${cats_nsg_templates['template4']['name']}
    ...    cats_infra_gw_profile_name=${cats_infra_gw_profile_name}
	
Associate Infra Access Profile with NSG Template #4  
    Associate Infra Access Profile with NSG Template    
    ...    cats_nsg_template_name=${cats_nsg_templates['template4']['name']}
    ...    cats_infra_access_profile_name=${cats_infra_access_profile_name}

Create Ports and VLANs in NSG Template #4
	#P1
    Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template4']['port1']['name']}
    ...    physicalName=port1
    ...    portType=NETWORK
    ...    cats_nsg_template_name=${cats_nsg_templates['template4']['name']}

    Create VLAN Template in NSG Port Template
    ...    value=${cats_internet_uplink1_vlan}
    ...    cats_nsg_template_name=${cats_nsg_templates['template4']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template4']['port1']['name']}
	#P2
    Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template4']['port2']['name']}
    ...    physicalName=port2
    ...    portType=NETWORK
    ...    VLANRange=0-4094
    ...    cats_nsg_template_name=${cats_nsg_templates['template4']['name']}

    Create VLAN Template in NSG Port Template
    ...    value=${cats_internet_uplink2_vlan}
    ...    cats_nsg_template_name=${cats_nsg_templates['template4']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template4']['port2']['name']}
    #P3 
    Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template4']['port3']['name']}
    ...    physicalName=port3
    ...    portType=ACCESS
    ...    VLANRange=0-4094
    ...    cats_nsg_template_name=${cats_nsg_templates['template4']['name']}

    Create VLAN Template in NSG Port Template
    ...    value=${cats_nsg_matrix_spirent_vlan}
    ...    cats_nsg_template_name=${cats_nsg_templates['template4']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template4']['port3']['name']}	

Add VSC Profile to port1 of NSG Template #4
    Associate VSC Profile With NSG VLAN Template
    ...    cats_vlan_id=${cats_internet_uplink1_vlan}
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template4']['port1']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template4']['name']}	
	
Add VSC Profile to port2 of NSG Template #4
    Associate VSC Profile With NSG VLAN Template
    ...    cats_vlan_id=${cats_internet_uplink2_vlan}
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template4']['port2']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template4']['name']}

Create Uplink Connection to VLAN 200 of port1 of NSG Template #4
    Create Uplink Connection in NSG Vlan Template
    ...    mode=Dynamic
    ...    role=PRIMARY
    ...    cats_nsg_template_name=${cats_nsg_templates['template4']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template4']['port1']['name']}
    ...    cats_vlan_id=${cats_internet_uplink1_vlan}

Create Uplink Connection to VLAN 201 of port2 of NSG Template #4
    Create Uplink Connection in NSG Vlan Template
    ...    mode=Dynamic
    ...    role=PRIMARY
    ...    cats_nsg_template_name=${cats_nsg_templates['template4']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template4']['port2']['name']}
    ...    cats_vlan_id=${cats_internet_uplink2_vlan}	

Login a User
    nuageusermgmt.Login User
    ...    cats_username=${cats_org_admin}
    ...    cats_password=${cats_org_admin_pwd}
    ...    cats_org_name=${cats_org_name}

Creating Instances for virtual NSGs
  Run Keyword If   ${NSGv01} == True    Create NSGv Instance 01
  Run Keyword If   ${NSGv02} == True    Create NSGv Instance 02
  Run Keyword If   ${NSGv03} == True    Create NSGv Instance 03
  Run Keyword If   ${NSGv04} == True    Create NSGv Instance 04
  Run Keyword If   ${NSGv05} == True    Create NSGv Instance 05
  Run Keyword If   ${NSGv06} == True    Create NSGv Instance 06
  Run Keyword If   ${NSGv07} == True    Create NSGv Instance 07
  Run Keyword If   ${NSGv08} == True    Create NSGv Instance 08
  Run Keyword If   ${NSGv09} == True    Create NSGv Instance 09
  Run Keyword If   ${NSGv10} == True    Create NSGv Instance 10
  Run Keyword If   ${NSGv11} == True    Create NSGv Instance 11
  Run Keyword If   ${NSGv12} == True    Create NSGv Instance 12
  Run Keyword If   ${NSGv13} == True    Create NSGv Instance 13
  Run Keyword If   ${NSGv14} == True    Create NSGv Instance 14
  Run Keyword If   ${NSGv15} == True    Create NSGv Instance 15
  Run Keyword If   ${NSGv16} == True    Create NSGv Instance 16
  Run Keyword If   ${NSGv17} == True    Create NSGv Instance 17
  Run Keyword If   ${NSGv18} == True    Create NSGv Instance 18
  Run Keyword If   ${NSGv19} == True    Create NSGv Instance 19
  Run Keyword If   ${NSGv20} == True    Create NSGv Instance 20
  Run Keyword If   ${NSGv21} == True    Create NSGv Instance 21
  Run Keyword If   ${NSGv22} == True    Create NSGv Instance 22
  Run Keyword If   ${NSGv23} == True    Create NSGv Instance 23
  Run Keyword If   ${NSGv24} == True    Create NSGv Instance 24
  Run Keyword If   ${NSGv25} == True    Create NSGv Instance 25
  Run Keyword If   ${NSGv26} == True    Create NSGv Instance 26
  Run Keyword If   ${NSGv27} == True    Create NSGv Instance 27
  Run Keyword If   ${NSGv28} == True    Create NSGv Instance 28
  Run Keyword If   ${NSGv29} == True    Create NSGv Instance 29
  Run Keyword If   ${NSGv30} == True    Create NSGv Instance 30
  Run Keyword If   ${NSGv31} == True    Create NSGv Instance 31
  Run Keyword If   ${NSGv32} == True    Create NSGv Instance 32
  Run Keyword If   ${NSGv33} == True    Create NSGv Instance 33
  Run Keyword If   ${NSGv34} == True    Create NSGv Instance 34
  Run Keyword If   ${NSGv35} == True    Create NSGv Instance 35
  Run Keyword If   ${NSGv36} == True    Create NSGv Instance 36
  Run Keyword If   ${NSGv37} == True    Create NSGv Instance 37
  Run Keyword If   ${NSGv38} == True    Create NSGv Instance 38
  Run Keyword If   ${NSGv39} == True    Create NSGv Instance 39
  Run Keyword If   ${NSGv40} == True    Create NSGv Instance 40
  Run Keyword If   ${NSGv41} == True    Create NSGv Instance 41
  Run Keyword If   ${NSGv42} == True    Create NSGv Instance 42
  Run Keyword If   ${NSGv43} == True    Create NSGv Instance 43
  Run Keyword If   ${NSGv44} == True    Create NSGv Instance 44
  Run Keyword If   ${NSGv45} == True    Create NSGv Instance 45
  Run Keyword If   ${NSGv46} == True    Create NSGv Instance 46
  Run Keyword If   ${NSGv47} == True    Create NSGv Instance 47
  Run Keyword If   ${NSGv48} == True    Create NSGv Instance 48
  Run Keyword If   ${NSGv49} == True    Create NSGv Instance 49
  Run Keyword If   ${NSGv50} == True    Create NSGv Instance 50
  
*** Keywords ***

#NSGv
Create NSGv Instance 01
    Create NSG
    ...    name=${cats_nsgs['nsg1']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 02
    Create NSG
    ...    name=${cats_nsgs['nsg2']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 03
    Create NSG
    ...    name=${cats_nsgs['nsg3']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 04
    Create NSG
    ...    name=${cats_nsgs['nsg4']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 05
    Create NSG
    ...    name=${cats_nsgs['nsg5']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 06
    Create NSG
    ...    name=${cats_nsgs['nsg6']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 07
    Create NSG
    ...    name=${cats_nsgs['nsg7']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 08
    Create NSG
    ...    name=${cats_nsgs['nsg8']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 09
    Create NSG
    ...    name=${cats_nsgs['nsg9']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 10
    Create NSG
    ...    name=${cats_nsgs['nsg10']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}
 
Create NSGv Instance 11
    Create NSG
    ...    name=${cats_nsgs['nsg11']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 12
    Create NSG
    ...    name=${cats_nsgs['nsg12']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 13
    Create NSG
    ...    name=${cats_nsgs['nsg13']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 14
    Create NSG
    ...    name=${cats_nsgs['nsg14']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 15
    Create NSG
    ...    name=${cats_nsgs['nsg15']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 16
    Create NSG
    ...    name=${cats_nsgs['nsg16']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 17
    Create NSG
    ...    name=${cats_nsgs['nsg17']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 18
    Create NSG
    ...    name=${cats_nsgs['nsg18']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 19
    Create NSG
    ...    name=${cats_nsgs['nsg19']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 20
    Create NSG
    ...    name=${cats_nsgs['nsg20']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 21
    Create NSG
    ...    name=${cats_nsgs['nsg21']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 22
    Create NSG
    ...    name=${cats_nsgs['nsg22']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 23
    Create NSG
    ...    name=${cats_nsgs['nsg23']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 24
    Create NSG
    ...    name=${cats_nsgs['nsg24']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 25
    Create NSG
    ...    name=${cats_nsgs['nsg25']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 26
    Create NSG
    ...    name=${cats_nsgs['nsg26']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 27
    Create NSG
    ...    name=${cats_nsgs['nsg27']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 28
    Create NSG
    ...    name=${cats_nsgs['nsg28']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 29
    Create NSG
    ...    name=${cats_nsgs['nsg29']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 30
    Create NSG 
    ...    name=${cats_nsgs['nsg30']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 31
    Create NSG
    ...    name=${cats_nsgs['nsg31']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 32
    Create NSG
    ...    name=${cats_nsgs['nsg32']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 33
    Create NSG
    ...    name=${cats_nsgs['nsg33']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 34
    Create NSG
    ...    name=${cats_nsgs['nsg34']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 35
    Create NSG
    ...    name=${cats_nsgs['nsg35']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}
	
Create NSGv Instance 36
    Create NSG
    ...    name=${cats_nsgs['nsg36']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}
	
Create NSGv Instance 37
    Create NSG
    ...    name=${cats_nsgs['nsg37']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}
	
Create NSGv Instance 38
    Create NSG
    ...    name=${cats_nsgs['nsg38']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}
	
Create NSGv Instance 39
    Create NSG
    ...    name=${cats_nsgs['nsg39']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}
	
Create NSGv Instance 40
    Create NSG
    ...    name=${cats_nsgs['nsg40']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}
	
Create NSGv Instance 41
    Create NSG
    ...    name=${cats_nsgs['nsg41']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}
    
Create NSGv Instance 42
    Create NSG
    ...    name=${cats_nsgs['nsg42']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}
	
Create NSGv Instance 43
    Create NSG
    ...    name=${cats_nsgs['nsg43']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 44
    Create NSG
    ...    name=${cats_nsgs['nsg44']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 45
    Create NSG
    ...    name=${cats_nsgs['nsg45']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 46
    Create NSG
    ...    name=${cats_nsgs['nsg46']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 47
    Create NSG
    ...    name=${cats_nsgs['nsg47']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 48
    Create NSG
    ...    name=${cats_nsgs['nsg48']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 49
    Create NSG
    ...    name=${cats_nsgs['nsg49']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}

Create NSGv Instance 50
    Create NSG
    ...    name=${cats_nsgs['nsg50']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template1']['name']}
    ...    cats_org_name=${cats_org_name}