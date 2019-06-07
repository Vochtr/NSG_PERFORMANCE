*** Settings ***

Resource                ../_VARS/vars.robot
Resource                ../_VARS/create.robot
Resource                cats_lib/resources/cats_common.robot
Resource                cats_lib/resources/nsg.robot

Force Tags              matrix
Documentation           Disable DPDK for NSG-C-2
Test Timeout            5 minutes

*** Test Cases ***

Enterprise Login (csproot) + Checking NSG availability
    [Setup]  Csproot User is logged in VSD

    NSG-C_2 is up in Monitoring

Disable DPDK NSG C2 + Reload Config + Reboot
	Create NSG
	...    name=${cats_NSG-C-2_name}	
	...    cats_nsg_template_name=MATRIX_NSG_3P_S
	...    cats_org_name=MATRIX_ORG
	...    networkAcceleration=NONE
	
#Reload NSG C-2 Configuration
	Reload NSG Configuration    
	...    cats_org_name=MATRIX_ORG
	...    cats_nsg_name=${cats_NSG-C-2_name}
	
#Wait 4 min for NSG C-2 reboot
    Sleep    4 minutes

    NSG-C_2 is up in Monitoring	