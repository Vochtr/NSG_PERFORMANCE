*** Settings ***

Resource                ../_VARS/vars.robot
Resource                ../_VARS/test-090.robot
Resource                cats_lib/resources/cats_common.robot
Resource                cats_lib/resources/stcv.robot

Force Tags              matrix
Documentation           Test STCv OVERLAY traffic between 2 (or more) NSG's
Test Timeout            500 minutes
Suite Teardown          STCV.Disconnect Chassis     

*** comment ***

This test case is to test STCv OVERLAY traffic between 2 (physical)(virtual) NSG's

*** Test Cases ***

Enterprise Login (csproot) + Checking NSG availability
    [Setup]  Csproot User is logged in VSD   	

    Run Keyword If   ${NSG-C_1} == True       NSG-C_1 is up in Monitoring
    Run Keyword If   ${NSG-C_2} == True       NSG-C_2 is up in Monitoring
    Run Keyword If   ${NSG-E_1} == True       NSG-E_1 is up in Monitoring
    Run Keyword If   ${NSG-E_2} == True       NSG-E_2 is up in Monitoring
    Run Keyword If   ${NSG-E200_1} == True    NSG-E200_1 is up in Monitoring
    Run Keyword If   ${NSG-E200_2} == True    NSG-E200_2 is up in Monitoring
    Run Keyword If   ${NSG-E300_1} == True    NSG-E300_1 is up in Monitoring
    Run Keyword If   ${NSG-E300_2} == True    NSG-E300_2 is up in Monitoring
    Run Keyword If   ${NSG-X200_1} == True    NSG-X200_1 is up in Monitoring
    Run Keyword If   ${NSG-X200_2} == True    NSG-X200_2 is up in Monitoring
    Run Keyword If   ${NSG-X_1} == True       NSG-X_1 is up in Monitoring
    Run Keyword If   ${NSG-X_2} == True       NSG-X_2 is up in Monitoring
	
    Run Keyword If   ${NSGv01} == True   	  NSGv01 is up in Monitoring
    Run Keyword If   ${NSGv02} == True   	  NSGv02 is up in Monitoring
    Run Keyword If   ${NSGv03} == True   	  NSGv03 is up in Monitoring
    Run Keyword If   ${NSGv04} == True   	  NSGv04 is up in Monitoring
    Run Keyword If   ${NSGv05} == True   	  NSGv05 is up in Monitoring
	Run Keyword If   ${NSGv06} == True   	  NSGv06 is up in Monitoring
    Run Keyword If   ${NSGv07} == True   	  NSGv07 is up in Monitoring
    Run Keyword If   ${NSGv08} == True   	  NSGv08 is up in Monitoring
    Run Keyword If   ${NSGv09} == True   	  NSGv09 is up in Monitoring
    Run Keyword If   ${NSGv10} == True   	  NSGv10 is up in Monitoring
	
#Release Ports
    STCV.Force Release Ports
    ...    chassis_address=${cats_chassis_STCv}

Configuring STCv
    Run Keyword If   "${streamblocks_vlan_dir}" == "2_0_bi"     Configuring STCv 2 bi streamblocks (no vlan)
    Run Keyword If   "${streamblocks_vlan_dir}" == "2_0_uni"    Configuring STCv 2 uni streamblocks (no vlan)
    Run Keyword If   "${streamblocks_vlan_dir}" == "2_1_bi"     Configuring STCv 2 bi streamblocks (vlan)
	Run Keyword If   "${streamblocks_vlan_dir}" == "2_1_uni"    Configuring STCv 2 uni streamblocks (vlan)
    Run Keyword If   "${streamblocks_vlan_dir}" == "3_0_uni"    Configuring STCv 3 uni streamblocks (no vlan)
    Run Keyword If   "${streamblocks_vlan_dir}" == "4_0_uni"    Configuring STCv 4 uni streamblocks (no vlan)
   	Run Keyword If   "${streamblocks_vlan_dir}" == "5_0_uni"    Configuring STCv 5 uni streamblocks (no vlan)
    
#Subscribing to all results
    STCV.Subscribe to all results

Starting Devices + Traffic
    STCV.Start Devices

