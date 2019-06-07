*** Settings ***

Force Tags		  matrix
Documentation	  Test case for NSG physical provisioning 
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

#Create Infra GW Profile
#    Create Infrastructure GW Profile
#    ...    name=${cats_infra_gw_profile_name}
#    ...    proxyDNSName=${cats_util1_fqdn}

#Create VSC Profile
#    Create VSC Profile
#    ...    name=${cats_vsc_profile1_name}
#    ...    firstController=${cats_vsc1_ip}
#    ...    secondController=${cats_vsc2_ip}

#Creating Infrastructure Access Profile
#    Create Infrastructure Access Profile    
#    ...    name=${cats_infra_access_profile_name}
#    ...    userName=nuage
#    ...    password=Alcateldc

# SINGLE UPLINK & 6 ports

Create NSG Template #5 (physical SINGLE UPLINK - 6 ports)
    Create NSG Template
    ...    name=${cats_nsg_templates['template5']['name']}
    ...    cats_infra_gw_profile_name=${cats_infra_gw_profile_name}
	
Associate Infra Access Profile with NSG Template #5  
    Associate Infra Access Profile with NSG Template    
    ...    cats_nsg_template_name=${cats_nsg_templates['template5']['name']}
    ...    cats_infra_access_profile_name=${cats_infra_access_profile_name}

