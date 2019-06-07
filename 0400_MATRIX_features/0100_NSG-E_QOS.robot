*** Settings ***

Resource            ../_VARS/vars.robot
Resource          	cats_lib/resources/cats_common.robot

** comment ***

This test case is to simulate scenario 1 in VNS QoS user guide

Configuration

Queue 	CIR 	PIR
Q0 	  1 Mbps 	1.5 Mbps
Q1 	  400 Kbps 	1.5 Mbps
Q2 	  200 Mbps 	1.5 Mbps
Q3 	  300 Kbps 	1.5 Mbps
Q4 	  100 Kbps 	1.5 Mbps

Expected result

Queue 	Input Rate 	Scheduling Rate 	Weight
Q1 	    1.5 Mbps 	900 Kbps        	n/a
Q2 	    1 Mbps 	    200 Kbps        	2
Q3 	    500 Kbps 	300 Kbps        	3
Q4 	    200 Kbps 	100 Kbps        	1


*** Test Cases ***

Test Traffic between NSG-E1 & NSG-E2 without QoS applied, no traffic dropped

    ####Connect STC ports to NSGs
    SSHLibrary.Open Connection    ${default_target_server}
    SSHLibrary.Login    ${cats_target_host_login}
    ...                 ${cats_target_host_passwd}

#    SSHLibrary.Execute Command     /root/vifmove.sh ${STCv_VM_name} ${STCv_port1} br1RG1
#    SSHLibrary.Execute Command     /root/vifmove.sh ${STCv_VM_name} ${STCv_port2} br1RG2
    SSHLibrary.Close Connection



    [Teardown]    STCV.Disconnect Chassis
    STCV.Force Release Ports
    ...    chassis_address=${cats_chassis_STCv}
    STCV.Setup Traffic Generator
    ...    config_file=${CURDIR}/stcv_L3_qos_1.yaml
    ...    _port1_ip=${cats_data_ip_NSG-E-1}
    ...    _port1_gw=${cats_data_gw_NSG-E-1}
    ...    _port1_vlan=207
    ...    _port2_ip=${cats_data_ip_NSG-E-2}
    ...    _port2_gw=${cats_data_gw_NSG-E-2}
    ...    _port2_vlan=208
    ...    _Duration=30

    STCV.Subscribe to all results
    STCV.Start Devices 
    STCV.Start Traffic Generation
   

    Sleep    10
    ${res_set} =    Get Stream Summary Results
    Set Suite Variable    ${res_set}
    Log    ${res_set}
    ${res_set1} =    Get Stream Summary Results
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    ${\n}L1TXStreamblock VOIP
    ...    -- L1 Bit Rate: ${res_set1['VOIP']['TxStreamResults']['L1BitRate']} bit/s
    ...    ${\n}L1RXStreamblock VOIP
    ...    -- L1 Bit Rate: ${res_set1['VOIP']['RxStreamSummaryResults']['L1BitRate']} bit/s
    ...    ${\n}L1TXStreamblock GOLD
    ...    -- L1 Bit Rate: ${res_set1['GOLD']['TxStreamResults']['L1BitRate']} bit/s
    ...    ${\n}L1RXStreamblock GOLD
    ...    -- L1 Bit Rate: ${res_set1['GOLD']['RxStreamSummaryResults']['L1BitRate']} bit/s 
    ...    ${\n}L1TXStreamblock SILVER
    ...    -- L1 Bit Rate: ${res_set1['SILVER']['TxStreamResults']['L1BitRate']} bit/s
    ...    ${\n}L1RXStreamblock SILVER
    ...    -- L1 Bit Rate: ${res_set1['SILVER']['RxStreamSummaryResults']['L1BitRate']} bit/s
    ...    ${\n}L1TXStreamblock BRONZE
    ...    -- L1 Bit Rate: ${res_set1['BRONZE']['TxStreamResults']['L1BitRate']} bit/s
    ...    ${\n}L1RXStreamblock BRONZE
    ...    -- L1 Bit Rate: ${res_set1['BRONZE']['RxStreamSummaryResults']['L1BitRate']} bit/s${\n}

    Log to console    ${msg}

    STCV.Wait for Traffic to Stop
    Sleep    7s

    Tx Frame Count Should Be Greater Than 0

    Rx Frame Count Should Be Greater Than 0

    STCV.Dropped Frame Percent Should Be Equal
    ...    value=0
    ...    result_set=${res_set}
    ...    result_type=RxStreamSummaryResults

   STCV.Disconnect Chassis

