*** Settings ***

Resource                ../_VARS/vars.robot
Resource                cats_lib/resources/cats_common.robot
Resource                cats_lib/resources/stcv.robot

Force Tags              matrix
Documentation           Cleanup RG OVERLAY traffic between 2 (or more) NSG's
Test Timeout            10 minutes
Suite Teardown          STCV.Disconnect Chassis     

*** comment ***

This test case is to cleanup Resilience Group STCv OVERLAY traffic between NSG-E200 & NSG-E300 


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

### For RGE200 ###
   Delete Bridge Interface from L3 Domain
   ...    cats_org_name=${cats_org_name}
   ...    cats_domain_name=${cats_l3_domain1_name}
   ...    cats_vport_name=RGE200_vport
   ...    name=RGE200_iface

   Delete vPort
   ...    name=RGE200_vport
   ...    cats_org_name=${cats_org_name}
   ...    cats_domain_name=${cats_l3_domain1_name}
   ...    cats_domain_type=L3
   ...    cats_subnet_name=${cats_subnetRGE200_name}

#  Delete Bridge vPort for NSG Redundancy Group
#  ...    cats_rg_name=RGE200
#  ...    cats_rg_port_name=P5
#   ...    name=RGE200_vport
#   ...    cats_org_name=${cats_org_name}
#   ...    cats_domain_name=${cats_l3_domain1_name}
#   ...    cats_domain_type=L3
#   ...    cats_subnet_name=${cats_subnetRGE200_name}
#   ...    cats_vlan_id=500

### For RGE300 ###
   Delete Bridge Interface from L3 Domain
   ...    cats_org_name=${cats_org_name}
   ...    cats_domain_name=${cats_l3_domain1_name}
   ...    cats_vport_name=RGE300_vport
   ...    name=RGE300_iface   

   Delete vPort
   ...    name=RGE300_vport
   ...    cats_org_name=${cats_org_name}
   ...    cats_domain_name=${cats_l3_domain1_name}
   ...    cats_domain_type=L3
   ...    cats_subnet_name=${cats_subnetRGE300_name}
   
#   Delete Bridge vPort for NSG Redundancy Group
#   ...    cats_rg_name=RGE300
#   ...    cats_rg_port_name=P5
#   ...    name=RGE300_vport
#   ...    cats_org_name=${cats_org_name}
#   ...    cats_domain_name=${cats_l3_domain1_name}
#   ...    cats_domain_type=L3
#   ...    cats_subnet_name=${cats_subnetRGE300_name}
#   ...    cats_vlan_id=500

   
Deleting RGE200 & RGE300 SUBNET
    Delete Subnet
    ...    name=${cats_subnetRGE200_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
 
    Delete Subnet
    ...    name=${cats_subnetRGE300_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
   

Delete RGE200
   Delete VLAN from NSG Redundancy Group Port
   ...    value=500
   ...    cats_rg_name=RGE200
   ...    cats_rg_port_name=P5
   ...    cats_org_name=${cats_org_name}
   
   Delete Port from NSG Redundancy Group
   ...    name=P5
   ...    cats_rg_name=RGE200
   ...    cats_org_name=${cats_org_name}

   Delete NSG Redundancy Group
   ...    name=RGE200
   ...    cats_org_name=${cats_org_name}

Delete RGE300
   Delete VLAN from NSG Redundancy Group Port
   ...    value=500
   ...    cats_rg_name=RGE300
   ...    cats_rg_port_name=P5
   ...    cats_org_name=${cats_org_name}
   
   Delete Port from NSG Redundancy Group
   ...    name=P5
   ...    cats_rg_name=RGE300
   ...    cats_org_name=${cats_org_name}

   Delete NSG Redundancy Group
   ...    name=RGE300
   ...    cats_org_name=${cats_org_name}
   
   
# NSG-E200_1
Create a vPort and attach Bridge Interface for NSG-E200_1 (Iperf)
    Create Bridge vPort for NSG
    ...    name=NSG-E200_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE2001_name}
    ...    cats_nsg_name=${cats_NSG-E200-1_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port5']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSG-E200_1_itfc_I
    ...    cats_vport_name=NSG-E200_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
# NSG-E200_2
Create a vPort and attach Bridge Interface for NSG-E200_2 (Iperf)
    Create Bridge vPort for NSG
    ...    name=NSG-E200_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE2002_name}
    ...    cats_nsg_name=${cats_NSG-E200-2_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port5']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSG-E200_2_itfc_I
    ...    cats_vport_name=NSG-E200_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
# NSG-E300_1
Create a vPort and attach Bridge Interface for NSG-E300_1 (Iperf)
    Create Bridge vPort for NSG
    ...    name=NSG-E300_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE3001_name}
    ...    cats_nsg_name=${cats_NSG-E300-1_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port5']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSG-E300_1_itfc_I
    ...    cats_vport_name=NSG-E300_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
# NSG-E300_2
Create a vPort and attach Bridge Interface for NSG-E300_2 (Iperf)
    Create Bridge vPort for NSG
    ...    name=NSG-E300_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE3002_name}
    ...    cats_nsg_name=${cats_NSG-E300-2_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port5']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSG-E300_2_itfc_I
    ...    cats_vport_name=NSG-E300_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	

	
# NSG-E200_1
Create a vPort and attach Bridge Interface for NSG-E200_1 (Spirent)
    Create Bridge vPort for NSG
    ...    name=NSG-E200_1_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE2001_name}
    ...    cats_nsg_name=${cats_NSG-E200-1_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port6']['name']}
    ...    cats_vlan_id=210

    Create Bridge Interface in L3 Domain
    ...    name=NSG-E200_1_itfc_S
    ...    cats_vport_name=NSG-E200_1_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
# NSG-E200_2
Create a vPort and attach Bridge Interface for NSG-E200_2 (Spirent)
    Create Bridge vPort for NSG
    ...    name=NSG-E200_2_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE2002_name}
    ...    cats_nsg_name=${cats_NSG-E200-2_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port6']['name']}
    ...    cats_vlan_id=211

    Create Bridge Interface in L3 Domain
    ...    name=NSG-E200_2_itfc_S
    ...    cats_vport_name=NSG-E200_2_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}


# NSG-E300_1
Create a vPort and attach Bridge Interface for NSG-E300_1 (Spirent)
    Create Bridge vPort for NSG
    ...    name=NSG-E300_1_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE3001_name}
    ...    cats_nsg_name=${cats_NSG-E300-1_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port6']['name']}
    ...    cats_vlan_id=213

    Create Bridge Interface in L3 Domain
    ...    name=NSG-E300_1_itfc_S
    ...    cats_vport_name=NSG-E300_1_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
# NSG-E300_2
Create a vPort and attach Bridge Interface for NSG-E300_2 (Spirent)
    Create Bridge vPort for NSG
    ...    name=NSG-E300_2_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE3002_name}
    ...    cats_nsg_name=${cats_NSG-E300-2_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port6']['name']}
    ...    cats_vlan_id=214

    Create Bridge Interface in L3 Domain
    ...    name=NSG-E300_2_itfc_S
    ...    cats_vport_name=NSG-E300_2_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}