Create Ports and VLANs in NSG Template #5
	#P1
    Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template5']['port1']['name']}
    ...    physicalName=port1
    ...    portType=NETWORK
    ...    cats_nsg_template_name=${cats_nsg_templates['template5']['name']}

    Create VLAN Template in NSG Port Template
    ...    value=0
    ...    cats_nsg_template_name=${cats_nsg_templates['template5']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template5']['port1']['name']}
	#P2
    Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template5']['port2']['name']}
    ...    physicalName=port2
    ...    portType=ACCESS
    ...    VLANRange=0-4094
    ...    cats_nsg_template_name=${cats_nsg_templates['template5']['name']}

    Create VLAN Template in NSG Port Template
    ...    value=0
    ...    cats_nsg_template_name=${cats_nsg_templates['template5']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template5']['port2']['name']}
    #P3 
    Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template5']['port3']['name']}
    ...    physicalName=port3
    ...    portType=ACCESS
    ...    VLANRange=0-4094
    ...    cats_nsg_template_name=${cats_nsg_templates['template5']['name']}

    Create VLAN Template in NSG Port Template
	...    value=0
    ...    cats_nsg_template_name=${cats_nsg_templates['template5']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template5']['port3']['name']}
    #P4
    Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template5']['port4']['name']}
    ...    physicalName=port4
    ...    portType=ACCESS
    ...    VLANRange=0-4094
    ...    cats_nsg_template_name=${cats_nsg_templates['template5']['name']}

    Create VLAN Template in NSG Port Template
    ...    value=0
    ...    cats_nsg_template_name=${cats_nsg_templates['template5']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template5']['port4']['name']}
    #P5
	Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template5']['port5']['name']}
    ...    physicalName=port5
    ...    portType=ACCESS
    ...    VLANRange=0-4094
    ...    cats_nsg_template_name=${cats_nsg_templates['template5']['name']}

#   Create VLAN Template in NSG Port Template
#   ...    value=0
#   ...    cats_nsg_template_name=${cats_nsg_templates['template5']['name']}
#   ...    cats_nsg_port_template_name=${cats_nsg_templates['template5']['port5']['name']}
	#P6
	Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template5']['port6']['name']}
    ...    physicalName=port6
    ...    portType=ACCESS
    ...    VLANRange=0-4094
    ...    cats_nsg_template_name=${cats_nsg_templates['template5']['name']}

#    Create VLAN Template in NSG Port Template
#    ...    value=${cats_nsg_matrix_spirent_vlan}
#    ...    cats_nsg_template_name=${cats_nsg_templates['template5']['name']}
#    ...    cats_nsg_port_template_name=${cats_nsg_templates['template5']['port6']['name']}
	
Add VSC Profile to port1 of NSG Template #5
    Associate VSC Profile With NSG VLAN Template
    ...    cats_vlan_id=0
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template5']['port1']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template5']['name']}

# DUAL UPLINK & 6 ports

Create NSG Template #6 (physical DUAL UPLINK - 6 ports)
    Create NSG Template
    ...    name=${cats_nsg_templates['template6']['name']}
    ...    cats_infra_gw_profile_name=${cats_infra_gw_profile_name}
	
Associate Infra Access Profile with NSG Template #6  
    Associate Infra Access Profile with NSG Template    
    ...    cats_nsg_template_name=${cats_nsg_templates['template6']['name']}
    ...    cats_infra_access_profile_name=${cats_infra_access_profile_name}

Create Ports and VLANs in NSG Template #6
	#P1
    Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template6']['port1']['name']}
    ...    physicalName=port1
    ...    portType=NETWORK
    ...    cats_nsg_template_name=${cats_nsg_templates['template6']['name']}

    Create VLAN Template in NSG Port Template
    ...    value=0
    ...    cats_nsg_template_name=${cats_nsg_templates['template6']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template6']['port1']['name']}
	#P2
    Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template6']['port2']['name']}
    ...    physicalName=port2
    ...    portType=NETWORK
    ...    VLANRange=0-4094
    ...    cats_nsg_template_name=${cats_nsg_templates['template6']['name']}

    Create VLAN Template in NSG Port Template
    ...    value=0
    ...    cats_nsg_template_name=${cats_nsg_templates['template6']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template6']['port2']['name']}
    #P3 
    Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template6']['port3']['name']}
    ...    physicalName=port3
    ...    portType=ACCESS
    ...    VLANRange=0-4094
    ...    cats_nsg_template_name=${cats_nsg_templates['template6']['name']}

    Create VLAN Template in NSG Port Template
    ...    value=0
    ...    cats_nsg_template_name=${cats_nsg_templates['template6']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template6']['port3']['name']}
    #P4
    Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template6']['port4']['name']}
    ...    physicalName=port4
    ...    portType=ACCESS
    ...    VLANRange=0-4094
    ...    cats_nsg_template_name=${cats_nsg_templates['template6']['name']}

    Create VLAN Template in NSG Port Template
    ...    value=0
    ...    cats_nsg_template_name=${cats_nsg_templates['template6']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template6']['port4']['name']}
    #P5
	Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template6']['port5']['name']}
    ...    physicalName=port5
    ...    portType=ACCESS
    ...    VLANRange=0-4094
    ...    cats_nsg_template_name=${cats_nsg_templates['template6']['name']}

#   Create VLAN Template in NSG Port Template
#   ...    value=0
#   ...    cats_nsg_template_name=${cats_nsg_templates['template6']['name']}
#   ...    cats_nsg_port_template_name=${cats_nsg_templates['template6']['port5']['name']}
	#P6
	Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template6']['port6']['name']}
    ...    physicalName=port6
    ...    portType=ACCESS
    ...    VLANRange=0-4094
    ...    cats_nsg_template_name=${cats_nsg_templates['template6']['name']}

#    Create VLAN Template in NSG Port Template
#    ...    value=${cats_nsg_matrix_spirent_vlan}
#    ...    cats_nsg_template_name=${cats_nsg_templates['template6']['name']}
#    ...    cats_nsg_port_template_name=${cats_nsg_templates['template6']['port6']['name']}
	
Add VSC Profile to port1 of NSG Template #6
    Associate VSC Profile With NSG VLAN Template
    ...    cats_vlan_id=0
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template6']['port1']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template6']['name']}

Add VSC Profile to port2 of NSG Template #6
    Associate VSC Profile With NSG VLAN Template
    ...    cats_vlan_id=0
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template6']['port2']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template6']['name']}

# SINGLE UPLINK & 3 ports

Create NSG Template #7 (SINGLE UPLINK - 3 ports)
    Create NSG Template
    ...    name=${cats_nsg_templates['template7']['name']}
    ...    cats_infra_gw_profile_name=${cats_infra_gw_profile_name}
	
Associate Infra Access Profile with NSG Template #7 
    Associate Infra Access Profile with NSG Template    
    ...    cats_nsg_template_name=${cats_nsg_templates['template7']['name']}
    ...    cats_infra_access_profile_name=${cats_infra_access_profile_name}
	
Create Ports and VLANs in NSG Template #7
	#P1
    Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template7']['port1']['name']}
    ...    physicalName=port1
    ...    portType=NETWORK
    ...    cats_nsg_template_name=${cats_nsg_templates['template7']['name']}

    Create VLAN Template in NSG Port Template
    ...    value=0
    ...    cats_nsg_template_name=${cats_nsg_templates['template7']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template7']['port1']['name']}
	#P2
    Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template7']['port2']['name']}
    ...    physicalName=port2
    ...    portType=ACCESS
    ...    VLANRange=0-4094
    ...    cats_nsg_template_name=${cats_nsg_templates['template7']['name']}

#   Create VLAN Template in NSG Port Template
#   ...    value=0
#   ...    cats_nsg_template_name=${cats_nsg_templates['template7']['name']}
#   ...    cats_nsg_port_template_name=${cats_nsg_templates['template7']['port2']['name']}
    #P3 
    Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template7']['port3']['name']}
    ...    physicalName=port3
    ...    portType=ACCESS
    ...    VLANRange=0-4094
    ...    cats_nsg_template_name=${cats_nsg_templates['template7']['name']}

#    Create VLAN Template in NSG Port Template
#    ...    value=${cats_nsg_matrix_spirent_vlan}
#    ...    cats_nsg_template_name=${cats_nsg_templates['template7']['name']}
#    ...    cats_nsg_port_template_name=${cats_nsg_templates['template7']['port3']['name']}	

Add VSC Profile to port1 of NSG Template #7
    Associate VSC Profile With NSG VLAN Template
    ...    cats_vlan_id=0
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template7']['port1']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template7']['name']}
	
# DUAL UPLINK & 3 ports

Create NSG Template #8 (DUAL UPLINK - 3 ports)
    Create NSG Template
    ...    name=${cats_nsg_templates['template8']['name']}
    ...    cats_infra_gw_profile_name=${cats_infra_gw_profile_name}
	
Associate Infra Access Profile with NSG Template #8  
    Associate Infra Access Profile with NSG Template    
    ...    cats_nsg_template_name=${cats_nsg_templates['template8']['name']}
    ...    cats_infra_access_profile_name=${cats_infra_access_profile_name}

Create Ports and VLANs in NSG Template #8
	#P1
    Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template8']['port1']['name']}
    ...    physicalName=port1
    ...    portType=NETWORK
    ...    cats_nsg_template_name=${cats_nsg_templates['template8']['name']}

    Create VLAN Template in NSG Port Template
    ...    value=0
    ...    cats_nsg_template_name=${cats_nsg_templates['template8']['name']}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template8']['port1']['name']}
	#P2
    Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template8']['port2']['name']}
    ...    physicalName=port2
    ...    portType=NETWORK
    ...    VLANRange=0-4094
    ...    cats_nsg_template_name=${cats_nsg_templates['template8']['name']}

#   Create VLAN Template in NSG Port Template
#   ...    value=0
#   ...    cats_nsg_template_name=${cats_nsg_templates['template8']['name']}
#   ...    cats_nsg_port_template_name=${cats_nsg_templates['template8']['port2']['name']}
    #P3 
    Create Port Template in NSG Template
    ...    name=${cats_nsg_templates['template8']['port3']['name']}
    ...    physicalName=port3
    ...    portType=ACCESS
    ...    VLANRange=0-4094
    ...    cats_nsg_template_name=${cats_nsg_templates['template8']['name']}

#    Create VLAN Template in NSG Port Template
#    ...    value=${cats_nsg_matrix_spirent_vlan}
#    ...    cats_nsg_template_name=${cats_nsg_templates['template8']['name']}
#    ...    cats_nsg_port_template_name=${cats_nsg_templates['template8']['port3']['name']}	

Add VSC Profile to port1 of NSG Template #8
    Associate VSC Profile With NSG VLAN Template
    ...    cats_vlan_id=0
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template8']['port1']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template8']['name']}	
	
Add VSC Profile to port2 of NSG Template #8
    Associate VSC Profile With NSG VLAN Template
    ...    cats_vlan_id=0
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_nsg_port_template_name=${cats_nsg_templates['template8']['port2']['name']}
    ...    cats_nsg_template_name=${cats_nsg_templates['template8']['name']}

#Login a User
#    nuageusermgmt.Login User
#    ...    cats_username=${cats_org_admin}
#    ...    cats_password=${cats_org_admin_pwd}
#    ...    cats_org_name=${cats_org_name}

