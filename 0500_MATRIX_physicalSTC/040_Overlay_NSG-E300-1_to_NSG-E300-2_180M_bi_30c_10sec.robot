*** Settings ***

Resource                ../_VARS/vars.robot
Resource                test-040.robot

Library                 cats_lib/trafgen/TrafficGenerator.py

Force Tags              matrix
Documentation           Test STCv OVERLAY traffic between 2 (or more) NSG's
Test Timeout            60 minutes

*** comment ***

This test case is to test STCv OVERLAY traffic between 2 (physical)(virtual) NSG's

*** Test Cases ***

#Enterprise Login (csproot) + Checking NSG availability
#    [Setup]  Csproot User is logged in VSD   	
#
#    Run Keyword If   ${NSG-C_1} == True       NSG-C_1 is up in Monitoring
#    Run Keyword If   ${NSG-C_2} == True       NSG-C_2 is up in Monitoring
#    Run Keyword If   ${NSG-E_1} == True       NSG-E_1 is up in Monitoring
#    Run Keyword If   ${NSG-E_2} == True       NSG-E_2 is up in Monitoring
#    Run Keyword If   ${NSG-E200_1} == True    NSG-E200_1 is up in Monitoring
#    Run Keyword If   ${NSG-E200_2} == True    NSG-E200_2 is up in Monitoring
#    Run Keyword If   ${NSG-E300_1} == True    NSG-E300_1 is up in Monitoring
#    Run Keyword If   ${NSG-E300_2} == True    NSG-E300_2 is up in Monitoring
#    Run Keyword If   ${NSG-X200_1} == True    NSG-X200_1 is up in Monitoring
#    Run Keyword If   ${NSG-X200_2} == True    NSG-X200_2 is up in Monitoring
#    Run Keyword If   ${NSG-X_1} == True       NSG-X_1 is up in Monitoring
#    Run Keyword If   ${NSG-X_2} == True       NSG-X_2 is up in Monitoring
#	
#    Run Keyword If   ${NSGv01} == True   	  NSGv01 is up in Monitoring
#    Run Keyword If   ${NSGv02} == True   	  NSGv02 is up in Monitoring
#    Run Keyword If   ${NSGv03} == True   	  NSGv03 is up in Monitoring
#    Run Keyword If   ${NSGv04} == True   	  NSGv04 is up in Monitoring
#    Run Keyword If   ${NSGv05} == True   	  NSGv05 is up in Monitoring

#Show Available Traffic Generators
#    ${list}=                        Get Available Traffic Generators
#    Log To Console                  \n${list}

Select Traffic Generator
    Use Traffic Generator           generator=STC.REST
    ${genname}=                     Get Current Traffic Generator
#    Log To Console                  \nUsing Traffic Generator: ${genname}

Open Session To Generator
    ${sesname}=                     Open Traffic Generator Session
                                    ...  hostname=138.203.26.170
                                    ...  port=80
                                    ...  timeout=60.0
#    Log To Console                  \nI Got Session Id: ${sesname}

#Join Session
#    Connect To Existing Traffic Generator Session
#    ...  hostname=138.203.26.170
#    ...  port=80
#    ...  timeout=60.0
#    ...  sessionid=cats-vm - cats

Apply Config
    Apply Configuration From File
     ...    filename=${CURDIR}/XML/${config_file}
	
Wait For Interleave startup
    Sleep                           3
	
Clear Traffic Before Starting
    Clear Traffic Results

Start Traffic
    Start Traffic Generation

Wait For Some Data To Populate
    Sleep                           ${duration}

Stop Traffic
    Stop Traffic Generation

Get And Show Results From Dictionary
	Run Keyword If   "${streamblocks}" == "2"    Get And Show Results From Dictionary (2 STB)
	Run Keyword If   "${streamblocks}" == "3"    Get And Show Results From Dictionary (3 STB)
	Run Keyword If   "${streamblocks}" == "5"    Get And Show Results From Dictionary (5 STB)
	
Get Values From Keywords
    ${txframes}=                    Get Transmitted Frame Count
    Log To Console                  \nTransmitted Frame Count: ${txframes} frames
    ${rxframes}=                    Get Received Frame Count
    Log To Console                  \nReceived Frame Count: ${rxframes} frames
    ${dropcount}=                   Get Dropped Frame Count
    Log To Console                  \nDropped Frame Count: ${dropcount} frames
    ${dropratio}=                   Get Dropped Frame Percentage
    Log To Console                  \nDropped Frame Percentage: ${dropratio} percent
	
	${Drop}=                Convert To Number    ${dropratio}
#	Log to console          ${Drop}
	Should Be True          ${Drop} < 0.1

Ensure Traffic is Send 
    Tx Frame Count Should Be Greater Than 0 (NSG_2to1)
    Tx Frame Count Should Be Greater Than 0 (NSG_1to2)

Ensure no Frame Drops Occurred (threshold < 0.1%)
	Dropped Frame Percent Should Be Less Than 0.1 (NSG_2to1)
	Dropped Frame Percent Should Be Less Than 0.1 (NSG_1to2)
	