#Start traffic 
    STCV.Start Traffic Generation

#Traffic will pass through from the second device
	STCV.Wait for Traffic to Stop

#Get realtime results 5 sec after the traffic started
    Sleep    5
    ${rt_res_set} =    STCV.Get Stream Summary Results
#	Log to console    ${rt_res_set}	
	
Display Realtime Traffic Results
    Run Keyword If   "${streamblocks_vlan_dir}" == "2_0_bi"     Display NSG Realtime Traffic Results 2 bi streamblocks (no vlan)
	Run Keyword If   "${streamblocks_vlan_dir}" == "2_0_uni"    Display NSG Realtime Traffic Results 2 uni streamblocks (no vlan)
	Run Keyword If   "${streamblocks_vlan_dir}" == "2_1_bi"     Display NSG Realtime Traffic Results 2 bi streamblocks (vlan)
    Run Keyword If   "${streamblocks_vlan_dir}" == "2_1_uni"    Display NSG Realtime Traffic Results 2 uni streamblocks (vlan)
    Run Keyword If   "${streamblocks_vlan_dir}" == "3_0_uni"    Display NSG Realtime Traffic Results 3 uni streamblocks (no vlan)
    Run Keyword If   "${streamblocks_vlan_dir}" == "4_0_uni"    Display NSG Realtime Traffic Results 4 uni streamblocks (no vlan)
	Run Keyword If   "${streamblocks_vlan_dir}" == "5_0_uni"    Display NSG Realtime Traffic Results 5 uni streamblocks (no vlan)
	
#Get End-of-Test Traffic Results
    ${res_set} =    Get Streamblock Results
    Set Suite Variable    ${res_set}

Ensure Traffic is send and no Frame Drops (threshold <= 0.5%)
    Tx Frame Count Should Be Greater Than 0
    Rx Frame Count Should Be Greater Than 0
	
#Ensure no Frame Drops Occurred (threshold <= 0.5%)
	Dropped Frame Percent Should Be Less Than 50
	Dropped Frame Percent Should Be Less Than 10
    Dropped Frame Percent Should Be Less Than 1
    Dropped Frame Percent Should Be Less Or Equal Than 0.5
#   Dropped Frame Percent Should Be 0
	
#Exporting DB results to CSV file
#    STCV.Export DB results to CSV File
#   ...    csv_path=/home/cats/X200-1-2_results
	
#Disconnect STCv	
	STCV.Disconnect Chassis
	
*** Keywords ***
  
Configuring STCv 2 bi streamblocks (vlan)
    STCV.Setup Traffic Generator
    ...     config_file=${CURDIR}/_STCV/stcv_bi_vlan_${duration}.yaml
	...		_chassis=${cats_chassis_STCv}
	...		_ip_NSG1=${ip_NSG1}	
	...		_gw_NSG1=${gw_NSG1}	
	...		_ip_NSG2=${ip_NSG2}	
	...		_gw_NSG2=${gw_NSG2}	
	...     _vlan1=${VLAN1}
	...     _vlan2=${VLAN2}
	...		_frame=${traffic_frame}
	...		_load=${traffic_load}
	
Configuring STCv 2 bi streamblocks (no vlan)
    STCV.Setup Traffic Generator
    ...     config_file=${CURDIR}/_STCV/stcv_bi_novlan_${duration}.yaml
	...		_chassis=${cats_chassis_STCv}
	...		_ip_NSG1=${ip_NSG1}	
	...		_gw_NSG1=${gw_NSG1}	
	...		_ip_NSG2=${ip_NSG2}	
	...		_gw_NSG2=${gw_NSG2}	
	...		_frame=${traffic_frame}
	...		_load=${traffic_load}

Configuring STCv 2 uni streamblocks (vlan)
    STCV.Setup Traffic Generator
    ...     config_file=${CURDIR}/_STCV/stcv_uni_vlan_${duration}.yaml
	...		_chassis=${cats_chassis_STCv}
	...		_ip_NSG1=${ip_NSG1}	
	...		_gw_NSG1=${gw_NSG1}	
	...		_ip_NSG2=${ip_NSG2}	
	...		_gw_NSG2=${gw_NSG2}	
	...		_frame=${traffic_frame}
	...		_load=${traffic_load}

