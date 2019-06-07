*** Settings ***

Force Tags		  	preparation
Documentation		Test case to check VSD configuration
Test Timeout		2 minutes

Resource          	../_VARS/vars.robot
Resource          	cats_lib/resources/cats_common.robot

*** Test Cases ***

Login to VSD1 server
    Linux.Connect to Server
    ...    server_address=${cats_vsd1_server}
    ...    server_login=${cats_vsd1_username}
    ...    server_password=${cats_vsd1_password}

Checking VSD1 core
	check core
	
Checking VSD1 common
	check common
	
Checking VSD1 stats
	check stats
	
Checking VSD1 ntpstat
	check ntpstat
	
Checking VSD1 enforce
	check enforce
	
Checking VSD1 proxyuser
	check proxyuser
	
*** Keywords ***

Login to VSD server
    SSHLibrary.Open Connection    	${cats_vsd_server}
    SSHLibrary.Login    			${cats_vsd_username}
    ...    							${cats_vsd_password}

check core
    ${stdout}    ${rc} =    SSHLibrary.Execute command
	...    monit -g vsd-core summary | grep failed | wc -l
	...    return_rc=True
    Log    ${stdout}
    Should Be Equal    ${stdout}    0
	
check common
    ${stdout}    ${rc} =    SSHLibrary.Execute command
    ...    monit -g vsd-common summary | grep failed | wc -l
	...    return_rc=True
    Log    ${stdout}
    Should Be Equal    ${stdout}    0
	
check stats
    ${stdout}    ${rc} =    SSHLibrary.Execute command
    ...    monit -g vsd-stats summary | grep failed | wc -l
	...    return_rc=True
    Log    ${stdout}
    Should Be Equal    ${stdout}    0
	
check ntpstat
    ${stdout}    ${rc} =    SSHLibrary.Execute command
    ...    ntpstat | grep synchronised | wc -l
	...    return_rc=True
    Log    ${stdout}
    Should Be Equal    ${stdout}    1
	
check enforce
    ${stdout}    ${rc} =    SSHLibrary.Execute command
    ...    getenforce | grep Permissive | wc -l
	...    return_rc=True
    Log    ${stdout}
    Should Be Equal    ${stdout}    1
	
check proxyuser
    ${stdout}    ${rc} =    SSHLibrary.Execute command
    ...    /opt/ejabberd/bin/ejabberdctl connected_users | grep proxy@ | wc -l
	...    return_rc=True
    Log    ${stdout}
    Should Be Equal    ${stdout}    1