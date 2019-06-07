*** Settings ***

Resource                ../_VARS/vars.robot
Resource                ../_VARS/create.robot
Resource                cats_lib/resources/cats_common.robot
Resource                cats_lib/resources/nsg.robot

Force Tags              matrix
Documentation           Disable DPDK for NSG-E300-2
Test Timeout            6 minutes

*** Test Cases ***

Enterprise Login (csproot) + Checking NSG availability
    [Setup]  Csproot User is logged in VSD

    NSG-E300_2 is up in Monitoring

Disable DPDK NSG E300-2 + Reload Config + Reboot
	Create NSG
	...    name=${cats_NSG-E300-2_name}
	...    cats_nsg_template_name=MATRIX_NSG_6P_S
	...    cats_org_name=MATRIX_ORG
	...    networkAcceleration=NONE
	
#Reload NSG E300-2 Configuration
	Reload NSG Configuration    
	...    cats_org_name=MATRIX_ORG
	...    cats_nsg_name=${cats_NSG-E300-2_name}
	
#Wait 5 min for NSG E300-2 reboot
    Sleep    5 minutes

    NSG-E300_2 is up in Monitoring	