*** Settings ***

Force Tags		  	preparation
Documentation		Test case to check STATS configuration
Test Timeout		1 minute

Resource          	../_VARS/vars.robot
Resource          	cats_lib/resources/cats_common.robot

*** Test Cases ***

Login to STATS server
    Linux.Connect to Server
    ...    server_address=${cats_stats_server}
    ...    server_login=${cats_stats_username}
    ...    server_password=${cats_stats_password}

Flushing STATS iptables
	flush iptables

Checking STATS elasticsearch
	check elasticsearch
	
Checking STATS ntpstat
	check ntpstat

Checking STATS enforce
	check enforce
	
Checking STATS nginx
	check nginx

*** Keywords ***

Login to STATS server
    SSHLibrary.Open Connection    	${cats_mgnt_stats_ip}
    SSHLibrary.Login    			${cats_stats_username}
    ...    							${cats_stats_password}

flush iptables
    ${stdout}    ${rc} =    SSHLibrary.Execute command
    ...    iptables -F
    ...    return_rc=True
    Log    ${stdout}
    Should Be Equal    ${rc}    ${0}
	
check elasticsearch
    ${stdout}    ${rc} =    SSHLibrary.Execute command
    ...    systemctl status elasticsearch | grep active | wc -l
    ...    return_rc=True
    Log    ${stdout}
    Should Be Equal    ${stdout}    1

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
	
check nginx
    ${stdout}    ${rc} =    SSHLibrary.Execute command
    ...    service nginx status | grep active | wc -l
    ...    return_rc=True
    Log    ${stdout}
    Should Be Equal    ${stdout}    1