Creating Instances for D0 NSGs
  Run Keyword If   ${NSG-C_1} == True       Create NSG Instance NSG-C_1
  Run Keyword If   ${NSG-C_2} == True       Create NSG Instance NSG-C_2
  Run Keyword If   ${NSG-C_3} == True       Create NSG Instance NSG-C_3
  Run Keyword If   ${NSG-C_4} == True       Create NSG Instance NSG-C_4
  Run Keyword If   ${NSG-E_1} == True       Create NSG Instance NSG-E_1
  Run Keyword If   ${NSG-E_2} == True       Create NSG Instance NSG-E_2
  Run Keyword If   ${NSG-E200_1} == True    Create NSG Instance NSG-E200_1
  Run Keyword If   ${NSG-E200_2} == True    Create NSG Instance NSG-E200_2
  Run Keyword If   ${NSG-E200_3} == True    Create NSG Instance NSG-E200_3
  Run Keyword If   ${NSG-E200_4} == True    Create NSG Instance NSG-E200_4
  Run Keyword If   ${NSG-E300_1} == True    Create NSG Instance NSG-E300_1
  Run Keyword If   ${NSG-E300_2} == True    Create NSG Instance NSG-E300_2
  Run Keyword If   ${NSG-X200_1} == True    Create NSG Instance NSG-X200_1
  Run Keyword If   ${NSG-X200_2} == True    Create NSG Instance NSG-X200_2
  Run Keyword If   ${NSG-X_1} == True       Create NSG Instance NSG-X_1
  Run Keyword If   ${NSG-X_2} == True       Create NSG Instance NSG-X_2
  Run Keyword If   ${NSG-X_3} == True       Create NSG Instance NSG-X_3
  Run Keyword If   ${NSG-X_4} == True       Create NSG Instance NSG-X_4
  Run Keyword If   ${NSG-E202_1} == True    Create NSG Instance NSG-E202_1
  Run Keyword If   ${NSG-E202_2} == True    Create NSG Instance NSG-E202_2
  Run Keyword If   ${NSG-E206_1} == True    Create NSG Instance NSG-E206_1
  Run Keyword If   ${NSG-E206_2} == True    Create NSG Instance NSG-E206_2
  Run Keyword If   ${NSG-E306_1} == True    Create NSG Instance NSG-E306_1
  Run Keyword If   ${NSG-E306_2} == True    Create NSG Instance NSG-E306_2
	
Associating VSC Profile for D0 NSGs
  Run Keyword If   ${NSG-C_1} == True       Associating VSC Profile to Port 1 NSG-C_1
  Run Keyword If   ${NSG-C_2} == True       Associating VSC Profile to Port 1 NSG-C_2
  Run Keyword If   ${NSG-C_3} == True       Associating VSC Profile to Port 1 NSG-C_3
  Run Keyword If   ${NSG-C_4} == True       Associating VSC Profile to Port 1 NSG-C_4
  Run Keyword If   ${NSG-E_1} == True       Associating VSC Profile to Port 1 & 2 NSG-E_1
  Run Keyword If   ${NSG-E_2} == True       Associating VSC Profile to Port 1 & 2 NSG-E_2
  Run Keyword If   ${NSG-E200_1} == True    Associating VSC Profile to Port 1 NSG-E200_1
  Run Keyword If   ${NSG-E200_2} == True    Associating VSC Profile to Port 1 NSG-E200_2
  Run Keyword If   ${NSG-E200_3} == True    Associating VSC Profile to Port 1 NSG-E200_3
  Run Keyword If   ${NSG-E200_4} == True    Associating VSC Profile to Port 1 NSG-E200_4
  Run Keyword If   ${NSG-E300_1} == True    Associating VSC Profile to Port 1 NSG-E300_1
  Run Keyword If   ${NSG-E300_2} == True    Associating VSC Profile to Port 1 NSG-E300_2
  Run Keyword If   ${NSG-X200_1} == True    Associating VSC Profile to Port 1 NSG-X200_1
  Run Keyword If   ${NSG-X200_2} == True    Associating VSC Profile to Port 1 NSG-X200_2
  Run Keyword If   ${NSG-X_1} == True       Associating VSC Profile to Port 1 NSG-X_1
  Run Keyword If   ${NSG-X_2} == True       Associating VSC Profile to Port 1 NSG-X_2
  Run Keyword If   ${NSG-X_3} == True       Associating VSC Profile to Port 1 NSG-X_3
  Run Keyword If   ${NSG-X_4} == True       Associating VSC Profile to Port 1 NSG-X_4
  Run Keyword If   ${NSG-E202_1} == True    Associating VSC Profile to Port 1 NSG-E202_1
  Run Keyword If   ${NSG-E202_2} == True    Associating VSC Profile to Port 1 NSG-E202_2
  Run Keyword If   ${NSG-E206_1} == True    Associating VSC Profile to Port 1 NSG-E206_1
  Run Keyword If   ${NSG-E206_2} == True    Associating VSC Profile to Port 1 NSG-E206_2
  Run Keyword If   ${NSG-E306_1} == True    Associating VSC Profile to Port 1 NSG-E306_1
  Run Keyword If   ${NSG-E306_2} == True    Associating VSC Profile to Port 1 NSG-E306_2
  
Creating Uplink Connections for D0 NSGs
  Run Keyword If   ${NSG-C_1} == True       Creating Single Uplink Connection NSG-C_1
  Run Keyword If   ${NSG-C_2} == True       Creating Single Uplink Connection NSG-C_2
  Run Keyword If   ${NSG-C_3} == True       Creating Single Uplink Connection NSG-C_3
  Run Keyword If   ${NSG-C_4} == True       Creating Single Uplink Connection NSG-C_4
  Run Keyword If   ${NSG-E_1} == True       Creating Dual Uplink Connection NSG-E_1
  Run Keyword If   ${NSG-E_2} == True       Creating Dual Uplink Connection NSG-E_2
  Run Keyword If   ${NSG-E200_1} == True    Creating Single Uplink Connection NSG-E200_1
  Run Keyword If   ${NSG-E200_2} == True    Creating Single Uplink Connection NSG-E200_2
  Run Keyword If   ${NSG-E200_3} == True    Creating Single Uplink Connection NSG-E200_3
  Run Keyword If   ${NSG-E200_4} == True    Creating Single Uplink Connection NSG-E200_4
  Run Keyword If   ${NSG-E300_1} == True    Creating Single Uplink Connection NSG-E300_1
  Run Keyword If   ${NSG-E300_2} == True    Creating Single Uplink Connection NSG-E300_2
  Run Keyword If   ${NSG-X200_1} == True    Creating Single Uplink Connection NSG-X200_1
  Run Keyword If   ${NSG-X200_2} == True    Creating Single Uplink Connection NSG-X200_2
  Run Keyword If   ${NSG-X_1} == True       Creating Single Uplink Connection NSG-X_1
  Run Keyword If   ${NSG-X_2} == True       Creating Single Uplink Connection NSG-X_2
  Run Keyword If   ${NSG-X_3} == True       Creating Single Uplink Connection NSG-X_3
  Run Keyword If   ${NSG-X_4} == True       Creating Single Uplink Connection NSG-X_4
  Run Keyword If   ${NSG-E202_1} == True    Creating Single Uplink Connection NSG-E202_1
  Run Keyword If   ${NSG-E202_2} == True    Creating Single Uplink Connection NSG-E202_2
  Run Keyword If   ${NSG-E206_1} == True    Creating Single Uplink Connection NSG-E206_1
  Run Keyword If   ${NSG-E206_2} == True    Creating Single Uplink Connection NSG-E206_2
  Run Keyword If   ${NSG-E306_1} == True    Creating Single Uplink Connection NSG-E306_1
  Run Keyword If   ${NSG-E306_2} == True    Creating Single Uplink Connection NSG-E306_2
  