Close Session
    Close Traffic Generator Session

*** Keywords ***

Get And Show Results From Dictionary (2 STB)
	${results}=                     Get Traffic Results
#	Set Suite Variable				${results}
    Log                             ${results}
	
	${msg} =    Catenate    SEPARATOR=${\n}
	...    ${\n}${\n}Test Case: ${TestCaseName}   
	...    ${\n}Port 1 Config:
	...    -- Tx Generate Total Frame Count: ${results['port1']['generatorportresults1']['TotalFrameCount']} frames
    ...    -- Rx Analyzer Total Frame Count: ${results['port1']['analyzerportresults1']['TotalFrameCount']} frames
    ...    -- Rx Analyzer Dropped Frame Count: ${results['port1']['analyzerportresults1']['DroppedFrameCount']} frames
	...    ${\n}Port 2 Config:	
	...    -- Tx Generate Total Frame Count: ${results['port2']['generatorportresults2']['TotalFrameCount']} frames
    ...    -- Rx Analyzer Total Frame Count: ${results['port2']['analyzerportresults2']['TotalFrameCount']} frames
    ...    -- Rx Analyzer Dropped Frame Count: ${results['port2']['analyzerportresults2']['DroppedFrameCount']} frames
    ...    ${\n}Streamblock 1: NSG 2->1
	...    -- Streamblock Load Unit: ${results['port1']['streamblock1']['BpsLoad']} bit/s
	...    -- Streamblock Frame Length: ${results['port1']['streamblock1']['FixedFrameLength']} bytes
    ...    -- Streamblock Frame Length Mode: ${results['port1']['streamblock1']['FrameLengthMode']}
#	...    -- Streamblock Frame Config: ${results['port1']['streamblock1']['FrameConfig']}
	...    ${\n}Streamblock 2: NSG 1->2
	...    -- Streamblock Load Unit: ${results['port2']['streamblock2']['BpsLoad']} bit/s
	...    -- Streamblock Frame Length: ${results['port2']['streamblock2']['FixedFrameLength']} bytes
	...    -- Streamblock Frame Length Mode: ${results['port2']['streamblock2']['FrameLengthMode']}
#	...    -- Streamblock Frame Config: ${results['port2']['streamblock2']['FrameConfig']}
    
    Log to console    ${msg}
	
Get And Show Results From Dictionary (3 STB)
	${results}=                     Get Traffic Results
#	Set Suite Variable				${results}
    Log                             ${results}
	
	${msg} =    Catenate    SEPARATOR=${\n}
	...    ${\n}${\n}Test Case: ${TestCaseName}
    ...    ${\n}Port 1 Config:
	...    -- Tx Generate Total Frame Count: ${results['port1']['generatorportresults1']['TotalFrameCount']} frames
    ...    -- Rx Analyzer Total Frame Count: ${results['port1']['analyzerportresults1']['TotalFrameCount']} frames
    ...    -- Rx Analyzer Dropped Frame Count: ${results['port1']['analyzerportresults1']['DroppedFrameCount']} frames
	...    ${\n}Port 2 Config:	
	...    -- Tx Generate Total Frame Count: ${results['port2']['generatorportresults2']['TotalFrameCount']} frames
    ...    -- Rx Analyzer Total Frame Count: ${results['port2']['analyzerportresults2']['TotalFrameCount']} frames
    ...    -- Rx Analyzer Dropped Frame Count: ${results['port2']['analyzerportresults2']['DroppedFrameCount']} frames
    ...    ${\n}Streamblock 1: NSG 2->1
    ...    -- Streamblock Load Unit: ${results['port1']['streamblock1']['BpsLoad']} bit/s
	...    -- Streamblock Frame Length: ${results['port1']['streamblock1']['FixedFrameLength']} bytes
    ...    -- Streamblock Frame Length Mode: ${results['port1']['streamblock1']['FrameLengthMode']}
	...    -- Streamblock Frame Config: ${results['port1']['streamblock1']['FrameConfig']}
	...    ${\n}Streamblock 2: NSG 2->1
	...    -- Streamblock Load Unit: ${results['port2']['streamblock2']['BpsLoad']} bit/s
	...    -- Streamblock Frame Length: ${results['port2']['streamblock2']['FixedFrameLength']} bytes
    ...    -- Streamblock Frame Length Mode: ${results['port2']['streamblock2']['FrameLengthMode']}
	...    -- Streamblock Frame Config: ${results['port2']['streamblock2']['FrameConfig']}
	...    ${\n}Streamblock 3: NSG 2->1
	...    -- Streamblock Load Unit: ${results['port2']['streamblock3']['BpsLoad']} bit/s
	...    -- Streamblock Frame Length: ${results['port2']['streamblock3']['FixedFrameLength']} bytes
    ...    -- Streamblock Frame Length Mode: ${results['port2']['streamblock3']['FrameLengthMode']}
	...    -- Streamblock Frame Config: ${results['port2']['streamblock3']['FrameConfig']}

    Log to console    ${msg}

