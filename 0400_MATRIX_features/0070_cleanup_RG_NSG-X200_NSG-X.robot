*** Settings ***

Resource                ../_VARS/vars.robot
Resource                cats_lib/resources/cats_common.robot
Resource                cats_lib/resources/stcv.robot

Force Tags              matrix
Documentation           Cleanup RG OVERLAY traffic between 2 (or more) NSG's
Test Timeout            10 minutes
Suite Teardown          STCV.Disconnect Chassis     

*** comment ***

This test case is to cleanup Resilience Group STCv OVERLAY traffic between NSG-X200 & NSG-X 


*** Test Cases ***

CSPROOT Logs In 
    Csproot user is logged in VSD
   
Computing NSG variables
    # this KW Sets Suite Variable w/ name ${cats_nsgs} and ${cats_nsg_templates}
    # which contains a dictionary of templated parameters
    Load NSGs Variables from YAML
    ...    fname=${CURDIR}/_VARS/${cats_nsg_vars_fname}
    ...    test_prefix=${test_prefix}
	  
   
Unassigning RG Subnets to NSGs access VLANS

### For RGX200 ###
   Delete Bridge Interface from L3 Domain
   ...    cats_org_name=${cats_org_name}
   ...    cats_domain_name=${cats_l3_domain1_name}
   ...    cats_vport_name=RGX200_vport
   ...    name=RGX200_iface

   Delete vPort
   ...    name=RGX200_vport
   ...    cats_org_name=${cats_org_name}
   ...    cats_domain_name=${cats_l3_domain1_name}
   ...    cats_domain_type=L3
   ...    cats_subnet_name=${cats_subnetRGX200_name}

#  Delete Bridge vPort for NSG Redundancy Group
#  ...    cats_rg_name=RGX200
#  ...    cats_rg_port_name=P5
#   ...    name=RGX200_vport
#   ...    cats_org_name=${cats_org_name}
#   ...    cats_domain_name=${cats_l3_domain1_name}
#   ...    cats_domain_type=L3
#   ...    cats_subnet_name=${cats_subnetRGX200_name}
#   ...    cats_vlan_id=500

### For RGX ###
   Delete Bridge Interface from L3 Domain
   ...    cats_org_name=${cats_org_name}
   ...    cats_domain_name=${cats_l3_domain1_name}
   ...    cats_vport_name=RGX_vport
   ...    name=RGX_iface   

   Delete vPort
   ...    name=RGX_vport
   ...    cats_org_name=${cats_org_name}
   ...    cats_domain_name=${cats_l3_domain1_name}
   ...    cats_domain_type=L3
   ...    cats_subnet_name=${cats_subnetRGX_name}
   
#   Delete Bridge vPort for NSG Redundancy Group
#   ...    cats_rg_name=RGX
#   ...    cats_rg_port_name=P5
#   ...    name=RGX_vport
#   ...    cats_org_name=${cats_org_name}
#   ...    cats_domain_name=${cats_l3_domain1_name}
#   ...    cats_domain_type=L3
#   ...    cats_subnet_name=${cats_subnetRGX_name}
#   ...    cats_vlan_id=500

   
Deleting RGX200 & RGX SUBNET
    Delete Subnet
    ...    name=${cats_subnetRGX200_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
 
    Delete Subnet
    ...    name=${cats_subnetRGX_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
   

Delete RGX200
   Delete VLAN from NSG Redundancy Group Port
   ...    value=500
   ...    cats_rg_name=RGX200
   ...    cats_rg_port_name=P5
   ...    cats_org_name=${cats_org_name}
   
   Delete Port from NSG Redundancy Group
   ...    name=P5
   ...    cats_rg_name=RGX200
   ...    cats_org_name=${cats_org_name}

   Delete NSG Redundancy Group
   ...    name=RGX200
   ...    cats_org_name=${cats_org_name}

Delete RGX
   Delete VLAN from NSG Redundancy Group Port
   ...    value=500
   ...    cats_rg_name=RGX
   ...    cats_rg_port_name=P5
   ...    cats_org_name=${cats_org_name}
   
   Delete Port from NSG Redundancy Group
   ...    name=P5
   ...    cats_rg_name=RGX
   ...    cats_org_name=${cats_org_name}

   Delete NSG Redundancy Group
   ...    name=RGX
   ...    cats_org_name=${cats_org_name}
   
   
# NSG-X200_1
Create a vPort and attach Bridge Interface for NSG-X200_1 (Iperf)
    Create Bridge vPort for NSG
    ...    name=NSG-X200_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetX2001_name}
    ...    cats_nsg_name=${cats_NSG-X200-1_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port5']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSG-X200_1_itfc_I
    ...    cats_vport_name=NSG-X200_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
# NSG-X200_2
Create a vPort and attach Bridge Interface for NSG-X200_2 (Iperf)
    Create Bridge vPort for NSG
    ...    name=NSG-X200_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetX2002_name}
    ...    cats_nsg_name=${cats_NSG-X200-2_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port5']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSG-X200_2_itfc_I
    ...    cats_vport_name=NSG-X200_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
# NSG-X_1
Create a vPort and attach Bridge Interface for NSG-X_1 (Iperf)
    Create Bridge vPort for NSG
    ...    name=NSG-X_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetX1_name}
    ...    cats_nsg_name=${cats_NSG-X-1_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port5']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSG-X_1_itfc_I
    ...    cats_vport_name=NSG-X_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
# NSG-X_2
Create a vPort and attach Bridge Interface for NSG-X_2 (Iperf)
    Create Bridge vPort for NSG
    ...    name=NSG-X_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetX2_name}
    ...    cats_nsg_name=${cats_NSG-X-2_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port5']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSG-X_2_itfc_I
    ...    cats_vport_name=NSG-X_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	

	
# NSG-X200_1
Create a vPort and attach Bridge Interface for NSG-X200_1 (Spirent)
    Create Bridge vPort for NSG
    ...    name=NSG-X200_1_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetX2001_name}
    ...    cats_nsg_name=${cats_NSG-X200-1_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port6']['name']}
    ...    cats_vlan_id=216

    Create Bridge Interface in L3 Domain
    ...    name=NSG-X200_1_itfc_S
    ...    cats_vport_name=NSG-X200_1_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
# NSG-X200_2
Create a vPort and attach Bridge Interface for NSG-X200_2 (Spirent)
    Create Bridge vPort for NSG
    ...    name=NSG-X200_2_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetX2002_name}
    ...    cats_nsg_name=${cats_NSG-X200-2_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port6']['name']}
    ...    cats_vlan_id=217

    Create Bridge Interface in L3 Domain
    ...    name=NSG-X200_2_itfc_S
    ...    cats_vport_name=NSG-X200_2_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}


# NSG-X_1
Create a vPort and attach Bridge Interface for NSG-X_1 (Spirent)
    Create Bridge vPort for NSG
    ...    name=NSG-X_1_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetX1_name}
    ...    cats_nsg_name=${cats_NSG-X-1_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port6']['name']}
    ...    cats_vlan_id=219

    Create Bridge Interface in L3 Domain
    ...    name=NSG-X_1_itfc_S
    ...    cats_vport_name=NSG-X_1_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
# NSG-X_2
Create a vPort and attach Bridge Interface for NSG-X_2 (Spirent)
    Create Bridge vPort for NSG
    ...    name=NSG-X_2_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetX2_name}
    ...    cats_nsg_name=${cats_NSG-X-2_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port6']['name']}
    ...    cats_vlan_id=220

    Create Bridge Interface in L3 Domain
    ...    name=NSG-X_2_itfc_S
    ...    cats_vport_name=NSG-X_2_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}