*** Keywords ***

Create NSG Instance NSG-C_1
    Create NSG
    ...    name=${cats_NSG-C-1_name}
	...    description=TGHZ
    ...    cats_nsg_template_name=${cats_nsg_templates['template7']['name']}
    ...    cats_org_name=${cats_org_name}
	Create VLAN in NSG Port
	...    value=0
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-C-1_name}
	...    cats_nsg_port_name=P1
	Create VLAN in NSG Port
	...    value=204
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-C-1_name}
	...    cats_nsg_port_name=P3
	
Associating VSC Profile to Port 1 NSG-C_1  
    Associate VSC Profile with NSG VLAN    
    ...    cats_vlan_id=0
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_nsg_name=${cats_NSG-C-1_name}
    ...    cats_nsg_port_name=P1
    
Creating Single Uplink Connection NSG-C_1
    Create Uplink Connection in NSG Vlan 
    ...    mode=Static
    ...    role=PRIMARY
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-C-1_name}
	...    cats_nsg_port_name=P1
    ...    cats_vlan_id=0
    ...    address=${cats_NSGc-1_address_primary}
    ...    gateway=${cats_NSGc-1_gateway_primary}
	...    netmask=${cats_NSGxxx_netmask}
    ...    DNSAddress=${cats_NSGxxx_DNSAddress}  
	
	
Create NSG Instance NSG-C_2
    Create NSG
    ...    name=${cats_NSG-C-2_name}
    ...    description=TGHT
    ...    cats_nsg_template_name=${cats_nsg_templates['template7']['name']}
    ...    cats_org_name=${cats_org_name}
	Create VLAN in NSG Port
	...    value=0
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-C-2_name}
	...    cats_nsg_port_name=P1
	Create VLAN in NSG Port
	...    value=205
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-C-2_name}
	...    cats_nsg_port_name=P3

Associating VSC Profile to Port 1 NSG-C_2  
    Associate VSC Profile with NSG VLAN    
    ...    cats_vlan_id=0
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_nsg_name=${cats_NSG-C-2_name}
    ...    cats_nsg_port_name=P1
    
Creating Single Uplink Connection NSG-C_2
    Create Uplink Connection in NSG Vlan 
    ...    mode=Static
    ...    role=PRIMARY
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-C-2_name}
	...    cats_nsg_port_name=P1
    ...    cats_vlan_id=0
    ...    address=${cats_NSGc-2_address_primary}
    ...    gateway=${cats_NSGc-2_gateway_primary}
	...    netmask=${cats_NSGxxx_netmask}
    ...    DNSAddress=${cats_NSGxxx_DNSAddress} 	

	
Create NSG Instance NSG-C_3
    Create NSG
    ...    name=${cats_NSG-C-3_name}
	...    description=xxxx
    ...    cats_nsg_template_name=${cats_nsg_templates['template7']['name']}
    ...    cats_org_name=${cats_org_name}
	Create VLAN in NSG Port
	...    value=0
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-C-3_name}
	...    cats_nsg_port_name=P1
	Create VLAN in NSG Port
	...    value=233
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-C-3_name}
	...    cats_nsg_port_name=P3
	
Associating VSC Profile to Port 1 NSG-C_3  
    Associate VSC Profile with NSG VLAN    
    ...    cats_vlan_id=0
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_nsg_name=${cats_NSG-C-3_name}
    ...    cats_nsg_port_name=P1
    
Creating Single Uplink Connection NSG-C_3
    Create Uplink Connection in NSG Vlan 
    ...    mode=Static
    ...    role=PRIMARY
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-C-3_name}
	...    cats_nsg_port_name=P1
    ...    cats_vlan_id=0
    ...    address=${cats_NSGc-3_address_primary}
    ...    gateway=${cats_NSGc-3_gateway_primary}
	...    netmask=${cats_NSGxxx_netmask}
    ...    DNSAddress=${cats_NSGxxx_DNSAddress}  
	
	
Create NSG Instance NSG-C_4
    Create NSG
    ...    name=${cats_NSG-C-4_name}
    ...    description=xxxx
    ...    cats_nsg_template_name=${cats_nsg_templates['template7']['name']}
    ...    cats_org_name=${cats_org_name}
	Create VLAN in NSG Port
	...    value=0
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-C-4_name}
	...    cats_nsg_port_name=P1
	Create VLAN in NSG Port
	...    value=234
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-C-4_name}
	...    cats_nsg_port_name=P3

Associating VSC Profile to Port 1 NSG-C_4  
    Associate VSC Profile with NSG VLAN    
    ...    cats_vlan_id=0
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_nsg_name=${cats_NSG-C-4_name}
    ...    cats_nsg_port_name=P1
    
Creating Single Uplink Connection NSG-C_4
    Create Uplink Connection in NSG Vlan 
    ...    mode=Static
    ...    role=PRIMARY
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-C-4_name}
	...    cats_nsg_port_name=P1
    ...    cats_vlan_id=0
    ...    address=${cats_NSGc-4_address_primary}
    ...    gateway=${cats_NSGc-4_gateway_primary}
	...    netmask=${cats_NSGxxx_netmask}
    ...    DNSAddress=${cats_NSGxxx_DNSAddress} 	
	
	
Create NSG Instance NSG-E_1
    Create NSG
    ...    name=${cats_NSG-E-1_name}
	...    description=TDR4
    ...    cats_nsg_template_name=${cats_nsg_templates['template6']['name']}
    ...    cats_org_name=${cats_org_name}
	Create VLAN in NSG Port
	...    value=0
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E-1_name}
	...    cats_nsg_port_name=P1
	Create VLAN in NSG Port
	...    value=0
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E-1_name}
	...    cats_nsg_port_name=P2
	Create VLAN in NSG Port
	...    value=207
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E-1_name}
	...    cats_nsg_port_name=P6

Associating VSC Profile to Port 1 & 2 NSG-E_1  
    Associate VSC Profile with NSG VLAN    
    ...    cats_vlan_id=0
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_nsg_name=${cats_NSG-E-1_name}
    ...    cats_nsg_port_name=P1
    Associate VSC Profile with NSG VLAN    
    ...    cats_vlan_id=0
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_nsg_name=${cats_NSG-E-1_name}
    ...    cats_nsg_port_name=P2
	