Configuring STCv 2 uni streamblocks (no vlan)
    STCV.Setup Traffic Generator
    ...     config_file=${CURDIR}/_STCV/stcv_uni_novlan_${duration}.yaml
	...		_chassis=${cats_chassis_STCv}
	...		_ip_NSG1=${ip_NSG1}	
	...		_gw_NSG1=${gw_NSG1}	
	...		_ip_NSG2=${ip_NSG2}	
	...		_gw_NSG2=${gw_NSG2}	
	...		_frame=${traffic_frame}
	...		_load=${traffic_load}

Configuring STCv 3 uni streamblocks (no vlan)
    STCV.Setup Traffic Generator
    ...     config_file=${CURDIR}/_STCV/NSG-X-X_uni_novlan_3stb.yaml
	...		_chassis=${cats_chassis_STCv}
	...		_ip_NSG1=${ip_NSG1}	
	...		_gw_NSG1=${gw_NSG1}	
	...		_ip_NSG2=${ip_NSG2}	
 	...		_gw_NSG2=${gw_NSG2}	
 	...		_ip_NSG3=${ip_NSG3}	
	...		_gw_NSG3=${gw_NSG3}	
	...		_ip_NSG4=${ip_NSG4}	
	...		_gw_NSG4=${gw_NSG4}
	...		_frame=${traffic_frame}
	...		_load=${traffic_load}

Configuring STCv 4 uni streamblocks (no vlan)
    STCV.Setup Traffic Generator
    ...     config_file=${CURDIR}/_STCV/NSG-X-X_uni_novlan_4stb.yaml
	...		_chassis=${cats_chassis_STCv}
	...		_ip_NSG1=${ip_NSG1}	
	...		_gw_NSG1=${gw_NSG1}	
	...		_ip_NSG2=${ip_NSG2}	
 	...		_gw_NSG2=${gw_NSG2}	
 	...		_ip_NSG3=${ip_NSG3}	
	...		_gw_NSG3=${gw_NSG3}	
	...		_ip_NSG4=${ip_NSG4}	
	...		_gw_NSG4=${gw_NSG4}	
	...		_ip_NSG5=${ip_NSG5}	
	...		_gw_NSG5=${gw_NSG5}	
	...		_frame=${traffic_frame}
	...		_load=${traffic_load}	

Configuring STCv 5 uni streamblocks (no vlan)
    STCV.Setup Traffic Generator
    ...     config_file=${CURDIR}/_STCV/NSG-X-X_uni_novlan_5stb.yaml
	...		_chassis=${cats_chassis_STCv}
	...		_ip_NSG1=${ip_NSG1}	
	...		_gw_NSG1=${gw_NSG1}	
	...		_ip_NSG2=${ip_NSG2}	
 	...		_gw_NSG2=${gw_NSG2}	
 	...		_ip_NSG3=${ip_NSG3}	
	...		_gw_NSG3=${gw_NSG3}	
	...		_ip_NSG4=${ip_NSG4}	
	...		_gw_NSG4=${gw_NSG4}	
	...		_ip_NSG5=${ip_NSG5}	
	...		_gw_NSG5=${gw_NSG5}	
	...		_ip_NSG6=${ip_NSG6}	
	...		_gw_NSG6=${gw_NSG6}	
	...		_frame=${traffic_frame}
	...		_load=${traffic_load}	
	
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
	
Dropped Frame Percent Should Be Less Than 50
	STCV.Dropped Frame Percent Should Be Less
    ...    value=50
    ...    result_set=${res_set}

Dropped Frame Percent Should Be Less Than 10
	STCV.Dropped Frame Percent Should Be Less
    ...    value=10
    ...    result_set=${res_set}

Dropped Frame Percent Should Be Less Than 1
	STCV.Dropped Frame Percent Should Be Less
    ...    value=1
    ...    result_set=${res_set}
	
Dropped Frame Percent Should Be Less Or Equal Than 0.5
	STCV.Dropped Frame Percent Should Be Less Or Equal 
    ...    value=0.5
    ...    result_set=${res_set}	
	
