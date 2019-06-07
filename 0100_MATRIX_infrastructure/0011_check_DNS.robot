*** Settings ***

Force Tags		  	preparation
Documentation		Test case to check DNS configuration
Test Timeout		2 minutes

Resource          	../_VARS/vars.robot
Resource          	cats_lib/resources/cats_common.robot

*** Test Cases ***

Login to DNS server
    Linux.Connect to Server
    ...    server_address=${cats_dns_server}
    ...    server_login=${cats_dns_username}
    ...    server_password=${cats_dns_password}

Flushing DNS iptables
	flush iptables

Checking DNS iptables
	check iptables

Checking DNS named
	check named

Checking DNS routes
    check routes
	
*** Keywords ***

Login to DNS server
    SSHLibrary.Open Connection    	${cats_dns_server}
    SSHLibrary.Login    			${cats_dns_username}
    ...    							${cats_dns_password}

flush iptables
    ${stdout}    ${rc} =    SSHLibrary.Execute command
    ...    iptables -F
    ...    return_rc=True
    Log    ${stdout}
    Should Be Equal    ${rc}    ${0}
	
check iptables
    ${stdout}    ${rc} =    SSHLibrary.Execute command
    ...    iptables -L
    ...    return_rc=True
    Log    ${stdout}
    Should Be Equal    ${rc}    ${0}
	
check named 
    ${stdout}    ${rc} =    SSHLibrary.Execute command
    ...    service named status | grep active | wc -l
    ...    return_rc=True
    Log    ${stdout}
    Should Be Equal    ${stdout}    1

check routes
    ${stdout}    ${rc} =    SSHLibrary.Execute command
    ...    route -n | grep ${DATA_GW} | wc -l
    ...    return_rc=True
    Log    ${stdout}
    Should Be Equal    ${stdout}    10