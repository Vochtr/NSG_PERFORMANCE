*** Settings ***

Resource                ../_VARS/vars.robot
Resource                cats_lib/resources/cats_common.robot
Resource                cats_lib/resources/stcv.robot

Force Tags              matrix
Documentation           Prepare RG OVERLAY traffic between 2 (or more) NSG's
Test Timeout            10 minutes
Suite Teardown          STCV.Disconnect Chassis     

*** comment ***

This test case is to prepare test Resilience Group STCv OVERLAY traffic between NSG-E200 & NSG-E300


*** Test Cases ***

User Login
   User Login
   ...    cats_username=${cats_org_admin}
   ...    cats_password=${cats_org_admin_pwd}
   ...    cats_org_name=${cats_org_name}
   
Clean up configuration for RGE200 E200-1 (Iperf)
    Delete Bridge Interface from L3 Domain
    ...    name=NSG-E200_1_itfc_I
    ...    cats_vport_name=NSG-E200_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
    Delete vPort
    ...    name=NSG-E200_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE2001_name}

Clean up configuration for RGE200 E200-1 (Spirent)
    Delete Bridge Interface from L3 Domain
    ...    name=NSG-E200_1_itfc_S
    ...    cats_vport_name=NSG-E200_1_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
    Delete vPort
    ...    name=NSG-E200_1_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE2001_name}

Clean up configuration for RGE200 E200-2 (Iperf)
    Delete Bridge Interface from L3 Domain
    ...    name=NSG-E200_2_itfc_I
    ...    cats_vport_name=NSG-E200_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

    Delete vPort
    ...    name=NSG-E200_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE2002_name}

Clean up configuration for RGE200 E200-2 (Spirent)
    Delete Bridge Interface from L3 Domain
    ...    name=NSG-E200_2_itfc_S
    ...    cats_vport_name=NSG-E200_2_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

    Delete vPort
    ...    name=NSG-E200_2_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE2002_name}
	
Clean up configuration for RGE300 E300-1 (Iperf)
    Delete Bridge Interface from L3 Domain
    ...    name=NSG-E300_1_itfc_I
    ...    cats_vport_name=NSG-E300_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
    Delete vPort
    ...    name=NSG-E300_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE3001_name}
	
Clean up configuration for RGE300 E300-1 (Spirent)
    Delete Bridge Interface from L3 Domain
    ...    name=NSG-E300_1_itfc_S
    ...    cats_vport_name=NSG-E300_1_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
    Delete vPort
    ...    name=NSG-E300_1_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE3001_name}

Clean up configuration for RGE300 E300-2 (Iperf)
    Delete Bridge Interface from L3 Domain
    ...    name=NSG-E300_2_itfc_I
    ...    cats_vport_name=NSG-E300_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

    Delete vPort
    ...    name=NSG-E300_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE3002_name}

Clean up configuration for RGE300 E300-2 (Spirent)
    Delete Bridge Interface from L3 Domain
    ...    name=NSG-E300_2_itfc_S
    ...    cats_vport_name=NSG-E300_2_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

    Delete vPort
    ...    name=NSG-E300_2_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE3002_name}