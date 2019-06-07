*** Settings ***

Force Tags		  	preparation
Documentation		Test case to check UTIL configuration
Test Timeout		1 minute

Resource          	../_VARS/vars.robot
Resource          	cats_lib/resources/cats_common.robot

*** Test Cases ***

Login to UTIL server
    Linux.Connect to Server
    ...    server_address=${cats_util_server}
    ...    server_login=${cats_util_username}
    ...    server_password=${cats_util_password}

Flushing UTIL iptables
	flush iptables

Checking UTIL haproxy process
	check haproxy

Checking UTIL supervisord process
	check supervisord

Checking UTIL routes
    check routes
	
*** Keywords ***

Login to UTIL server
    SSHLibrary.Open Connection    	${cats_mgnt_util_ip}
    SSHLibrary.Login    			${cats_util_username}
    ...    							${cats_util_password}

flush iptables
    ${stdout}    ${rc} =    SSHLibrary.Execute command
    ...    iptables -F
    ...    return_rc=True
    Log    ${stdout}
    Should Be Equal    ${rc}    ${0}
	
check haproxy
    ${stdout}    ${rc} =    SSHLibrary.Execute command
    ...    service haproxy status | grep 'active' | wc -l
    ...    return_rc=True
    Log    ${stdout}
    Should Be Equal    ${stdout}    1

check supervisord
    ${stdout}    ${rc} =    SSHLibrary.Execute command
    ...    service supervisord status | grep 'active' | wc -l
    ...    return_rc=True
    Log    ${stdout}
    Should Be Equal    ${stdout}    1

check routes
    ${stdout}    ${rc} =    SSHLibrary.Execute command
    ...    route -n | grep ${DATA_GW} | wc -l
    ...    return_rc=True
    Log    ${stdout}
    Should Be Equal    ${stdout}    10