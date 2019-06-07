*** Settings ***

Force Tags		  	preparation
Documentation		Test case to check STCv configuration
Test Timeout		1 minute

Resource          	../_VARS/vars.robot
Resource          	cats_lib/resources/cats_common.robot

*** Test Cases ***

Login to STCv + ntp check
	check ntp
	
*** Keywords ***

check ntp
    SSHLibrary.Open Connection    	${cats_chassis_STCv}
    SSHLibrary.Login    			admin
    ...    							spt_admin
	
    ${stdout}    ${rc} =    SSHLibrary.Execute command
    ...    ntp
    ...    return_rc=True
    Log    ${stdout}