*** Settings ***

Resource                ../_VARS/vars.robot
Resource                ../_VARS/create.robot
Resource                cats_lib/resources/cats_common.robot
Resource                cats_lib/resources/nsg.robot

Force Tags              matrix
Documentation           Enable DPDK for NSG-E-1
Test Timeout            7 minutes

*** Test Cases ***

Enterprise Login (csproot) + Checking NSG availability
    [Setup]  Csproot User is logged in VSD

    NSG-E_1 is up in Monitoring

Enable DPDK NSG E-1 + Reload Config + Reboot
	Create NSG
	...    name=${cats_NSG-E-1_name}
	...    cats_nsg_template_name=MATRIX_NSG_6P_D
	...    cats_org_name=MATRIX_ORG
	...    networkAcceleration=PERFORMANCE
	
#Reload NSG E-1 Configuration
	Reload NSG Configuration    
	...    cats_org_name=MATRIX_ORG
	...    cats_nsg_name=${cats_NSG-E-1_name}
	
#Wait 6 min for NSG E-1 reboot
    Sleep    6 minutes

    NSG-E_1 is up in Monitoring	