Dropped Frame Percent Should Be 0
	STCV.Dropped Frame Percent Should Be Equal
    ...    value=0
    ...    result_set=${res_set}
	
Display NSG Realtime Traffic Results 2 bi streamblocks (vlan)
    ${res_set} =    Get Stream Summary Results
    ${msg} =    Catenate    SEPARATOR=${\n}
	...    ${\n}${\n}Data Path Check: ${TestCaseName}
    ...    ${\n}Streamblock 1: Port 1->2
#	...    -- Tx Bit Rate: ${res_set['p1->p2_sb1']['TxStreamResults']['BitRate']} bit/s
#	...    -- Tx Frame Count: ${res_set['p1->p2_sb1']['TxStreamResults']['FrameCount']} 
#	...    -- Tx Octet Count: ${res_set['p1->p2_sb1']['TxStreamResults']['OctetCount']} 
#   ...    -- Rx Bit Rate: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['BitRate']} bit/s
#	...    -- Rx Bit Count: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['BitCount']} 
	...    -- Rx Dropped Frame Count: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['DroppedFrameCount']} frames
	...    -- Rx Dropped Frame Percent: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['DroppedFramePercent']} %
#	...    -- Rx Dropped Frame PercentRate: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['DroppedFramePercentRate']} 
#	...    -- Rx Dropped Frame Rate: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['DroppedFrameRate']} 
#	...    -- Rx Frame Count: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['FrameCount']} 
#	...    -- Rx Octet Count: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['OctetCount']} 
##	...    -- Rx Min Latency: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['MinLatency']} 
##	...    -- Rx Max Latency: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['MaxLatency']} 
#	...    -- Rx Avg Latency: ${res_set['p2->p1_sb2']['RxStreamSummaryResults']['AvgLatency']} 
    ...    ${\n}Streamblock 2: Port 2->1
#	...    -- Tx Bit Rate: ${res_set['p2->p1_sb2']['TxStreamResults']['BitRate']} bit/s
#	...    -- Tx Frame Count: ${res_set['p2->p1_sb2']['TxStreamResults']['FrameCount']} 
#	...    -- Tx Octet Count: ${res_set['p2->p1_sb2']['TxStreamResults']['OctetCount']} 
#   ...    -- Rx Bit Rate: ${res_set['p2->p1_sb2']['RxStreamSummaryResults']['BitRate']} bit/s
#	...    -- Rx Bit Count: ${res_set['p2->p1_sb2']['RxStreamSummaryResults']['BitCount']} 
	...    -- Rx Dropped Frame Count: ${res_set['p2->p1_sb2']['RxStreamSummaryResults']['DroppedFrameCount']} frames
	...    -- Rx Dropped Frame Percent: ${res_set['p2->p1_sb2']['RxStreamSummaryResults']['DroppedFramePercent']} % 
#	...    -- Rx Dropped Frame PercentRate: ${res_set['p2->p1_sb2']['RxStreamSummaryResults']['DroppedFramePercentRate']} 
#	...    -- Rx Dropped Frame Rate: ${res_set['p2->p1_sb2']['RxStreamSummaryResults']['DroppedFrameRate']} 
#	...    -- Rx Frame Count: ${res_set['p2->p1_sb2']['RxStreamSummaryResults']['FrameCount']} 
#	...    -- Rx Octet Count: ${res_set['p2->p1_sb2']['RxStreamSummaryResults']['OctetCount']} 
##	...    -- Rx Min Latency: ${res_set['p2->p1_sb2']['RxStreamSummaryResults']['MinLatency']} 
##	...    -- Rx Max Latency: ${res_set['p2->p1_sb2']['RxStreamSummaryResults']['MaxLatency']}
#	...    -- Rx Avg Latency: ${res_set['p2->p1_sb2']['RxStreamSummaryResults']['AvgLatency']}
    ...    ${\n} 
    
    Log to console    ${msg}
	
