*** Settings ***

Resource                ../_VARS/vars.robot
Resource                ../_VARS/create.robot
Resource                cats_lib/resources/cats_common.robot
Resource                cats_lib/resources/nsg.robot

Force Tags              matrix
Documentation           Disable DPDK for NSG-X200-1
Test Timeout            5 minutes

*** Test Cases ***

Enterprise Login (csproot) + Checking NSG availability
    [Setup]  Csproot User is logged in VSD

    NSG-X200_1 is up in Monitoring

Disable DPDK NSG X200-1 + Reload Config + Reboot
	Create NSG
	...    name=${cats_NSG-X200-1_name}
	...    cats_nsg_template_name=MATRIX_NSG_6P_S
	...    cats_org_name=MATRIX_ORG
	...    networkAcceleration=NONE
	
#Reload NSG X200-1 Configuration
	Reload NSG Configuration    
	...    cats_org_name=MATRIX_ORG
	...    cats_nsg_name=${cats_NSG-X200-1_name}
	
#Wait 4 min for NSG X200-1 reboot
    Sleep    4 minutes

    NSG-X200_1 is up in Monitoring	