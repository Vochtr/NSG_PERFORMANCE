*** Settings ***

Resource                ../_VARS/vars.robot
Resource                cats_lib/resources/cats_common.robot
Resource                cats_lib/resources/network.robot

Force Tags              usecase
Documentation           cleanup DHCP
Test Timeout            1 minute

*** comment ***

Cleanup DHCP config on NSG's.

*** Test Cases ***
	
Login in VSD (Matrix Org)
    User Login    
	...	   cats_username=${cats_org_admin}
    ...    cats_password=${cats_org_admin_pwd}
    ...    cats_org_name=${cats_org_name}
	
Cleaning up Address Ranges in Subnets NSG-VIRTUAL
    Delete Address Range from Subnet
    ...                         cats_org_name=${cats_org_name}
    ...                         cats_domain_name=${cats_l3_domain1_name}
    ...                         cats_subnet_name=${cats_subnet1_name}
    ...                         minAddress=${cats_minAddress2_subnet1}

    Delete Address Range from Subnet
    ...                         cats_org_name=${cats_org_name}
    ...                         cats_domain_name=${cats_l3_domain1_name}
    ...                         cats_subnet_name=${cats_subnet2_name}
    ...                         minAddress=${cats_minAddress2_subnet2}
	
Cleaning up Address Ranges in Subnet NSG-C
    Delete Address Range from Subnet
    ...                         cats_org_name=${cats_org_name}
    ...                         cats_domain_name=${cats_l3_domain1_name}
    ...                         cats_subnet_name=${cats_subnetC1_name}
    ...                         minAddress=${cats_minAddress1_subnetC1}
	
Cleaning up Address Ranges in Subnet NSG-E
    Delete Address Range from Subnet
    ...                         cats_org_name=${cats_org_name}
    ...                         cats_domain_name=${cats_l3_domain1_name}
    ...                         cats_subnet_name=${cats_subnetE1_name}
    ...                         minAddress=${cats_minAddress1_subnetE1}
	
Cleaning up Address Ranges in Subnet NSG-E200
    Delete Address Range from Subnet
    ...                         cats_org_name=${cats_org_name}
    ...                         cats_domain_name=${cats_l3_domain1_name}
    ...                         cats_subnet_name=${cats_subnetE2001_name}
    ...                         minAddress=${cats_minAddress1_subnetE2001}
	
Cleaning up Address Ranges in Subnet NSG-E300
    Delete Address Range from Subnet
    ...                         cats_org_name=${cats_org_name}
    ...                         cats_domain_name=${cats_l3_domain1_name}
    ...                         cats_subnet_name=${cats_subnetE3001_name}
    ...                         minAddress=${cats_minAddress1_subnetE3001}
		
Cleaning up Address Ranges in Subnet NSG-X200
    Delete Address Range from Subnet
    ...                         cats_org_name=${cats_org_name}
    ...                         cats_domain_name=${cats_l3_domain1_name}
    ...                         cats_subnet_name=${cats_subnetX2001_name}
    ...                         minAddress=${cats_minAddress1_subnetX2001}

Cleaning up Address Ranges in Subnet NSG-X
    Delete Address Range from Subnet
    ...                         cats_org_name=${cats_org_name}
    ...                         cats_domain_name=${cats_l3_domain1_name}
    ...                         cats_subnet_name=${cats_subnetX1_name}
    ...                         minAddress=${cats_minAddress1_subnetX1}
	
Cleaning up Address Ranges in Subnet NSG-E202
    Delete Address Range from Subnet
    ...                         cats_org_name=${cats_org_name}
    ...                         cats_domain_name=${cats_l3_domain1_name}
    ...                         cats_subnet_name=${cats_subnetE2021_name}
    ...                         minAddress=${cats_minAddress1_subnetE2021}
	
Cleaning up Address Ranges in Subnet NSG-E206
    Delete Address Range from Subnet
    ...                         cats_org_name=${cats_org_name}
    ...                         cats_domain_name=${cats_l3_domain1_name}
    ...                         cats_subnet_name=${cats_subnetE2061_name}
    ...                         minAddress=${cats_minAddress1_subnetE2061}
	
Cleaning up Address Ranges in Subnet NSG-E306
    Delete Address Range from Subnet
    ...                         cats_org_name=${cats_org_name}
    ...                         cats_domain_name=${cats_l3_domain1_name}
    ...                         cats_subnet_name=${cats_subnetE3061_name}
    ...                         minAddress=${cats_minAddress1_subnetE3061}