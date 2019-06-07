*** Settings ***

Library                             cats_lib/trafgen/TrafficGenerator.py

*** Test Cases ***

#Show Available Traffic Generators
#    ${list}=                        Get Available Traffic Generators
#    Log To Console                  \n${list}

Select Traffic Generator
    Use Traffic Generator           STCv.REST
    ${genname}=                     Get Current Traffic Generator
    Log To Console                  \nUsing Traffic Generator: ${genname}

Open Session To Generator
    ${sesname}=                     Open Traffic Generator Session  138.203.26.70   80   60.0
#    ${sesname}=                     Open Traffic Generator Session  10.0.2.4    8888    60.0    False
#    Log To Console                  \nI Got Session Id: ${sesname}

#Use Existing Session On Generator
#    Connect To Existing Traffic Generator Session     138.203.26.70    80   60.0    catssession - catsuser    True
#    Connect To Existing Traffic Generator Session     138.203.26.70    80   60.0    Performance lab - vochtr    True
#    Connect To Existing Traffic Generator Session     138.203.26.70    80   60.0    apitest - tgoncuoglu    True
#    Connect To Existing Traffic Generator Session     138.203.26.70    80   60.0    Session3 - ankolpak    True


Apply STC XML Config File
    Apply Configuration From File   NSG-E1-E2_bi_1400_45M.xml
#    Apply Configuration From File   NSG-E2001-E2002_bi_1400_135M.xml

# Clear Traffic Before Starting
#    Clear Traffic Results

Start Traffic
    Start Traffic Generation

Wait For Some Data To Populate
    Sleep                           20

Stop Traffic
    Stop Traffic Generation

Get And Show Results
    ${results}=                     Get Traffic Results
    Log                             ${results}

Close Session
    Close Traffic Generator Session


*** Keywords ***