Display NSG Realtime Traffic Results 2 bi streamblocks (no vlan)
    ${res_set} =    Get Stream Summary Results
    ${msg} =    Catenate    SEPARATOR=${\n}
	...    ${\n}${\n}Data Path Check: ${TestCaseName}
    ...    ${\n}Streamblock 1: Port 1->2
#	...    -- Tx Bit Rate: ${res_set['p1->p2_sb1']['TxStreamResults']['BitRate']} bit/s
#	...    -- Tx Frame Count: ${res_set['p1->p2_sb1']['TxStreamResults']['FrameCount']} 
#	...    -- Tx Octet Count: ${res_set['p1->p2_sb1']['TxStreamResults']['OctetCount']} 
#   ...    -- Rx Bit Rate: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['BitRate']} bit/s
#	...    -- Rx Bit Count: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['BitCount']} 
	...    -- Rx Dropped Frame Count: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['DroppedFrameCount']} frames
	...    -- Rx Dropped Frame Percent: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['DroppedFramePercent']} %
#	...    -- Rx Dropped Frame PercentRate: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['DroppedFramePercentRate']} 
#	...    -- Rx Dropped Frame Rate: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['DroppedFrameRate']} 
#	...    -- Rx Frame Count: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['FrameCount']} 
#	...    -- Rx Octet Count: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['OctetCount']} 
##	...    -- Rx Min Latency: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['MinLatency']} 
##	...    -- Rx Max Latency: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['MaxLatency']} 
#	...    -- Rx Avg Latency: ${res_set['p2->p1_sb2']['RxStreamSummaryResults']['AvgLatency']} 
    ...    ${\n}Streamblock 2: Port 2->1
#	...    -- Tx Bit Rate: ${res_set['p2->p1_sb2']['TxStreamResults']['BitRate']} bit/s
#	...    -- Tx Frame Count: ${res_set['p2->p1_sb2']['TxStreamResults']['FrameCount']} 
#	...    -- Tx Octet Count: ${res_set['p2->p1_sb2']['TxStreamResults']['OctetCount']} 
#   ...    -- Rx Bit Rate: ${res_set['p2->p1_sb2']['RxStreamSummaryResults']['BitRate']} bit/s
#	...    -- Rx Bit Count: ${res_set['p2->p1_sb2']['RxStreamSummaryResults']['BitCount']} 
	...    -- Rx Dropped Frame Count: ${res_set['p2->p1_sb2']['RxStreamSummaryResults']['DroppedFrameCount']} frames
	...    -- Rx Dropped Frame Percent: ${res_set['p2->p1_sb2']['RxStreamSummaryResults']['DroppedFramePercent']} % 
#	...    -- Rx Dropped Frame PercentRate: ${res_set['p2->p1_sb2']['RxStreamSummaryResults']['DroppedFramePercentRate']} 
#	...    -- Rx Dropped Frame Rate: ${res_set['p2->p1_sb2']['RxStreamSummaryResults']['DroppedFrameRate']} 
#	...    -- Rx Frame Count: ${res_set['p2->p1_sb2']['RxStreamSummaryResults']['FrameCount']} 
#	...    -- Rx Octet Count: ${res_set['p2->p1_sb2']['RxStreamSummaryResults']['OctetCount']} 
##	...    -- Rx Min Latency: ${res_set['p2->p1_sb2']['RxStreamSummaryResults']['MinLatency']} 
##	...    -- Rx Max Latency: ${res_set['p2->p1_sb2']['RxStreamSummaryResults']['MaxLatency']}
#	...    -- Rx Avg Latency: ${res_set['p2->p1_sb2']['RxStreamSummaryResults']['AvgLatency']}
    ...    ${\n} 
    
    Log to console    ${msg}
	
Display NSG Realtime Traffic Results 2 uni streamblocks (vlan)
    ${res_set} =    Get Stream Summary Results
    ${msg} =    Catenate    SEPARATOR=${\n}
	...    ${\n}${\n}Data Path Check: ${TestCaseName}
    ...    ${\n}Streamblock 1: Port 1->2
