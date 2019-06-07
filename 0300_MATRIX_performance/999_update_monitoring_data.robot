*** Settings ***

Resource                ../_VARS/vars.robot
Resource                cats_lib/resources/cats_common.robot
Resource                cats_lib/resources/stcv.robot

Force Tags              matrix
Documentation           Update monitoring data
Test Timeout            11 minutes
Suite Teardown          STCV.Disconnect Chassis     

*** Test Cases ***

Ensure STCv has correct interfaces

    ####Connect STC ports to NSGs
    SSHLibrary.Open Connection    ${default_target_server}
    SSHLibrary.Login    ${cats_target_host_login}
    ...                 ${cats_target_host_passwd}

    SSHLibrary.Execute Command     /root/vifmove.sh ${STCv_VM_name} ${STCv_port1} br7
    SSHLibrary.Execute Command     /root/vifmove.sh ${STCv_VM_name} ${STCv_port2} br7
    SSHLibrary.Close Connection

	
Enterprise Login (csproot) + Update Monitoring Data
    [Setup]  Csproot User is logged in VSD   	
	
	Update VSC Monitoring Data
    ...    cats_vsc_name=vsc1.mgmt.vnspoc.541.net

    Sleep    10 minutes