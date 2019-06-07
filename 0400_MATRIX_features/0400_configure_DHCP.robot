*** Settings ***

Resource                ../_VARS/vars.robot
Resource                cats_lib/resources/cats_common.robot
Resource                cats_lib/resources/network.robot

Force Tags              usecase
Documentation           configure DHCP
Test Timeout            1 minute

*** comment ***

Configure DHCP on NSG's.

*** Test Cases ***
	
Login in VSD (Matrix Org)
    User Login    
	...	   cats_username=${cats_org_admin}
    ...    cats_password=${cats_org_admin_pwd}
    ...    cats_org_name=${cats_org_name}
	

Creating Address Ranges in Subnets NSG-VIRTUAL in L3 Domain
    Create Address Range in Subnet
    ...                         cats_org_name=${cats_org_name}
    ...                         cats_domain_name=${cats_l3_domain1_name}
    ...                         cats_subnet_name=${cats_subnet1_name}
    ...                         minAddress=${cats_minAddress1_subnet1}
    ...                         maxAddress=${cats_maxAddress1_subnet1}

    Create Address Range in Subnet
    ...                         cats_org_name=${cats_org_name}
    ...                         cats_domain_name=${cats_l3_domain1_name}
    ...                         cats_subnet_name=${cats_subnet2_name}
    ...                         minAddress=${cats_minAddress1_subnet2}
    ...                         maxAddress=${cats_maxAddress1_subnet2}

Creating Address Ranges in Subnet NSG-C in L3 Domain
	Create Address Range in Subnet
    ...                         cats_org_name=${cats_org_name}
    ...                         cats_domain_name=${cats_l3_domain1_name}
    ...                         cats_subnet_name=${cats_subnetC1_name}
    ...                         minAddress=${cats_minAddress1_subnetC1}
    ...                         maxAddress=${cats_maxAddress1_subnetC1}

Creating Address Ranges in Subnet NSG-E in L3 Domain
	Create Address Range in Subnet
    ...                         cats_org_name=${cats_org_name}
    ...                         cats_domain_name=${cats_l3_domain1_name}
    ...                         cats_subnet_name=${cats_subnetE1_name}
    ...                         minAddress=${cats_minAddress1_subnetE1}
    ...                         maxAddress=${cats_maxAddress1_subnetE1}

Creating Address Ranges in Subnet NSG-E200 in L3 Domain
	Create Address Range in Subnet
    ...                         cats_org_name=${cats_org_name}
    ...                         cats_domain_name=${cats_l3_domain1_name}
    ...                         cats_subnet_name=${cats_subnetE2001_name}
    ...                         minAddress=${cats_minAddress1_subnetE2001}
    ...                         maxAddress=${cats_maxAddress1_subnetE2001}
	
Creating Address Ranges in Subnet NSG-E300 in L3 Domain
	Create Address Range in Subnet
    ...                         cats_org_name=${cats_org_name}
    ...                         cats_domain_name=${cats_l3_domain1_name}
    ...                         cats_subnet_name=${cats_subnetE3001_name}
    ...                         minAddress=${cats_minAddress1_subnetE3001}
    ...                         maxAddress=${cats_maxAddress1_subnetE3001}

Creating Address Ranges in Subnet NSG-X200 in L3 Domain
	Create Address Range in Subnet
    ...                         cats_org_name=${cats_org_name}
    ...                         cats_domain_name=${cats_l3_domain1_name}
    ...                         cats_subnet_name=${cats_subnetX2001_name}
    ...                         minAddress=${cats_minAddress1_subnetX2001}
    ...                         maxAddress=${cats_maxAddress1_subnetX2001}

Creating Address Ranges in Subnet NSG-X in L3 Domain
	Create Address Range in Subnet
    ...                         cats_org_name=${cats_org_name}
    ...                         cats_domain_name=${cats_l3_domain1_name}
    ...                         cats_subnet_name=${cats_subnetX1_name}
    ...                         minAddress=${cats_minAddress1_subnetX1}
    ...                         maxAddress=${cats_maxAddress1_subnetX1}

Creating Address Ranges in Subnet NSG-E202 in L3 Domain
	Create Address Range in Subnet
    ...                         cats_org_name=${cats_org_name}
    ...                         cats_domain_name=${cats_l3_domain1_name}
    ...                         cats_subnet_name=${cats_subnetE2021_name}
    ...                         minAddress=${cats_minAddress1_subnetE2021}
    ...                         maxAddress=${cats_maxAddress1_subnetE2021}

Creating Address Ranges in Subnet NSG-E206 in L3 Domain
	Create Address Range in Subnet
    ...                         cats_org_name=${cats_org_name}
    ...                         cats_domain_name=${cats_l3_domain1_name}
    ...                         cats_subnet_name=${cats_subnetE2061_name}
    ...                         minAddress=${cats_minAddress1_subnetE2061}
    ...                         maxAddress=${cats_maxAddress1_subnetE2061}

Creating Address Ranges in Subnet NSG-E306 in L3 Domain
	Create Address Range in Subnet
    ...                         cats_org_name=${cats_org_name}
    ...                         cats_domain_name=${cats_l3_domain1_name}
    ...                         cats_subnet_name=${cats_subnetE3061_name}
    ...                         minAddress=${cats_minAddress1_subnetE3061}
    ...                         maxAddress=${cats_maxAddress1_subnetE3061}
	
Modify Address Ranges in Subnets NSG-VIRTUAL in L3 Domain
   #Update Address Range in Subnet --> doesn't work
    Delete Address Range from Subnet
    ...                         cats_org_name=${cats_org_name}
    ...                         cats_domain_name=${cats_l3_domain1_name}
    ...                         cats_subnet_name=${cats_subnet1_name}
    ...                         minAddress=${cats_minAddress1_subnet1}

    Delete Address Range from Subnet
    ...                         cats_org_name=${cats_org_name}
    ...                         cats_domain_name=${cats_l3_domain1_name}
    ...                         cats_subnet_name=${cats_subnet2_name}
    ...                         minAddress=${cats_minAddress1_subnet2}


    Create Address Range in Subnet
    ...                         cats_org_name=${cats_org_name}
    ...                         cats_domain_name=${cats_l3_domain1_name}
    ...                         cats_subnet_name=${cats_subnet1_name}
    ...                         minAddress=${cats_minAddress2_subnet1}
    ...                         maxAddress=${cats_maxAddress2_subnet1}

    Create Address Range in Subnet
    ...                         cats_org_name=${cats_org_name}
    ...                         cats_domain_name=${cats_l3_domain1_name}
    ...                         cats_subnet_name=${cats_subnet2_name}
    ...                         minAddress=${cats_minAddress2_subnet2}
    ...                         maxAddress=${cats_maxAddress2_subnet2}