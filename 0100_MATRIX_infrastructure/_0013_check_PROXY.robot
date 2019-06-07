*** Settings ***

Force Tags		  	preparation
Documentation		Test case to check PROXY configuration
Test Timeout		1 minute

Resource          	../_VARS/vars.robot
Resource          	cats_lib/resources/cats_common.robot

*** Test Cases ***

Login to PROXY server
    Linux.Connect to Server
    ...    server_address=${cats_proxy_server}
    ...    server_login=${cats_proxy_username}
    ...    server_password=${cats_proxy_password}

Checking PROXY status
	proxy status check
	
Checking PROXY syslog
	proxy syslog check
	
*** Keywords ***

Login to PROXY server
    SSHLibrary.Open Connection    	${cats_mgnt_proxy_ip}
    SSHLibrary.Login    			${cats_proxy_username}
    ...    							${cats_proxy_password}

proxy status check
    ${stdout}    ${rc} =    SSHLibrary.Execute command
    ...    systemctl status haproxy | grep active | wc -l
    ...    return_rc=True
    Log    ${stdout}
    Should Be Equal    ${stdout}    1
	
proxy syslog check
    ${stdout}    ${rc} =    SSHLibrary.Execute command
    ...    systemctl status rsyslog | grep active | wc -l
    ...    return_rc=True
    Log    ${stdout}
    Should Be Equal    ${stdout}    1