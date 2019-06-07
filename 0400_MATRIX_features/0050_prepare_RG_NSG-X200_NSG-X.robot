*** Settings ***

Resource                ../_VARS/vars.robot
Resource                cats_lib/resources/cats_common.robot
Resource                cats_lib/resources/stcv.robot

Force Tags              matrix
Documentation           Prepare RG OVERLAY traffic between 2 (or more) NSG's
Test Timeout            10 minutes
Suite Teardown          STCV.Disconnect Chassis     

*** comment ***

This test case is to prepare test Resilience Group STCv OVERLAY traffic between NSG-X200 & NSG-X


*** Test Cases ***

User Login
   User Login
   ...    cats_username=${cats_org_admin}
   ...    cats_password=${cats_org_admin_pwd}
   ...    cats_org_name=${cats_org_name}
   
Clean up configuration for RGX200 X200-1 (Iperf)
    Delete Bridge Interface from L3 Domain
    ...    name=NSG-X200_1_itfc_I
    ...    cats_vport_name=NSG-X200_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
    Delete vPort
    ...    name=NSG-X200_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetX2001_name}

Clean up configuration for RGX200 X200-1 (Spirent)
    Delete Bridge Interface from L3 Domain
    ...    name=NSG-X200_1_itfc_S
    ...    cats_vport_name=NSG-X200_1_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
    Delete vPort
    ...    name=NSG-X200_1_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetX2001_name}

Clean up configuration for RGX200 X200-2 (Iperf)
    Delete Bridge Interface from L3 Domain
    ...    name=NSG-X200_2_itfc_I
    ...    cats_vport_name=NSG-X200_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

    Delete vPort
    ...    name=NSG-X200_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetX2002_name}

Clean up configuration for RGX200 X200-2 (Spirent)
    Delete Bridge Interface from L3 Domain
    ...    name=NSG-X200_2_itfc_S
    ...    cats_vport_name=NSG-X200_2_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

    Delete vPort
    ...    name=NSG-X200_2_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetX2002_name}
	
Clean up configuration for RGX X-1 (Iperf)
    Delete Bridge Interface from L3 Domain
    ...    name=NSG-X_1_itfc_I
    ...    cats_vport_name=NSG-X_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
    Delete vPort
    ...    name=NSG-X_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetX1_name}
	
Clean up configuration for RGX X-1 (Spirent)
    Delete Bridge Interface from L3 Domain
    ...    name=NSG-X_1_itfc_S
    ...    cats_vport_name=NSG-X_1_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
    Delete vPort
    ...    name=NSG-X_1_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetX1_name}

Clean up configuration for RGX X-2 (Iperf)
    Delete Bridge Interface from L3 Domain
    ...    name=NSG-X_2_itfc_I
    ...    cats_vport_name=NSG-X_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

    Delete vPort
    ...    name=NSG-X_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetX2_name}

Clean up configuration for RGX X-2 (Spirent)
    Delete Bridge Interface from L3 Domain
    ...    name=NSG-X_2_itfc_S
    ...    cats_vport_name=NSG-X_2_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

    Delete vPort
    ...    name=NSG-X_2_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetX2_name}