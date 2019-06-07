*** Settings ***

Resource                ../_VARS/vars.robot
Resource                test-020.robot
Library                 cats_lib/trafgen/TrafficGenerator.py
Resource                cats_lib/resources/cats_common.robot

Force Tags              matrix
Documentation           Test STCv OVERLAY traffic between 2 (or more) NSG's
Test Timeout            500 minutes

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

Show Available Traffic Generators
    ${list} =                       Get Available Traffic Generators
    Log To Console                  \n${list}

Select Traffic Generator
    Use Traffic Generator           STCv.REST
    ${genname} =                    Get Current Traffic Generator
    Log To Console                  \nUsing Traffic Generator: ${genname}

#Open Session To Generator
#    ${sesname}=                     Open Traffic Generator Session  138.203.26.70   80   60.0    True
#    ${sesname}=                     Open Traffic Generator Session  10.0.2.4    8888    60.0    False
#    Log To Console                  \nI Got Session Id: ${sesname}

Use Existing Session On Generator
#    Connect To Existing Traffic Generator Session     138.203.26.70    80   60.0    catssession - catsuser    True
#    Connect To Existing Traffic Generator Session     138.203.26.70    80   60.0    Performance lab - vochtr    True
    Connect To Existing Traffic Generator Session     138.203.26.70    80   60.0    apitest - tgoncuoglu    True
#    Connect To Existing Traffic Generator Session     138.203.26.70    80   60.0    Session3 - ankolpak    True

Apply Config
    Apply Configuration From File    ${xml_file}

# Clear Traffic Before Starting
#    Clear Traffic Results

Start Traffic
    Start Traffic Generation

Wait For Some Data To Populate
    Sleep                           ${duration}

Stop Traffic
    Stop Traffic Generation

Get And Show Results
    ${results} =                    Get Traffic Results
	Set Suite Variable				${results}
    Log                             ${results}
	
Ensure Traffic is Send and Received
    Tx Frame Count Should Be Greater Than 0 (NSG_1to2)
    Rx Frame Count Should Be Greater Than 0 (NSG_1to2)
	
Ensure no Frame Drops Occurred (threshold <= 0.5%)
	Dropped Frame Percent Should Be Less Than 10 (NSG_1to2)
    Dropped Frame Percent Should Be Less Than 1 (NSG_1to2)
    Dropped Frame Percent Should Be Less Or Equal Than 0.5 (NSG_1to2)
	
Close Session
    Close Traffic Generator Session


*** Keywords ***

Tx Frame Count Should Be Greater Than 0 (NSG_1to2)
	${TxFrameCount}					${results}['NSG_1to2']['TXResult']['FrameCount']
	Should Be Greater Than 			${TxFrameCount}    0
	
Rx Frame Count Should Be Greater Than 0 (NSG_1to2)
	${RxFrameCount}					${results}['NSG_1to2']['RXResult']['FrameCount']
	Should Be Greater Than 			${RxFrameCount}    0

Dropped Frame Percent Should Be Less Than 10 (NSG_1to2)
	${DroppedFramePercent}			${results}['NSG_1to2']['RXResult']['DroppedFramePercent']
	Should Be Less Than				${DroppedFramePercent}    10

Dropped Frame Percent Should Be Less Than 1 (NSG_1to2)
	${DroppedFramePercent}			${results}['NSG_1to2']['RXResult']['DroppedFramePercent']
	Should Be Less Than				${DroppedFramePercent}    1

Dropped Frame Percent Should Be Less Or Equal Than 0.5 (NSG_1to2)
	${DroppedFramePercent}			${results}['NSG_1to2']['RXResult']['DroppedFramePercent']
	Should Be Less Or Equal			${DroppedFramePercent}    0.5