Creating Dual Uplink Connection NSG-E_1
    Create Uplink Connection in NSG Vlan 
    ...    mode=Static
    ...    role=PRIMARY
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E-1_name}
	...    cats_nsg_port_name=P1
    ...    cats_vlan_id=0
    ...    address=${cats_NSGe-1-1_address_primary}
    ...    gateway=${cats_NSGe-1-1_gateway_primary}
	...    netmask=${cats_NSGxxx_netmask}
    ...    DNSAddress=${cats_NSGxxx_DNSAddress}  
    Create Uplink Connection in NSG Vlan 
    ...    mode=Static
    ...    role=PRIMARY
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E-1_name}
	...    cats_nsg_port_name=P2
    ...    cats_vlan_id=0
    ...    address=${cats_NSGe-1-2_address_primary}
    ...    gateway=${cats_NSGe-1-2_gateway_primary}
	...    netmask=${cats_NSGxxx_netmask}
    ...    DNSAddress=${cats_NSGxxx_DNSAddress}	
	
	
Create NSG Instance NSG-E_2
    Create NSG
    ...    name=${cats_NSG-E-2_name}
    ...    description=TDR5
    ...    cats_nsg_template_name=${cats_nsg_templates['template6']['name']}
    ...    cats_org_name=${cats_org_name}
	Create VLAN in NSG Port
	...    value=0
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E-2_name}
	...    cats_nsg_port_name=P1
	Create VLAN in NSG Port
	...    value=0
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E-2_name}
	...    cats_nsg_port_name=P2
	Create VLAN in NSG Port
	...    value=208
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E-2_name}
	...    cats_nsg_port_name=P6

Associating VSC Profile to Port 1 & 2 NSG-E_2  
    Associate VSC Profile with NSG VLAN    
    ...    cats_vlan_id=0
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_nsg_name=${cats_NSG-E-2_name}
    ...    cats_nsg_port_name=P1
    Associate VSC Profile with NSG VLAN    
    ...    cats_vlan_id=0
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_nsg_name=${cats_NSG-E-2_name}
    ...    cats_nsg_port_name=P2
    
Creating Dual Uplink Connection NSG-E_2
    Create Uplink Connection in NSG Vlan 
    ...    mode=Static
    ...    role=PRIMARY
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E-2_name}
	...    cats_nsg_port_name=P1
    ...    cats_vlan_id=0
    ...    address=${cats_NSGe-2-1_address_primary}
    ...    gateway=${cats_NSGe-2-1_gateway_primary}
	...    netmask=${cats_NSGxxx_netmask}
    ...    DNSAddress=${cats_NSGxxx_DNSAddress} 	
	Create Uplink Connection in NSG Vlan 
    ...    mode=Static
    ...    role=PRIMARY
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E-2_name}
	...    cats_nsg_port_name=P2
    ...    cats_vlan_id=0
    ...    address=${cats_NSGe-2-2_address_primary}
    ...    gateway=${cats_NSGe-2-2_gateway_primary}
	...    netmask=${cats_NSGxxx_netmask}
    ...    DNSAddress=${cats_NSGxxx_DNSAddress} 	
	
	
Create NSG Instance NSG-E200_1
    Create NSG
    ...    name=${cats_NSG-E200-1_name}
	...    description=TGWH
    ...    cats_nsg_template_name=${cats_nsg_templates['template5']['name']}
    ...    cats_org_name=${cats_org_name}
	Create VLAN in NSG Port
	...    value=0
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E200-1_name}
	...    cats_nsg_port_name=P1
	Create VLAN in NSG Port
	...    value=210
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E200-1_name}
	...    cats_nsg_port_name=P6

Associating VSC Profile to Port 1 NSG-E200_1  
    Associate VSC Profile with NSG VLAN    
    ...    cats_vlan_id=0
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_nsg_name=${cats_NSG-E200-1_name}
    ...    cats_nsg_port_name=P1
    
Creating Single Uplink Connection NSG-E200_1
    Create Uplink Connection in NSG Vlan 
    ...    mode=Static
    ...    role=PRIMARY
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E200-1_name}
	...    cats_nsg_port_name=P1
    ...    cats_vlan_id=0
    ...    address=${cats_NSGe200-1_address_primary}
    ...    gateway=${cats_NSGe200-1_gateway_primary}
	...    netmask=${cats_NSGxxx_netmask}
    ...    DNSAddress=${cats_NSGxxx_DNSAddress} 

	
Create NSG Instance NSG-E200_2
    Create NSG
    ...    name=${cats_NSG-E200-2_name}
    ...    description=TGWF
    ...    cats_nsg_template_name=${cats_nsg_templates['template5']['name']}
    ...    cats_org_name=${cats_org_name}
	Create VLAN in NSG Port
	...    value=0
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E200-2_name}
	...    cats_nsg_port_name=P1
	Create VLAN in NSG Port
	...    value=211
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E200-2_name}
	...    cats_nsg_port_name=P6

Associating VSC Profile to Port 1 NSG-E200_2  
    Associate VSC Profile with NSG VLAN    
    ...    cats_vlan_id=0
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_nsg_name=${cats_NSG-E200-2_name}
    ...    cats_nsg_port_name=P1
    
Creating Single Uplink Connection NSG-E200_2
    Create Uplink Connection in NSG Vlan 
    ...    mode=Static
    ...    role=PRIMARY
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E200-2_name}
	...    cats_nsg_port_name=P1
    ...    cats_vlan_id=0
    ...    address=${cats_NSGe200-2_address_primary}
    ...    gateway=${cats_NSGe200-2_gateway_primary}
	...    netmask=${cats_NSGxxx_netmask}
    ...    DNSAddress=${cats_NSGxxx_DNSAddress} 	
	

Create NSG Instance NSG-E200_3
    Create NSG
    ...    name=${cats_NSG-E200-3_name}
	...    description=xxxx
    ...    cats_nsg_template_name=${cats_nsg_templates['template5']['name']}
    ...    cats_org_name=${cats_org_name}
	Create VLAN in NSG Port
	...    value=0
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E200-3_name}
	...    cats_nsg_port_name=P1
	Create VLAN in NSG Port
	...    value=236
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E200-3_name}
	...    cats_nsg_port_name=P6

Associating VSC Profile to Port 1 NSG-E200_3  
    Associate VSC Profile with NSG VLAN    
    ...    cats_vlan_id=0
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_nsg_name=${cats_NSG-E200-3_name}
    ...    cats_nsg_port_name=P1
    
