*** Settings ***

Resource         	../../VNSPOC-variables/${SETUP}/vars_common.robot
Resource         	../../VNSPOC-variables/${SETUP}/vars_B.robot
Resource         	cats_lib/resources/cats_common.robot
Resource         	cats_lib/resources/nsg.robot

Force Tags		  	preparation
Documentation		Test case for NSG UBR1 assignement
Test Timeout		1 minute

*** Test Cases ***

Enterprise Login (csproot) + Checking NSGvBx availability
    [Setup]  Csproot User is logged in VSD

	NSGvB1 is up in Monitoring
	NSGvB2 is up in Monitoring
#	NSGvB1 is configured
#	NSGvB2 is configured
#	NSGvB1 is bootstrapped
#	NSGvB2 is bootstrapped
	NSGUBR1 is up in Monitoring
#	NSGUBR1 is not configured
#	NSGUBR1 is not bootstrapped

Creating UBR1 Group

    Create UBR Group
    ...     name=${cats_ubr_group1_name}

Assign NSG UBR1 to group

    Add UBR to UBR Group
    ...     cats_ubr_name=${cats_nsg_name_ubr1}
    ...     cats_ubr_group_name=${cats_ubr_group1_name}

Creating NSG1 group

    Create NSG Group
    ...     name=${cats_nsg_group1_name}
    ...     cats_org_name=${cats_org_name}
	 
Adding NSGs to NSG1 Group (NSGvB 1 & 2)
    	
	Add NSG to NSG Group
    ...    cats_org_name=${cats_org_name}
    ...    cats_nsg_name=${cats_nsg_name1}
    ...    cats_nsg_group_name=${cats_nsg_group1_name}
	
	Add NSG to NSG Group
    ...    cats_org_name=${cats_org_name}
    ...    cats_nsg_name=${cats_nsg_name2}
    ...    cats_nsg_group_name=${cats_nsg_group1_name}
	
Assigning NSG UBR1 group to NSG1 group

    Add UBR Group to NSG Group
    ...     cats_ubr_group_name=${cats_ubr_group1_name}
    ...     cats_org_name=${cats_org_name}
    ...     cats_nsg_group_name=${cats_nsg_group1_name}
    ...     priority=1
#   ...     oneWayDelay=50

Reloading NSGvBx Configurations    

    Reload NSG Configuration   
	...		cats_org_name=${cats_org_name}
	...     cats_nsg_name=${cats_nsg_name1}

    Reload NSG Configuration   
	...		cats_org_name=${cats_org_name}
	...     cats_nsg_name=${cats_nsg_name2}