Create Ingress Classification (mapping DSCP to FC)
   User Login
   ...    cats_username=${cats_org_admin}
   ...    cats_password=${cats_org_admin_pwd}
   ...    cats_org_name=${cats_org_name}

    Create DSCP Mapping Table
    ...    cats_org_name=${cats_org_name}
    ...    name=${dscp_mapping_table_name}

    Create DSCP Mapping
    ...    cats_org_name=${cats_org_name}
    ...    cats_dscp_mapping_table_name=${dscp_mapping_table_name}
    ...    forwardingClass=H
    ...    DSCP=0

    Create DSCP Mapping
    ...    cats_org_name=${cats_org_name}
    ...    cats_dscp_mapping_table_name=${dscp_mapping_table_name}
    ...    forwardingClass=C
    ...    DSCP=32

    Create DSCP Mapping
    ...    cats_org_name=${cats_org_name}
    ...    cats_dscp_mapping_table_name=${dscp_mapping_table_name}
    ...    forwardingClass=A
    ...    DSCP=35

    Create DSCP Mapping
    ...    cats_org_name=${cats_org_name}
    ...    cats_dscp_mapping_table_name=${dscp_mapping_table_name}
    ...    forwardingClass=D
    ...    DSCP=8

Apply DSCP mapping to Ingress Subnet (LAN Side)
    Create QoS in Subnet
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_subnet_name=${cats_subnet1_name}
    ...    cats_dscp_mapping_table_name=${dscp_mapping_table_name} 
    ...    name=${Subnet_QOS_Policy}
    ...    active=${True}


Create Egress QOS (WAN side)
   Create Rate Limiter in Organization
   ...                     cats_org_name=${cats_org_name}
   ...                     name=UPLINK
   ...                     committedInformationRate=1
   ...                     peakInformationRate=1.5
   ...                     peakBurstSize=1

   Create Rate Limiter in Organization
   ...                     cats_org_name=${cats_org_name}
   ...                     name=VOIP
   ...                     committedInformationRate=0.4
   ...                     peakInformationRate=1.5
   ...                     peakBurstSize=1

   Create Rate Limiter in Organization
   ...                     cats_org_name=${cats_org_name}
   ...                     name=GOLD
   ...                     committedInformationRate=0.2
   ...                     peakInformationRate=1.5
   ...                     peakBurstSize=1

   Create Rate Limiter in Organization
   ...                     cats_org_name=${cats_org_name}
   ...                     name=SILVER
   ...                     committedInformationRate=0.3
   ...                     peakInformationRate=1.5
   ...                     peakBurstSize=1

   Create Rate Limiter in Organization
   ...                     cats_org_name=${cats_org_name}
   ...                     name=BRONZE
   ...                     committedInformationRate=0.1
   ...                     peakInformationRate=1.5
   ...                     peakBurstSize=1



   Create Egress QoS Policy in Organization
   ...                     cats_org_name=${cats_org_name}
   ...                     name=${Egress_QOS_Policy}
   ...                     description=EgressQOSPolicy_CATS
   ...                     cats_parent_queue_rate_limiter_name=UPLINK
   ...                     defaultServiceClass=H
   ...    cats_queue1_rate_limiter_name=VOIP
   ...    queue1ForwardingClasses=@[A,B]
   ...    cats_queue2_rate_limiter_name=Gold
   ...    queue2ForwardingClasses=@[C]
   ...    cats_queue3_rate_limiter_name=Silver
   ...    queue3ForwardingClasses=@[D]
   ...    cats_queue4_rate_limiter_name=Bronze
   ...    queue4ForwardingClasses=@[E,F,G,H]
#   ...    cats_dscp_remarking_profile_name=${dscp_remarking_profile_name} 
#   ...    cats_cos_remarking_profile_name=${CoS_Remarking_Policy_name}