#	...    -- Tx Bit Rate: ${res_set['p1->p2_sb1']['TxStreamResults']['BitRate']} bit/s
#	...    -- Tx Frame Count: ${res_set['p1->p2_sb1']['TxStreamResults']['FrameCount']} 
#	...    -- Tx Octet Count: ${res_set['p1->p2_sb1']['TxStreamResults']['OctetCount']} 
#   ...    -- Rx Bit Rate: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['BitRate']} bit/s
#	...    -- Rx Bit Count: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['BitCount']} 
	...    -- Rx Dropped Frame Count: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['DroppedFrameCount']} frames
	...    -- Rx Dropped Frame Percent: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['DroppedFramePercent']} %
#	...    -- Rx Dropped Frame PercentRate: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['DroppedFramePercentRate']} 
#	...    -- Rx Dropped Frame Rate: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['DroppedFrameRate']} 
#	...    -- Rx Frame Count: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['FrameCount']} 
#	...    -- Rx Octet Count: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['OctetCount']} 
##	...    -- Rx Min Latency: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['MinLatency']} 
##	...    -- Rx Max Latency: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['MaxLatency']} 
#	...    -- Rx Avg Latency: ${res_set['p2->p1_sb2']['RxStreamSummaryResults']['AvgLatency']} 
    ...    ${\n} 
	  
    Log to console    ${msg}

Display NSG Realtime Traffic Results 2 uni streamblocks (no vlan)
    ${res_set} =    Get Stream Summary Results
    ${msg} =    Catenate    SEPARATOR=${\n}
	...    ${\n}${\n}Data Path Check: ${TestCaseName}
    ...    ${\n}Streamblock 1: Port 1->2
#	...    -- Tx Bit Rate: ${res_set['p1->p2_sb1']['TxStreamResults']['BitRate']} bit/s
#	...    -- Tx Frame Count: ${res_set['p1->p2_sb1']['TxStreamResults']['FrameCount']} 
#	...    -- Tx Octet Count: ${res_set['p1->p2_sb1']['TxStreamResults']['OctetCount']} 
#   ...    -- Rx Bit Rate: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['BitRate']} bit/s
#	...    -- Rx Bit Count: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['BitCount']} 
	...    -- Rx Dropped Frame Count: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['DroppedFrameCount']} frames
	...    -- Rx Dropped Frame Percent: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['DroppedFramePercent']} %
#	...    -- Rx Dropped Frame PercentRate: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['DroppedFramePercentRate']} 
#	...    -- Rx Dropped Frame Rate: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['DroppedFrameRate']} 
#	...    -- Rx Frame Count: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['FrameCount']} 
#	...    -- Rx Octet Count: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['OctetCount']} 
##	...    -- Rx Min Latency: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['MinLatency']} 
##	...    -- Rx Max Latency: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['MaxLatency']} 
#	...    -- Rx Avg Latency: ${res_set['p2->p1_sb2']['RxStreamSummaryResults']['AvgLatency']} 
    ...    ${\n} 
    
    Log to console    ${msg}
	
