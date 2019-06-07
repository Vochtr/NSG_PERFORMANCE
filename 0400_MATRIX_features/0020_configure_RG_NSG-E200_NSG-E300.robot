*** Settings ***

Resource                ../_VARS/vars.robot
Resource                cats_lib/resources/cats_common.robot
Resource                cats_lib/resources/stcv.robot

Force Tags              matrix
Documentation           Test RG OVERLAY traffic between 2 (or more) NSG's
Test Timeout            10 minutes
Suite Teardown          STCV.Disconnect Chassis     

*** comment ***

This test case is to test Resilience Group STCv OVERLAY traffic between NSG-E200 & NSG-E300


*** Test Cases ***

User Login
   User Login
   ...    cats_username=${cats_org_admin}
   ...    cats_password=${cats_org_admin_pwd}
   ...    cats_org_name=${cats_org_name}
   
Create RGE200
   Create NSG Redundancy Group
   ...    name=RGE200
   ...    cats_org_name=${cats_org_name}
   ...    cats_auth_gw_name=${cats_NSG-E200-1_name}
   ...    cats_sec_gw_name=${cats_NSG-E200-2_name}

   Create Port in NSG Redundancy Group
   ...    name=P5
   ...    physicalName=port5
   ...    portType=ACCESS
   ...    VLANRange=0-4094
   ...    cats_rg_name=RGE200
   ...    cats_org_name=${cats_org_name}

   Create VLAN in NSG Redundancy Group Port
   ...    value=500
   ...    cats_rg_name=RGE200
   ...    cats_rg_port_name=P5
   ...    cats_org_name=${cats_org_name}

Create RGE300
   Create NSG Redundancy Group
   ...    name=RGE300
   ...    cats_org_name=${cats_org_name}
   ...    cats_auth_gw_name=${cats_NSG-E300-1_name}
   ...    cats_sec_gw_name=${cats_NSG-E300-2_name}

   Create Port in NSG Redundancy Group
   ...    name=P5
   ...    physicalName=port5
   ...    portType=ACCESS
   ...    VLANRange=0-4094
   ...    cats_rg_name=RGE300
   ...    cats_org_name=${cats_org_name}

   Create VLAN in NSG Redundancy Group Port
   ...    value=500
   ...    cats_rg_name=RGE300
   ...    cats_rg_port_name=P5
   ...    cats_org_name=${cats_org_name}

Creating RGE200 & RGE300 SUBNET
    Create Subnet
    ...    name=${cats_subnetRGE200_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone2_name}
    ...    cats_address=${cats_subnetRGE200_network}

    Create Subnet
    ...    name=${cats_subnetRGE300_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone2_name}
    ...    cats_address=${cats_subnetRGE300_network}

Assigning RG Subnets to NSGs access VLANS

### For RGE200 ###
   Create Bridge vPort for NSG Redundancy Group
   ...    cats_rg_name=RGE200
   ...    cats_rg_port_name=P5
   ...    name=RGE200_vport
   ...    cats_org_name=${cats_org_name}
   ...    cats_domain_name=${cats_l3_domain1_name}
   ...    cats_domain_type=L3
   ...    cats_subnet_name=${cats_subnetRGE200_name}
   ...    cats_vlan_id=500

   Create Bridge Interface in L3 Domain
   ...    cats_org_name=${cats_org_name}
   ...    cats_domain_name=${cats_l3_domain1_name}
   ...    cats_vport_name=RGE200_vport
   ...    name=RGE200_iface

### For RGE300 ###
   Create Bridge vPort for NSG Redundancy Group
   ...    cats_rg_name=RGE300
   ...    cats_rg_port_name=P5
   ...    name=RGE300_vport
   ...    cats_org_name=${cats_org_name}
   ...    cats_domain_name=${cats_l3_domain1_name}
   ...    cats_domain_type=L3
   ...    cats_subnet_name=${cats_subnetRGE300_name}
   ...    cats_vlan_id=500

   Create Bridge Interface in L3 Domain
   ...    cats_org_name=${cats_org_name}
   ...    cats_domain_name=${cats_l3_domain1_name}
   ...    cats_vport_name=RGE300_vport
   ...    name=RGE300_iface
   
  
#############################################################
#### Test Traffic Between NSGs without any links failure ####
#############################################################
    
#    STCV.Setup Traffic Generator
#    ...    config_file=${CURDIR}/stcv_L3.yaml
#    ...    _port1_ip=${cats_subnetRGE200_name}
#    ...    _port1_gw=${cats_subnetRGE200_gateway}
#    ...    _port1_vlan=33
#    ...    _port2_ip=${cats_subnetRGE300_name}
#    ...    _port2_gw=${cats_subnetRGE300_gateway}
#    ...    _port2_vlan=43
#    ...    _Duration=5