Get And Show Results From Dictionary (5 STB)
	${results}=                     Get Traffic Results
#	Set Suite Variable				${results}
    Log                             ${results}
	
	${msg} =    Catenate    SEPARATOR=${\n}
	...    ${\n}${\n}Test Case: ${TestCaseName}
    ...    ${\n}Port 1 Config:
	...    -- Tx Generate Total Frame Count: ${results['port1']['generatorportresults1']['TotalFrameCount']} frames
    ...    -- Rx Analyzer Total Frame Count: ${results['port1']['analyzerportresults1']['TotalFrameCount']} frames
    ...    -- Rx Analyzer Dropped Frame Count: ${results['port1']['analyzerportresults1']['DroppedFrameCount']} frames
	...    ${\n}Port 2 Config:	
	...    -- Tx Generate Total Frame Count: ${results['port2']['generatorportresults2']['TotalFrameCount']} frames
    ...    -- Rx Analyzer Total Frame Count: ${results['port2']['analyzerportresults2']['TotalFrameCount']} frames
    ...    -- Rx Analyzer Dropped Frame Count: ${results['port2']['analyzerportresults2']['DroppedFrameCount']} frames
    ...    ${\n}Streamblock 1: NSG 2->1
    ...    -- Streamblock Load Unit: ${results['port1']['streamblock1']['BpsLoad']} bit/s
	...    -- Streamblock Frame Length: ${results['port1']['streamblock1']['FixedFrameLength']} bytes
    ...    -- Streamblock Frame Length Mode: ${results['port1']['streamblock1']['FrameLengthMode']}
	...    -- Streamblock Frame Config: ${results['port1']['streamblock1']['FrameConfig']}
	...    ${\n}Streamblock 2: NSG 2->1
	...    -- Streamblock Load Unit: ${results['port1']['streamblock2']['BpsLoad']} bit/s
	...    -- Streamblock Frame Length: ${results['port1']['streamblock2']['FixedFrameLength']} bytes
    ...    -- Streamblock Frame Length Mode: ${results['port1']['streamblock2']['FrameLengthMode']}
	...    -- Streamblock Frame Config: ${results['port1']['streamblock2']['FrameConfig']}
	...    ${\n}Streamblock 3: NSG 2->1
	...    -- Streamblock Load Unit: ${results['port1']['streamblock3']['BpsLoad']} bit/s
	...    -- Streamblock Frame Length: ${results['port1']['streamblock3']['FixedFrameLength']} bytes
    ...    -- Streamblock Frame Length Mode: ${results['port1']['streamblock3']['FrameLengthMode']}
	...    -- Streamblock Frame Config: ${results['port1']['streamblock3']['FrameConfig']}
	...    ${\n}Streamblock 4: NSG 2->1
	...    -- Streamblock Load Unit: ${results['port1']['streamblock4']['BpsLoad']} bit/s
	...    -- Streamblock Frame Length: ${results['port1']['streamblock4']['FixedFrameLength']} bytes
    ...    -- Streamblock Frame Length Mode: ${results['port1']['streamblock4']['FrameLengthMode']}
	...    -- Streamblock Frame Config: ${results['port1']['streamblock4']['FrameConfig']}
	...    ${\n}Streamblock 5: NSG 2->1
	...    -- Streamblock Load Unit: ${results['port1']['streamblock5']['BpsLoad']} bit/s
	...    -- Streamblock Frame Length: ${results['port1']['streamblock5']['FixedFrameLength']} bytes
    ...    -- Streamblock Frame Length Mode: ${results['port1']['streamblock5']['FrameLengthMode']}
	...    -- Streamblock Frame Config: ${results['port1']['streamblock5']['FrameConfig']}

    Log to console    ${msg}
	
Tx Frame Count Should Be Greater Than 0 (NSG_2to1)
	${results}=             Get Traffic Results
 	Should Be True 			${results['port1']['generatorportresults1']['TotalFrameCount']} > 0
	
Tx Frame Count Should Be Greater Than 0 (NSG_1to2)
    ${results}=             Get Traffic Results
 	Should Be True 			${results['port2']['generatorportresults2']['TotalFrameCount']} > 0

Dropped Frame Percent Should Be Less Than 0.1 (NSG_2to1)
    ${results}=             Get Traffic Results
	${Drop1}=               Convert To Number    ${results['port1']['analyzerportresults1']['DroppedFrameCount']}
#	Log to console          ${Drop1}
#	Should Be True          ${results['port1']['analyzerportresults1']['DroppedFrameCount']} < 0.1
	Should Be True          ${Drop1} < 0.1
	
Dropped Frame Percent Should Be Less Than 0.1 (NSG_1to2)
    ${results}=             Get Traffic Results
    ${Drop2}=               Convert To Number    ${results['port2']['analyzerportresults2']['DroppedFrameCount']} 
#	Log to console          ${Drop2}$	
#	Should Be True          ${results['port2']['analyzerportresults2']['DroppedFrameCount']} < 0.1
	Should Be True          ${Drop2} < 0.1