Display NSG Realtime Traffic Results 3 uni streamblocks (no vlan)
    ${res_set} =    Get Stream Summary Results
	
	Log to console    ${res_set}
	 
    ${msg} =    Catenate    SEPARATOR=${\n}
	...    ${\n}${\n}Data Path Check: ${TestCaseName}
    ...    ${\n}Streamblock 1: Port 1->2
    ...    -- Bit Rate: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['BitRate']} bit/s
	...    -- Bit Count: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['BitCount']} 
	...    -- Dropped Frame Count: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['DroppedFrameCount']} 
	...    -- Dropped Frame Percent: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['DroppedFramePercent']} 
	...    -- Dropped Frame PercentRate: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['DroppedFramePercentRate']} 
	...    -- Dropped Frame Rate: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['DroppedFrameRate']} 
	...    -- Frame Count: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['FrameCount']} 
	...    -- Octet Count: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['OctetCount']} 
	...    -- Min Latency: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['MinLatency']} 
	...    -- Max Latency: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['MaxLatency']} 
    ...    ${\n}Streamblock 2: Port 1->2
    ...    -- Bit Rate: ${res_set['p1->p2_sb2']['RxStreamSummaryResults']['BitRate']} bit/s
	...    -- Bit Count: ${res_set['p1->p2_sb2']['RxStreamSummaryResults']['BitCount']} 
	...    -- Dropped Frame Count: ${res_set['p1->p2_sb2']['RxStreamSummaryResults']['DroppedFrameCount']} 
	...    -- Dropped Frame Percent: ${res_set['p1->p2_sb2']['RxStreamSummaryResults']['DroppedFramePercent']} 
	...    -- Dropped Frame PercentRate: ${res_set['p1->p2_sb2']['RxStreamSummaryResults']['DroppedFramePercentRate']} 
	...    -- Dropped Frame Rate: ${res_set['p1->p2_sb2']['RxStreamSummaryResults']['DroppedFrameRate']} 
	...    -- Frame Count: ${res_set['p1->p2_sb2']['RxStreamSummaryResults']['FrameCount']} 
	...    -- Octet Count: ${res_set['p1->p2_sb2']['RxStreamSummaryResults']['OctetCount']} 
	...    -- Min Latency: ${res_set['p1->p2_sb2']['RxStreamSummaryResults']['MinLatency']} 
	...    -- Max Latency: ${res_set['p1->p2_sb2']['RxStreamSummaryResults']['MaxLatency']} 
    ...    ${\n}Streamblock 4: Port 2->1
    ...    -- Bit Rate: ${res_set['p2->p1_sb4']['RxStreamSummaryResults']['BitRate']} bit/s
	...    -- Bit Count: ${res_set['p2->p1_sb4']['RxStreamSummaryResults']['BitCount']} 
	...    -- Dropped Frame Count: ${res_set['p2->p1_sb4']['RxStreamSummaryResults']['DroppedFrameCount']} 
	...    -- Dropped Frame Percent: ${res_set['p2->p1_sb4']['RxStreamSummaryResults']['DroppedFramePercent']} 
	...    -- Dropped Frame PercentRate: ${res_set['p2->p1_sb4']['RxStreamSummaryResults']['DroppedFramePercentRate']} 
	...    -- Dropped Frame Rate: ${res_set['p2->p1_sb4']['RxStreamSummaryResults']['DroppedFrameRate']} 
	...    -- Frame Count: ${res_set['p2->p1_sb4']['RxStreamSummaryResults']['FrameCount']} 
	...    -- Octet Count: ${res_set['p2->p1_sb4']['RxStreamSummaryResults']['OctetCount']} 
	...    -- Min Latency: ${res_set['p2->p1_sb4']['RxStreamSummaryResults']['MinLatency']} 
	...    -- Max Latency: ${res_set['p2->p1_sb4']['RxStreamSummaryResults']['MaxLatency']}${\n}
	
    Log to console    ${msg}
	