Creating Single Uplink Connection NSG-E200_3
    Create Uplink Connection in NSG Vlan 
    ...    mode=Static
    ...    role=PRIMARY
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E200-3_name}
	...    cats_nsg_port_name=P1
    ...    cats_vlan_id=0
    ...    address=${cats_NSGe200-3_address_primary}
    ...    gateway=${cats_NSGe200-3_gateway_primary}
	...    netmask=${cats_NSGxxx_netmask}
    ...    DNSAddress=${cats_NSGxxx_DNSAddress} 

	
Create NSG Instance NSG-E200_4
    Create NSG
    ...    name=${cats_NSG-E200-4_name}
    ...    description=xxxx
    ...    cats_nsg_template_name=${cats_nsg_templates['template5']['name']}
    ...    cats_org_name=${cats_org_name}
	Create VLAN in NSG Port
	...    value=0
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E200-4_name}
	...    cats_nsg_port_name=P1
	Create VLAN in NSG Port
	...    value=237
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E200-4_name}
	...    cats_nsg_port_name=P6

Associating VSC Profile to Port 1 NSG-E200_4  
    Associate VSC Profile with NSG VLAN    
    ...    cats_vlan_id=0
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_nsg_name=${cats_NSG-E200-4_name}
    ...    cats_nsg_port_name=P1
    
Creating Single Uplink Connection NSG-E200_4
    Create Uplink Connection in NSG Vlan 
    ...    mode=Static
    ...    role=PRIMARY
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E200-4_name}
	...    cats_nsg_port_name=P1
    ...    cats_vlan_id=0
    ...    address=${cats_NSGe200-4_address_primary}
    ...    gateway=${cats_NSGe200-4_gateway_primary}
	...    netmask=${cats_NSGxxx_netmask}
    ...    DNSAddress=${cats_NSGxxx_DNSAddress} 
	
	
Create NSG Instance NSG-E300_1
    Create NSG
    ...    name=${cats_NSG-E300-1_name}
	...    description=TGUU
    ...    cats_nsg_template_name=${cats_nsg_templates['template5']['name']}
    ...    cats_org_name=${cats_org_name}
	Create VLAN in NSG Port
	...    value=0
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E300-1_name}
	...    cats_nsg_port_name=P1
	Create VLAN in NSG Port
	...    value=213
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E300-1_name}
	...    cats_nsg_port_name=P6

Associating VSC Profile to Port 1 NSG-E300_1  
    Associate VSC Profile with NSG VLAN    
    ...    cats_vlan_id=0
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_nsg_name=${cats_NSG-E300-1_name}
    ...    cats_nsg_port_name=P1
    
Creating Single Uplink Connection NSG-E300_1
    Create Uplink Connection in NSG Vlan 
    ...    mode=Static
    ...    role=PRIMARY
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E300-1_name}
	...    cats_nsg_port_name=P1
    ...    cats_vlan_id=0
    ...    address=${cats_NSGe300-1_address_primary}
    ...    gateway=${cats_NSGe300-1_gateway_primary}
	...    netmask=${cats_NSGxxx_netmask}
    ...    DNSAddress=${cats_NSGxxx_DNSAddress} 

	
Create NSG Instance NSG-E300_2
    Create NSG
    ...    name=${cats_NSG-E300-2_name}
    ...    description=TGUX
    ...    cats_nsg_template_name=${cats_nsg_templates['template5']['name']}
    ...    cats_org_name=${cats_org_name}
	Create VLAN in NSG Port
	...    value=0
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E300-2_name}
	...    cats_nsg_port_name=P1
	Create VLAN in NSG Port
	...    value=214
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E300-2_name}
	...    cats_nsg_port_name=P6

Associating VSC Profile to Port 1 NSG-E300_2  
    Associate VSC Profile with NSG VLAN    
    ...    cats_vlan_id=0
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_nsg_name=${cats_NSG-E300-2_name}
    ...    cats_nsg_port_name=P1
    
Creating Single Uplink Connection NSG-E300_2
    Create Uplink Connection in NSG Vlan 
    ...    mode=Static
    ...    role=PRIMARY
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E300-2_name}
	...    cats_nsg_port_name=P1
    ...    cats_vlan_id=0
    ...    address=${cats_NSGe300-2_address_primary}
    ...    gateway=${cats_NSGe300-2_gateway_primary}
	...    netmask=${cats_NSGxxx_netmask}
    ...    DNSAddress=${cats_NSGxxx_DNSAddress} 
	
	
Create NSG Instance NSG-X200_1
    Create NSG
    ...    name=${cats_NSG-X200-1_name}
	...    description=TGWL
    ...    cats_nsg_template_name=${cats_nsg_templates['template5']['name']}
    ...    cats_org_name=${cats_org_name}
	Create VLAN in NSG Port
	...    value=0
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-X200-1_name}
	...    cats_nsg_port_name=P1
	Create VLAN in NSG Port
	...    value=216
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-X200-1_name}
	...    cats_nsg_port_name=P6

Associating VSC Profile to Port 1 NSG-X200_1  
    Associate VSC Profile with NSG VLAN    
    ...    cats_vlan_id=0
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_nsg_name=${cats_NSG-X200-1_name}
    ...    cats_nsg_port_name=P1
    
Creating Single Uplink Connection NSG-X200_1
    Create Uplink Connection in NSG Vlan 
    ...    mode=Static
    ...    role=PRIMARY
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-X200-1_name}
	...    cats_nsg_port_name=P1
    ...    cats_vlan_id=0
    ...    address=${cats_NSGx200-1_address_primary}
    ...    gateway=${cats_NSGx200-1_gateway_primary}
	...    netmask=${cats_NSGxxx_netmask}
    ...    DNSAddress=${cats_NSGxxx_DNSAddress} 
	
	
Create NSG Instance NSG-X200_2
    Create NSG
    ...    name=${cats_NSG-X200-2_name}
    ...    description=TGWM
    ...    cats_nsg_template_name=${cats_nsg_templates['template5']['name']}
    ...    cats_org_name=${cats_org_name}
	Create VLAN in NSG Port
	...    value=0
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-X200-2_name}
	...    cats_nsg_port_name=P1
	Create VLAN in NSG Port
	...    value=217
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-X200-2_name}
	...    cats_nsg_port_name=P6

Associating VSC Profile to Port 1 NSG-X200_2  
    Associate VSC Profile with NSG VLAN    
    ...    cats_vlan_id=0
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_nsg_name=${cats_NSG-X200-2_name}
    ...    cats_nsg_port_name=P1
    
Creating Single Uplink Connection NSG-X200_2
    Create Uplink Connection in NSG Vlan 
    ...    mode=Static
    ...    role=PRIMARY
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-X200-2_name}
	...    cats_nsg_port_name=P1
    ...    cats_vlan_id=0
    ...    address=${cats_NSGx200-2_address_primary}
    ...    gateway=${cats_NSGx200-2_gateway_primary}
	...    netmask=${cats_NSGxxx_netmask}
    ...    DNSAddress=${cats_NSGxxx_DNSAddress} 
	
	
