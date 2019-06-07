*** Settings ***

Resource                ../_VARS/vars.robot
Resource                cats_lib/resources/cats_common.robot
Resource                cats_lib/resources/stcv.robot

Force Tags              matrix
Documentation           Test RG OVERLAY traffic between 2 (or more) NSG's
Test Timeout            10 minutes
Suite Teardown          STCV.Disconnect Chassis     

*** comment ***

This test case is to test Resilience Group STCv OVERLAY traffic between NSG-X200 & NSG-X


*** Test Cases ***

User Login
   User Login
   ...    cats_username=${cats_org_admin}
   ...    cats_password=${cats_org_admin_pwd}
   ...    cats_org_name=${cats_org_name}
   
Create RGX200
   Create NSG Redundancy Group
   ...    name=RGX200
   ...    cats_org_name=${cats_org_name}
   ...    cats_auth_gw_name=${cats_NSG-X200-1_name}
   ...    cats_sec_gw_name=${cats_NSG-X200-2_name}

   Create Port in NSG Redundancy Group
   ...    name=P5
   ...    physicalName=port5
   ...    portType=ACCESS
   ...    VLANRange=0-4094
   ...    cats_rg_name=RGX200
   ...    cats_org_name=${cats_org_name}

   Create VLAN in NSG Redundancy Group Port
   ...    value=500
   ...    cats_rg_name=RGX200
   ...    cats_rg_port_name=P5
   ...    cats_org_name=${cats_org_name}

Create RGX
   Create NSG Redundancy Group
   ...    name=RGX
   ...    cats_org_name=${cats_org_name}
   ...    cats_auth_gw_name=${cats_NSG-X-1_name}
   ...    cats_sec_gw_name=${cats_NSG-X-2_name}

   Create Port in NSG Redundancy Group
   ...    name=P5
   ...    physicalName=port5
   ...    portType=ACCESS
   ...    VLANRange=0-4094
   ...    cats_rg_name=RGX
   ...    cats_org_name=${cats_org_name}

   Create VLAN in NSG Redundancy Group Port
   ...    value=500
   ...    cats_rg_name=RGX
   ...    cats_rg_port_name=P5
   ...    cats_org_name=${cats_org_name}

Creating RGX200 & RGX SUBNET
    Create Subnet
    ...    name=${cats_subnetRGX200_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone2_name}
    ...    cats_address=${cats_subnetRGX200_network}

    Create Subnet
    ...    name=${cats_subnetRGX_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone2_name}
    ...    cats_address=${cats_subnetRGX_network}

Assigning RG Subnets to NSGs access VLANS

### For RGX200 ###
   Create Bridge vPort for NSG Redundancy Group
   ...    cats_rg_name=RGX200
   ...    cats_rg_port_name=P5
   ...    name=RGX200_vport
   ...    cats_org_name=${cats_org_name}
   ...    cats_domain_name=${cats_l3_domain1_name}
   ...    cats_domain_type=L3
   ...    cats_subnet_name=${cats_subnetRGX200_name}
   ...    cats_vlan_id=500

   Create Bridge Interface in L3 Domain
   ...    cats_org_name=${cats_org_name}
   ...    cats_domain_name=${cats_l3_domain1_name}
   ...    cats_vport_name=RGX200_vport
   ...    name=RGX200_iface

### For RGX ###
   Create Bridge vPort for NSG Redundancy Group
   ...    cats_rg_name=RGX
   ...    cats_rg_port_name=P5
   ...    name=RGX_vport
   ...    cats_org_name=${cats_org_name}
   ...    cats_domain_name=${cats_l3_domain1_name}
   ...    cats_domain_type=L3
   ...    cats_subnet_name=${cats_subnetRGX_name}
   ...    cats_vlan_id=500

   Create Bridge Interface in L3 Domain
   ...    cats_org_name=${cats_org_name}
   ...    cats_domain_name=${cats_l3_domain1_name}
   ...    cats_vport_name=RGX_vport
   ...    name=RGX_iface
   
  
#############################################################
#### Test Traffic Between NSGs without any links failure ####
#############################################################
    
#    STCV.Setup Traffic Generator
#    ...    config_file=${CURDIR}/stcv_L3.yaml
#    ...    _port1_ip=${cats_subnetRGX200_name}
#    ...    _port1_gw=${cats_subnetRGX200_gateway}
#    ...    _port1_vlan=33
#    ...    _port2_ip=${cats_subnetRGX_name}
#    ...    _port2_gw=${cats_subnetRGX_gateway}
#    ...    _port2_vlan=43
#    ...    _Duration=5