Display NSG Realtime Traffic Results 4 uni streamblocks (no vlan)
    ${res_set} =    Get Stream Summary Results
	
	Log to console    ${res_set}
	 
    ${msg} =    Catenate    SEPARATOR=${\n}
	...    ${\n}${\n}Data Path Check: ${TestCaseName}
    ...    ${\n}Streamblock 1: Port 1->2
    ...    -- Bit Rate: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['BitRate']} bit/s
	...    -- Bit Count: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['BitCount']} 
	...    -- Dropped Frame Count: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['DroppedFrameCount']} 
	...    -- Dropped Frame Percent: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['DroppedFramePercent']} 
	...    -- Dropped Frame PercentRate: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['DroppedFramePercentRate']} 
	...    -- Dropped Frame Rate: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['DroppedFrameRate']} 
	...    -- Frame Count: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['FrameCount']} 
	...    -- Octet Count: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['OctetCount']} 
	...    -- Min Latency: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['MinLatency']} 
	...    -- Max Latency: ${res_set['p1->p2_sb1']['RxStreamSummaryResults']['MaxLatency']} 
    ...    ${\n}Streamblock 2: Port 1->2
    ...    -- Bit Rate: ${res_set['p1->p2_sb2']['RxStreamSummaryResults']['BitRate']} bit/s
	...    -- Bit Count: ${res_set['p1->p2_sb2']['RxStreamSummaryResults']['BitCount']} 
	...    -- Dropped Frame Count: ${res_set['p1->p2_sb2']['RxStreamSummaryResults']['DroppedFrameCount']} 
	...    -- Dropped Frame Percent: ${res_set['p1->p2_sb2']['RxStreamSummaryResults']['DroppedFramePercent']} 
	...    -- Dropped Frame PercentRate: ${res_set['p1->p2_sb2']['RxStreamSummaryResults']['DroppedFramePercentRate']} 
	...    -- Dropped Frame Rate: ${res_set['p1->p2_sb2']['RxStreamSummaryResults']['DroppedFrameRate']} 
	...    -- Frame Count: ${res_set['p1->p2_sb2']['RxStreamSummaryResults']['FrameCount']} 
	...    -- Octet Count: ${res_set['p1->p2_sb2']['RxStreamSummaryResults']['OctetCount']} 
	...    -- Min Latency: ${res_set['p1->p2_sb2']['RxStreamSummaryResults']['MinLatency']} 
	...    -- Max Latency: ${res_set['p1->p2_sb2']['RxStreamSummaryResults']['MaxLatency']} 
	 ...    ${\n}Streamblock 3: Port 1->2
    ...    -- Bit Rate: ${res_set['p1->p2_sb3']['RxStreamSummaryResults']['BitRate']} bit/s
	...    -- Bit Count: ${res_set['p1->p2_sb3']['RxStreamSummaryResults']['BitCount']} 
	...    -- Dropped Frame Count: ${res_set['p1->p2_sb3']['RxStreamSummaryResults']['DroppedFrameCount']} 
	...    -- Dropped Frame Percent: ${res_set['p1->p2_sb3']['RxStreamSummaryResults']['DroppedFramePercent']} 
	...    -- Dropped Frame PercentRate: ${res_set['p1->p2_sb3']['RxStreamSummaryResults']['DroppedFramePercentRate']} 
	...    -- Dropped Frame Rate: ${res_set['p1->p2_sb3']['RxStreamSummaryResults']['DroppedFrameRate']} 
	...    -- Frame Count: ${res_set['p1->p2_sb3']['RxStreamSummaryResults']['FrameCount']} 
	...    -- Octet Count: ${res_set['p1->p2_sb3']['RxStreamSummaryResults']['OctetCount']} 
	...    -- Min Latency: ${res_set['p1->p2_sb3']['RxStreamSummaryResults']['MinLatency']} 
	...    -- Max Latency: ${res_set['p1->p2_sb3']['RxStreamSummaryResults']['MaxLatency']} 
    ...    ${\n}Streamblock 4: Port 2->1
    ...    -- Bit Rate: ${res_set['p2->p1_sb4']['RxStreamSummaryResults']['BitRate']} bit/s
	...    -- Bit Count: ${res_set['p2->p1_sb4']['RxStreamSummaryResults']['BitCount']} 
	...    -- Dropped Frame Count: ${res_set['p2->p1_sb4']['RxStreamSummaryResults']['DroppedFrameCount']} 
	...    -- Dropped Frame Percent: ${res_set['p2->p1_sb4']['RxStreamSummaryResults']['DroppedFramePercent']} 
	...    -- Dropped Frame PercentRate: ${res_set['p2->p1_sb4']['RxStreamSummaryResults']['DroppedFramePercentRate']} 
	...    -- Dropped Frame Rate: ${res_set['p2->p1_sb4']['RxStreamSummaryResults']['DroppedFrameRate']} 
	...    -- Frame Count: ${res_set['p2->p1_sb4']['RxStreamSummaryResults']['FrameCount']} 
	...    -- Octet Count: ${res_set['p2->p1_sb4']['RxStreamSummaryResults']['OctetCount']} 
	...    -- Min Latency: ${res_set['p2->p1_sb4']['RxStreamSummaryResults']['MinLatency']} 
	...    -- Max Latency: ${res_set['p2->p1_sb4']['RxStreamSummaryResults']['MaxLatency']}${\n}
    
    Log to console    ${msg}
	
Display NSG Realtime Traffic Results 5 uni streamblocks (no vlan)
    ${res_set} =    Get Stream Summary Results
	
	Log to console    ${res_set}