Create NSG Instance NSG-X_1
    Create NSG
    ...    name=${cats_NSG-X-1_name}
	...    description=TF1P
    ...    cats_nsg_template_name=${cats_nsg_templates['template5']['name']}
    ...    cats_org_name=${cats_org_name}
	Create VLAN in NSG Port
	...    value=0
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-X-1_name}
	...    cats_nsg_port_name=P1
	Create VLAN in NSG Port
	...    value=219
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-X-1_name}
	...    cats_nsg_port_name=P6

Associating VSC Profile to Port 1 NSG-X_1  
    Associate VSC Profile with NSG VLAN    
    ...    cats_vlan_id=0
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_nsg_name=${cats_NSG-X-1_name}
    ...    cats_nsg_port_name=P1
    
Creating Single Uplink Connection NSG-X_1
    Create Uplink Connection in NSG Vlan 
    ...    mode=Static
    ...    role=PRIMARY
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-X-1_name}
	...    cats_nsg_port_name=P1
    ...    cats_vlan_id=0
    ...    address=${cats_NSGx-1_address_primary}
    ...    gateway=${cats_NSGx-1_gateway_primary}
	...    netmask=${cats_NSGxxx_netmask}
    ...    DNSAddress=${cats_NSGxxx_DNSAddress}  
	
	
Create NSG Instance NSG-X_2
    Create NSG
    ...    name=${cats_NSG-X-2_name}
    ...    description=TF27
    ...    cats_nsg_template_name=${cats_nsg_templates['template5']['name']}
    ...    cats_org_name=${cats_org_name}
	Create VLAN in NSG Port
	...    value=0
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-X-2_name}
	...    cats_nsg_port_name=P1
	Create VLAN in NSG Port
	...    value=220
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-X-2_name}
	...    cats_nsg_port_name=P6
	
Associating VSC Profile to Port 1 NSG-X_2  
    Associate VSC Profile with NSG VLAN    
    ...    cats_vlan_id=0
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_nsg_name=${cats_NSG-X-2_name}
    ...    cats_nsg_port_name=P1
    
Creating Single Uplink Connection NSG-X_2
    Create Uplink Connection in NSG Vlan 
    ...    mode=Static
    ...    role=PRIMARY
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-X-2_name}
	...    cats_nsg_port_name=P1
    ...    cats_vlan_id=0
    ...    address=${cats_NSGx-2_address_primary}
    ...    gateway=${cats_NSGx-2_gateway_primary}
	...    netmask=${cats_NSGxxx_netmask}
    ...    DNSAddress=${cats_NSGxxx_DNSAddress}  
	
	
Create NSG Instance NSG-X_3
    Create NSG
    ...    name=${cats_NSG-X-3_name}
	...    description=xxxx
    ...    cats_nsg_template_name=${cats_nsg_templates['template5']['name']}
    ...    cats_org_name=${cats_org_name}
	Create VLAN in NSG Port
	...    value=0
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-X-3_name}
	...    cats_nsg_port_name=P1
	Create VLAN in NSG Port
	...    value=221
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-X-3_name}
	...    cats_nsg_port_name=P6

Associating VSC Profile to Port 1 NSG-X_3  
    Associate VSC Profile with NSG VLAN    
    ...    cats_vlan_id=0
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_nsg_name=${cats_NSG-X-3_name}
    ...    cats_nsg_port_name=P1
    
Creating Single Uplink Connection NSG-X_3
    Create Uplink Connection in NSG Vlan 
    ...    mode=Static
    ...    role=PRIMARY
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-X-3_name}
	...    cats_nsg_port_name=P1
    ...    cats_vlan_id=0
    ...    address=${cats_NSGx-3_address_primary}
    ...    gateway=${cats_NSGx-3_gateway_primary}
	...    netmask=${cats_NSGxxx_netmask}
    ...    DNSAddress=${cats_NSGxxx_DNSAddress}  
	
	
Create NSG Instance NSG-X_4
    Create NSG
    ...    name=${cats_NSG-X-4_name}
    ...    description=xxxx
    ...    cats_nsg_template_name=${cats_nsg_templates['template5']['name']}
    ...    cats_org_name=${cats_org_name}
	Create VLAN in NSG Port
	...    value=0
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-X-4_name}
	...    cats_nsg_port_name=P1
	Create VLAN in NSG Port
	...    value=222
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-X-4_name}
	...    cats_nsg_port_name=P6
	
Associating VSC Profile to Port 1 NSG-X_4 
    Associate VSC Profile with NSG VLAN    
    ...    cats_vlan_id=0
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_nsg_name=${cats_NSG-X-4_name}
    ...    cats_nsg_port_name=P1
    
Creating Single Uplink Connection NSG-X_4
    Create Uplink Connection in NSG Vlan 
    ...    mode=Static
    ...    role=PRIMARY
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-X-4_name}
	...    cats_nsg_port_name=P1
    ...    cats_vlan_id=0
    ...    address=${cats_NSGx-4_address_primary}
    ...    gateway=${cats_NSGx-4_gateway_primary}
	...    netmask=${cats_NSGxxx_netmask}
    ...    DNSAddress=${cats_NSGxxx_DNSAddress} 


Create NSG Instance NSG-E202_1
    Create NSG
    ...    name=${cats_NSG-E202-1_name}
	...    description=xxxx
    ...    cats_nsg_template_name=${cats_nsg_templates['template5']['name']}
    ...    cats_org_name=${cats_org_name}
	Create VLAN in NSG Port
	...    value=0
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E202-1_name}
	...    cats_nsg_port_name=P1
	Create VLAN in NSG Port
	...    value=230
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E202-1_name}
	...    cats_nsg_port_name=P6

Associating VSC Profile to Port 1 NSG-E202_1  
    Associate VSC Profile with NSG VLAN    
    ...    cats_vlan_id=0
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_nsg_name=${cats_NSG-E202-1_name}
    ...    cats_nsg_port_name=P1
    
Creating Single Uplink Connection NSG-E202_1
    Create Uplink Connection in NSG Vlan 
    ...    mode=Static
    ...    role=PRIMARY
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E202-1_name}
	...    cats_nsg_port_name=P1
    ...    cats_vlan_id=0
    ...    address=${cats_NSGe202-1_address_primary}
    ...    gateway=${cats_NSGe202-1_gateway_primary}
	...    netmask=${cats_NSGxxx_netmask}
    ...    DNSAddress=${cats_NSGxxx_DNSAddress} 

	