Associate Egress QoS Policy with NSG uplinks VLAN 
    Associate Egress QoS Policy with NSG VLAN
    ...    cats_egress_qos_policy_name=${Egress_QOS_Policy}
    ...    cats_org_name=${cats_org_name}
    ...    cats_nsg_name=${cats_nsg_name1}
    ...    cats_nsg_port_name=port1
    ...    cats_vlan_id=201

    Associate Egress QoS Policy with NSG VLAN
    ...    cats_egress_qos_policy_name=${Egress_QOS_Policy}
    ...    cats_org_name=${cats_org_name}
    ...    cats_nsg_name=${cats_nsg_name2}
    ...    cats_nsg_port_name=port1
    ...    cats_vlan_id=201

Test Traffic between RG1 & RG2 with QOS applied.
    [Teardown]    STCV.Disconnect Chassis
    STCV.Force Release Ports
    ...    chassis_address=${cats_chassis_STCv}
    STCV.Setup Traffic Generator
    ...    config_file=${CURDIR}/stcv_L3_qos_1.yaml
    ...    _port1_ip=${cats_NSGv1_ip}
    ...    _port1_gw=${cats_subnet1_gateway}
    ...    _port1_vlan=500
    ...    _port2_ip=${cats_NSGv2_ip}
    ...    _port2_gw=${cats_subnet2_gateway}
    ...    _port2_vlan=500
    ...    _Duration=30

    STCV.Subscribe to all results
    STCV.Start Devices 
    STCV.Start Traffic Generation

    Sleep    10
    
    ${res_set2} =    Get Stream Summary Results
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    ${\n}L1TXStreamblock VOIP
    ...    -- L1 Bit Rate: ${res_set2['VOIP']['TxStreamResults']['L1BitRate']} bit/s
    ...    ${\n}L1RXStreamblock VOIP
    ...    -- L1 Bit Rate: ${res_set2['VOIP']['RxStreamSummaryResults']['L1BitRate']} bit/s
    ...    ${\n}L1TXStreamblock GOLD
    ...    -- L1 Bit Rate: ${res_set2['GOLD']['TxStreamResults']['L1BitRate']} bit/s
    ...    ${\n}L1RXStreamblock GOLD
    ...    -- L1 Bit Rate: ${res_set2['GOLD']['RxStreamSummaryResults']['L1BitRate']} bit/s 
    ...    ${\n}L1TXStreamblock SILVER
    ...    -- L1 Bit Rate: ${res_set2['SILVER']['TxStreamResults']['L1BitRate']} bit/s
    ...    ${\n}L1RXStreamblock SILVER
    ...    -- L1 Bit Rate: ${res_set2['SILVER']['RxStreamSummaryResults']['L1BitRate']} bit/s
    ...    ${\n}L1TXStreamblock BRONZE
    ...    -- L1 Bit Rate: ${res_set2['BRONZE']['TxStreamResults']['L1BitRate']} bit/s
    ...    ${\n}L1RXStreamblock BRONZE
    ...    -- L1 Bit Rate: ${res_set2['BRONZE']['RxStreamSummaryResults']['L1BitRate']} bit/s${\n}

    Log to console    ${msg}
    Set Suite Variable    ${res_set2}

    STCV.Wait for Traffic to Stop
    Sleep    7s


Ensure Traffic RX bit rate satisfies parameters
    stcv.StreamBlock RX L1 Bit Rate Should Be In Range
    ...    lower_limit=820000
    ...    upper_limit=910000
    ...    streamblock_name=VOIP
    ...    result_set=${res_set2}

    stcv.StreamBlock RX L1 Bit Rate Should Be In Range
    ...    lower_limit=180000
    ...    upper_limit=210000
    ...    streamblock_name=GOLD
    ...    result_set=${res_set2}

    stcv.StreamBlock RX L1 Bit Rate Should Be In Range
    ...    lower_limit=270000
    ...    upper_limit=310000
    ...    streamblock_name=SILVER
    ...    result_set=${res_set2}

    stcv.StreamBlock RX L1 Bit Rate Should Be In Range
    ...    lower_limit=80000
    ...    upper_limit=110000
    ...    streamblock_name=BRONZE
    ...    result_set=${res_set2}


   STCV.Disconnect Chassis

*** Keywords ***
Tx Frame Count Should Be Greater Than 0
    STCV.Frame Count Should Be Greater
    ...    value=0
    ...    result_type=TxStreamResults
    ...    result_set=${res_set}

Rx Frame Count Should Be Greater Than 0
    STCV.Frame Count Should Be Greater
    ...    value=0
    ...    result_type=RxStreamSummaryResults
    ...    result_set=${res_set}