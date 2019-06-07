*** Settings ***

Force Tags		  matrix
Documentation	  Test case for Matrix bridges cleanup 
Test Timeout	  1 minute

Resource          ../_VARS/vars.robot
Resource          cats_lib/resources/cats_common.robot

*** Test Cases ***

Login to Hypervisor
    Linux.Connect to Server
    ...    server_address=${cats_METRO_host}
    ...    server_login=${cats_METRO_host_login}
    ...    server_password=${cats_METRO_host_passwd}
	
Cleanup all Matrix bridges on Hypervisor
	Delete Bridges on Hypervisor
	Create Bridges on Hypervisor
	
*** Keywords ***

Login to METRO host
    SSHLibrary.Open Connection    	${cats_METRO_host}
    SSHLibrary.Login    			${cats_METRO_host_login}
    ...    							${cats_METRO_host_passwd}
	
Delete Bridges on Hypervisor
    ${stdout}    ${rc} =    SSHLibrary.Execute command
    ...    cd /root/MATRIX && ./delete_bridges.sh
    ...    return_rc=True
    Log    ${stdout}
#   Should Be Equal    ${rc}    ${0}	check script execution
	
Create Bridges on Hypervisor
    ${stdout}    ${rc} =    SSHLibrary.Execute command
    ...    cd /root/MATRIX && ./create_bridges.sh
    ...    return_rc=True
    Log    ${stdout}
#   Should Be Equal    ${rc}    ${0}	check script execution