Create NSG Instance NSG-E202_2
    Create NSG
    ...    name=${cats_NSG-E202-2_name}
    ...    description=xxxx
    ...    cats_nsg_template_name=${cats_nsg_templates['template5']['name']}
    ...    cats_org_name=${cats_org_name}
	Create VLAN in NSG Port
	...    value=0
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E202-2_name}
	...    cats_nsg_port_name=P1
	Create VLAN in NSG Port
	...    value=231
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E202-2_name}
	...    cats_nsg_port_name=P6

Associating VSC Profile to Port 1 NSG-E202_2  
    Associate VSC Profile with NSG VLAN    
    ...    cats_vlan_id=0
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_nsg_name=${cats_NSG-E202-2_name}
    ...    cats_nsg_port_name=P1
    
Creating Single Uplink Connection NSG-E202_2
    Create Uplink Connection in NSG Vlan 
    ...    mode=Static
    ...    role=PRIMARY
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E202-2_name}
	...    cats_nsg_port_name=P1
    ...    cats_vlan_id=0
    ...    address=${cats_NSGe202-2_address_primary}
    ...    gateway=${cats_NSGe202-2_gateway_primary}
	...    netmask=${cats_NSGxxx_netmask}
    ...    DNSAddress=${cats_NSGxxx_DNSAddress} 	
	
	
Create NSG Instance NSG-E206_1
    Create NSG
    ...    name=${cats_NSG-E206-1_name}
	...    description=xxxx
    ...    cats_nsg_template_name=${cats_nsg_templates['template5']['name']}
    ...    cats_org_name=${cats_org_name}
	Create VLAN in NSG Port
	...    value=0
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E206-1_name}
	...    cats_nsg_port_name=P1
	Create VLAN in NSG Port
	...    value=224
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E206-1_name}
	...    cats_nsg_port_name=P6

Associating VSC Profile to Port 1 NSG-E206_1  
    Associate VSC Profile with NSG VLAN    
    ...    cats_vlan_id=0
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_nsg_name=${cats_NSG-E206-1_name}
    ...    cats_nsg_port_name=P1
    
Creating Single Uplink Connection NSG-E206_1
    Create Uplink Connection in NSG Vlan 
    ...    mode=Static
    ...    role=PRIMARY
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E206-1_name}
	...    cats_nsg_port_name=P1
    ...    cats_vlan_id=0
    ...    address=${cats_NSGe206-1_address_primary}
    ...    gateway=${cats_NSGe206-1_gateway_primary}
	...    netmask=${cats_NSGxxx_netmask}
    ...    DNSAddress=${cats_NSGxxx_DNSAddress} 

	
Create NSG Instance NSG-E206_2
    Create NSG
    ...    name=${cats_NSG-E206-2_name}
    ...    description=xxxx
    ...    cats_nsg_template_name=${cats_nsg_templates['template5']['name']}
    ...    cats_org_name=${cats_org_name}
	Create VLAN in NSG Port
	...    value=0
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E206-2_name}
	...    cats_nsg_port_name=P1
	Create VLAN in NSG Port
	...    value=225
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E206-2_name}
	...    cats_nsg_port_name=P6

Associating VSC Profile to Port 1 NSG-E206_2  
    Associate VSC Profile with NSG VLAN    
    ...    cats_vlan_id=0
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_nsg_name=${cats_NSG-E206-2_name}
    ...    cats_nsg_port_name=P1
    
Creating Single Uplink Connection NSG-E206_2
    Create Uplink Connection in NSG Vlan 
    ...    mode=Static
    ...    role=PRIMARY
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E206-2_name}
	...    cats_nsg_port_name=P1
    ...    cats_vlan_id=0
    ...    address=${cats_NSGe206-2_address_primary}
    ...    gateway=${cats_NSGe206-2_gateway_primary}
	...    netmask=${cats_NSGxxx_netmask}
    ...    DNSAddress=${cats_NSGxxx_DNSAddress} 	
	
	
Create NSG Instance NSG-E306_1
    Create NSG
    ...    name=${cats_NSG-E306-1_name}
	...    description=xxxx
    ...    cats_nsg_template_name=${cats_nsg_templates['template5']['name']}
    ...    cats_org_name=${cats_org_name}
	Create VLAN in NSG Port
	...    value=0
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E306-1_name}
	...    cats_nsg_port_name=P1
	Create VLAN in NSG Port
	...    value=227
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E306-1_name}
	...    cats_nsg_port_name=P6

Associating VSC Profile to Port 1 NSG-E306_1  
    Associate VSC Profile with NSG VLAN    
    ...    cats_vlan_id=0
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_nsg_name=${cats_NSG-E306-1_name}
    ...    cats_nsg_port_name=P1
    
Creating Single Uplink Connection NSG-E306_1
    Create Uplink Connection in NSG Vlan 
    ...    mode=Static
    ...    role=PRIMARY
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E306-1_name}
	...    cats_nsg_port_name=P1
    ...    cats_vlan_id=0
    ...    address=${cats_NSGe306-1_address_primary}
    ...    gateway=${cats_NSGe306-1_gateway_primary}
	...    netmask=${cats_NSGxxx_netmask}
    ...    DNSAddress=${cats_NSGxxx_DNSAddress} 

	
Create NSG Instance NSG-E306_2
    Create NSG
    ...    name=${cats_NSG-E306-2_name}
    ...    description=xxxx
    ...    cats_nsg_template_name=${cats_nsg_templates['template5']['name']}
    ...    cats_org_name=${cats_org_name}
	Create VLAN in NSG Port
	...    value=0
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E306-2_name}
	...    cats_nsg_port_name=P1
	Create VLAN in NSG Port
	...    value=228
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E306-2_name}
	...    cats_nsg_port_name=P6

Associating VSC Profile to Port 1 NSG-E306_2  
    Associate VSC Profile with NSG VLAN    
    ...    cats_vlan_id=0
    ...    cats_vsc_profile_name=${cats_vsc_profile1_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_nsg_name=${cats_NSG-E306-2_name}
    ...    cats_nsg_port_name=P1
    
Creating Single Uplink Connection NSG-E306_2
    Create Uplink Connection in NSG Vlan 
    ...    mode=Static
    ...    role=PRIMARY
	...    cats_org_name=${cats_org_name}
	...    cats_nsg_name=${cats_NSG-E306-2_name}
	...    cats_nsg_port_name=P1
    ...    cats_vlan_id=0
    ...    address=${cats_NSGe306-2_address_primary}
    ...    gateway=${cats_NSGe306-2_gateway_primary}
	...    netmask=${cats_NSGxxx_netmask}
    ...    DNSAddress=${cats_NSGxxx_DNSAddress} 