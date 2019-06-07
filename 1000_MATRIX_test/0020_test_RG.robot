*** Settings ***

Resource                ../_VARS/vars.robot
Resource                cats_lib/resources/cats_common.robot
Resource                cats_lib/resources/stcv.robot

Force Tags              matrix
Documentation           Test RG OVERLAY traffic between 2 (or more) NSG's
Test Timeout            10 minutes
Suite Teardown          STCV.Disconnect Chassis     

*** comment ***

This test case is to test Resilience Group STCv OVERLAY traffic between 2 (physical)(virtual) NSG's


*** Test Cases ***

User Login
   User Login
   ...    cats_username=${cats_org_admin}
   ...    cats_password=${cats_org_admin_pwd}
   ...    cats_org_name=${cats_org_name}
   
Clean up configuration for RG200 E200-1 (Iperf)
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

Clean up configuration for RG200 E200-1	(Spirent)
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

Clean up configuration for RG200 E200-2 (Iperf)
    Delete Bridge Interface from L3 Domain
    ...    name=NSG-E200_2_itfc_I
    ...    cats_vport_name=NSG-E200_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

    Delete Bridge vPort for NSG
    ...    name=NSG-E200_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE2002_name}

Clean up configuration for RG200 E200-2	(Spirent)
    Delete Bridge Interface from L3 Domain
    ...    name=NSG-E200_2_itfc_S
    ...    cats_vport_name=NSG-E200_2_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

    Delete Bridge vPort for NSG
    ...    name=NSG-E200_2_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE2002_name}
	
Clean up configuration for RG300 E300-1 (Iperf)
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
	
Clean up configuration for RG300 E300-1 (Spirent)
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

Clean up configuration for RG300 E300-2 (Iperf)
    Delete Bridge Interface from L3 Domain
    ...    name=NSG-E300_2_itfc_I
    ...    cats_vport_name=NSG-E300_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

    Delete Bridge vPort for NSG
    ...    name=NSG-E300_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE3002_name}

Clean up configuration for RG300 E300-2 (Spirent)
    Delete Bridge Interface from L3 Domain
    ...    name=NSG-E300_2_itfc_S
    ...    cats_vport_name=NSG-E300_2_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

    Delete Bridge vPort for NSG
    ...    name=NSG-E300_2_vport_S
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE3002_name}
	
Create RG200
   Create NSG Redundancy Group
   ...    name=RG200
   ...    cats_org_name=${cats_org_name}
   ...    cats_auth_gw_name=${cats_NSG-E200-1_name}
   ...    cats_sec_gw_name=${cats_NSG-E200-2_name}

   Create Port in NSG Redundancy Group
   ...    name=P5
   ...    physicalName=port5
   ...    portType=ACCESS
   ...    VLANRange=0-4094
   ...    cats_rg_name=RG200
   ...    cats_org_name=${cats_org_name}

   Create VLAN in NSG Redundancy Group Port
   ...    value=500
   ...    cats_rg_name=RG200
   ...    cats_rg_port_name=P5
   ...    cats_org_name=${cats_org_name}

Create RG300
   Create NSG Redundancy Group
   ...    name=RG300
   ...    cats_org_name=${cats_org_name}
   ...    cats_auth_gw_name=${cats_NSG-E300-1_name}
   ...    cats_sec_gw_name=${cats_NSG-E300-2_name}

   Create Port in NSG Redundancy Group
   ...    name=P5
   ...    physicalName=port5
   ...    portType=ACCESS
   ...    VLANRange=0-4094
   ...    cats_rg_name=RG300
   ...    cats_org_name=${cats_org_name}

   Create VLAN in NSG Redundancy Group Port
   ...    value=500
   ...    cats_rg_name=RG300
   ...    cats_rg_port_name=P5
   ...    cats_org_name=${cats_org_name}

Creating RG200 & RG300 SUBNET
    Create Subnet
    ...    name=${cats_subnetRG200_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone2_name}
    ...    cats_address=${cats_subnetRG200_network}

    Create Subnet
    ...    name=${cats_subnetRG300_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone2_name}
    ...    cats_address=${cats_subnetRG300_network}

