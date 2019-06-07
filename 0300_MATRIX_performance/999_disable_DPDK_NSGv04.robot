*** Settings ***

Resource                ../_VARS/vars.robot
Resource                ../_VARS/create.robot
Resource                cats_lib/resources/cats_common.robot
Resource                cats_lib/resources/nsg.robot

Force Tags              matrix
Documentation           Disable DPDK for MATRIX_NSGv04
Test Timeout            5 minutes

*** Test Cases ***

Enterprise Login (csproot) + Checking NSGv04 availability
    [Setup]  Csproot User is logged in VSD

    NSGv04 is up in Monitoring

Disable DPDK NSGv04 + Reload Config + Reboot
	Create NSG
	...    name=${cats_NSGv04_name}
	...    cats_nsg_template_name=MATRIX_NSGv_6P_S
	...    cats_org_name=MATRIX_ORG
	...    networkAcceleration=NONE
	
#Reload NSGv04 Configuration
	Reload NSG Configuration    
	...    cats_org_name=MATRIX_ORG
	...    cats_nsg_name=${cats_NSGv04_name}

#Wait 1 min for NSG reboot
    Sleep    1 minute

    NSGv04 is up in Monitoring	