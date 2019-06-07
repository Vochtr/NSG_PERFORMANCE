*** Settings ***

Force Tags		  matrix
Documentation	  Test case for Matrix NSGv's cleanup 
Test Timeout	  2 minutes

Resource          ../_VARS/vars.robot
Resource          ../_VARS/create.robot
Resource          cats_lib/resources/cats_common.robot

*** Test Cases ***

Login to Hypervisor
    Linux.Connect to Server
    ...    server_address=${cats_METRO_host}
    ...    server_login=${cats_METRO_host_login}
    ...    server_password=${cats_METRO_host_passwd}

Delete all Matrix NSGv's on Hypervisor
	Run Keyword If   "${nbr_NSGv}" == "01_05"    Delete NSGv QCOWs on Hypervisor for NSG 01_05
    Run Keyword If   "${nbr_NSGv}" == "06_10"    Delete NSGv QCOWs on Hypervisor for NSG 06_10
    Run Keyword If   "${nbr_NSGv}" == "11_15"    Delete NSGv QCOWs on Hypervisor for NSG 11_15
    Run Keyword If   "${nbr_NSGv}" == "16_20"    Delete NSGv QCOWs on Hypervisor for NSG 16_20
    Run Keyword If   "${nbr_NSGv}" == "21_25"    Delete NSGv QCOWs on Hypervisor for NSG 21_25
    Run Keyword If   "${nbr_NSGv}" == "26_30"    Delete NSGv QCOWs on Hypervisor for NSG 26_30
    Run Keyword If   "${nbr_NSGv}" == "31_35"    Delete NSGv QCOWs on Hypervisor for NSG 31_35
    Run Keyword If   "${nbr_NSGv}" == "36_40"    Delete NSGv QCOWs on Hypervisor for NSG 36_40
    Run Keyword If   "${nbr_NSGv}" == "41_45"    Delete NSGv QCOWs on Hypervisor for NSG 41_45
    Run Keyword If   "${nbr_NSGv}" == "46_50"    Delete NSGv QCOWs on Hypervisor for NSG 46_50

Check installed VM's on Hypervisor
    List VMs on Hypervisor

*** Keywords ***

Login to METRO host
    SSHLibrary.Open Connection    	${cats_METRO_host}
    SSHLibrary.Login    			${cats_METRO_host_login}
    ...    							${cats_METRO_host_passwd}

Delete NSGv QCOWs on Hypervisor for NSG 01_05
    ${stdout}    ${rc} =    SSHLibrary.Execute command
    ...    cd /root/MATRIX && ./cleanup_NSGvs_01_05.sh
    ...    return_rc=True
    Log    ${stdout}
#   Should Be Equal    ${rc}    ${0}	check script execution
	
Delete NSGv QCOWs on Hypervisor for NSG 06_10
    ${stdout}    ${rc} =    SSHLibrary.Execute command
    ...    cd /root/MATRIX && ./cleanup_NSGvs_06_10.sh
    ...    return_rc=True
    Log    ${stdout}
#   Should Be Equal    ${rc}    ${0}	check script execution

Delete NSGv QCOWs on Hypervisor for NSG 11_15
    ${stdout}    ${rc} =    SSHLibrary.Execute command
    ...    cd /root/MATRIX && ./cleanup_NSGvs_11_15.sh
    ...    return_rc=True
    Log    ${stdout}
#   Should Be Equal    ${rc}    ${0}	check script execution
	
Delete NSGv QCOWs on Hypervisor for NSG 16_20
    ${stdout}    ${rc} =    SSHLibrary.Execute command
    ...    cd /root/MATRIX && ./cleanup_NSGvs_16_20.sh
    ...    return_rc=True
    Log    ${stdout}
#   Should Be Equal    ${rc}    ${0}	check script execution

Delete NSGv QCOWs on Hypervisor for NSG 21_25
    ${stdout}    ${rc} =    SSHLibrary.Execute command
    ...    cd /root/MATRIX && ./cleanup_NSGvs_21_25.sh
    ...    return_rc=True
    Log    ${stdout}
#   Should Be Equal    ${rc}    ${0}	check script execution
	
Delete NSGv QCOWs on Hypervisor for NSG 26_30
    ${stdout}    ${rc} =    SSHLibrary.Execute command
    ...    cd /root/MATRIX && ./cleanup_NSGvs_26_30.sh
    ...    return_rc=True
    Log    ${stdout}
#   Should Be Equal    ${rc}    ${0}	check script execution

Delete NSGv QCOWs on Hypervisor for NSG 31_35
    ${stdout}    ${rc} =    SSHLibrary.Execute command
    ...    cd /root/MATRIX && ./cleanup_NSGvs_31_35.sh
    ...    return_rc=True
    Log    ${stdout}
#   Should Be Equal    ${rc}    ${0}	check script execution
	
Delete NSGv QCOWs on Hypervisor for NSG 36_40
    ${stdout}    ${rc} =    SSHLibrary.Execute command
    ...    cd /root/MATRIX && ./cleanup_NSGvs_36_40.sh
    ...    return_rc=True
    Log    ${stdout}
#   Should Be Equal    ${rc}    ${0}	check script execution

Delete NSGv QCOWs on Hypervisor for NSG 41_45
    ${stdout}    ${rc} =    SSHLibrary.Execute command
    ...    cd /root/MATRIX && ./cleanup_NSGvs_41_45.sh
    ...    return_rc=True
    Log    ${stdout}
#   Should Be Equal    ${rc}    ${0}	check script execution
	
Delete NSGv QCOWs on Hypervisor for NSG 46_50
    ${stdout}    ${rc} =    SSHLibrary.Execute command
    ...    cd /root/MATRIX && ./cleanup_NSGvs_46_50.sh
    ...    return_rc=True
    Log    ${stdout}
#   Should Be Equal    ${rc}    ${0}	check script execution

List VMs on Hypervisor
    ${stdout}    ${rc} =    SSHLibrary.Execute command
    ...    virsh list --all
    ...    return_rc=True
    Log    ${stdout}
#   Should Be Equal    ${rc}    ${0}	check remaining QCOW's