Assigning RG Subnets to NSGs access VLANS

### For RG200 ###
   Create Bridge vPort for NSG Redundancy Group
   ...    cats_rg_name=RG200
   ...    cats_rg_port_name=P5
   ...    name=RG200_vport
   ...    cats_org_name=${cats_org_name}
   ...    cats_domain_name=${cats_l3_domain1_name}
   ...    cats_domain_type=L3
   ...    cats_subnet_name=${cats_subnetRG200_name}
   ...    cats_vlan_id=500

   Create Bridge Interface in L3 Domain
   ...    cats_org_name=${cats_org_name}
   ...    cats_domain_name=${cats_l3_domain1_name}
   ...    cats_vport_name=RG200_vport
   ...    name=RG200_iface

### For RG300 ###
   Create Bridge vPort for NSG Redundancy Group
   ...    cats_rg_name=RG300
   ...    cats_rg_port_name=P5
   ...    name=RG300_vport
   ...    cats_org_name=${cats_org_name}
   ...    cats_domain_name=${cats_l3_domain1_name}
   ...    cats_domain_type=L3
   ...    cats_subnet_name=${cats_subnetRG300_name}
   ...    cats_vlan_id=500

   Create Bridge Interface in L3 Domain
   ...    cats_org_name=${cats_org_name}
   ...    cats_domain_name=${cats_l3_domain1_name}
   ...    cats_vport_name=RG300_vport
   ...    name=RG300_iface
   
  
#############################################################
#### Test Traffic Between NSGs without any links failure ####
#############################################################
    
Test Traffic between RG200 and RG300
    SSHLibrary.Open Connection    ${default_target_server}
    SSHLibrary.Login    ${cats_target_host_login}
    ...                 ${cats_target_host_passwd}

###    SSHLibrary.Execute Command     /root/vifmove.sh ${STCv_VM_name} ${STCv_port1} br1RG1
###    SSHLibrary.Execute Command     /root/vifmove.sh ${STCv_VM_name} ${STCv_port2} br1RG2


    [Teardown]    STCV.Disconnect Chassis
    STCV.Force Release Ports
    ...    chassis_address=${cats_chassis_STCv}
    STCV.Setup Traffic Generator
    ...    config_file=${CURDIR}/stcv_L3.yaml
    ...    _port1_ip=${cats_subnetRG200_name}
    ...    _port1_gw=${cats_subnetRG200_gateway}
    ...    _port1_vlan=500
    ...    _port2_ip=${cats_subnetRG300_name}
    ...    _port2_gw=${cats_subnetRG300_gateway}
    ...    _port2_vlan=500
    ...    _Duration=5

    STCV.Subscribe to all results
    STCV.Start Devices 
    STCV.Start Traffic Generation
    STCV.Wait for Traffic to Stop
    Sleep    7s
    #Get End-of-Test Traffic Results between RG3&RG2
    ${res_set} =    Get Streamblock Results
    Set Suite Variable    ${res_set}

    #Ensure no Frame Drops Occurred between RG3&RG2
    # verify transmitted and received frame counters are greater than zero
    # that means that there is network connectivity
    Tx Frame Count Should Be Greater Than 0

    Rx Frame Count Should Be Greater Than 0

    # verify that no drops occurred during the transmission
    STCV.Dropped Frame Percent Should Be Equal
    ...    value=0
    ...    result_set=${res_set}

    STCV.Disconnect Chassis
    SSHLibrary.Close Connection
	
*** Keywords ***
Tx Frame Count Should Be Greater Than 0
    STCV.Frame Count Should Be Greater
    ...    value=0
    ...    result_type=TxStreamblockResults
    ...    result_set=${res_set}

Rx Frame Count Should Be Greater Than 0
    STCV.Frame Count Should Be Greater
    ...    value=0
    ...    result_type=RxStreamblockResults
    ...    result_set=${res_set}
