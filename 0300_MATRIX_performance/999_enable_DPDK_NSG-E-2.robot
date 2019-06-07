*** Settings ***

Resource                ../_VARS/vars.robot
Resource                ../_VARS/create.robot
Resource                cats_lib/resources/cats_common.robot
Resource                cats_lib/resources/nsg.robot

Force Tags              matrix
Documentation           Enable DPDK for NSG-E-2
Test Timeout            7 minutes

*** Test Cases ***

Enterprise Login (csproot) + Checking NSG availability
    [Setup]  Csproot User is logged in VSD

    NSG-E_2 is up in Monitoring

Enable DPDK NSG E-2 + Reload Config + Reboot
	Create NSG
	...    name=${cats_NSG-E-2_name}
	...    cats_nsg_template_name=MATRIX_NSG_6P_D
	...    cats_org_name=MATRIX_ORG
	...    networkAcceleration=PERFORMANCE
	
#Reload NSG E-2 Configuration
	Reload NSG Configuration    
	...    cats_org_name=MATRIX_ORG
	...    cats_nsg_name=${cats_NSG-E-2_name}
	
#Wait 6 min for NSG E-2 reboot
    Sleep    6 minutes

    NSG-E_2 is up in Monitoring	