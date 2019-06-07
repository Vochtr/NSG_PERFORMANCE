*** Settings ***

Force Tags		  matrix
Documentation	  Test case for IPERF VM creation
Test Timeout	  75 minutes

Resource          ../_VARS/vars.robot
Resource          ../_VARS/create.robot
Resource          cats_lib/resources/cats_common.robot
Resource          cats_lib/resources/catsutils.robot

*** Test Cases ***
# -----------------------------------------------------------------------
#                   NSGv Provisioning
# -----------------------------------------------------------------------
Login csproot
    Login csproot user
  
Deploy iperf VMs for virtual NSGs
  Run Keyword If   ${NSGv01} == True    Deploy iperf VM NSGv01
  Run Keyword If   ${NSGv02} == True    Deploy iperf VM NSGv02
  Run Keyword If   ${NSGv03} == True    Deploy iperf VM NSGv03
  Run Keyword If   ${NSGv04} == True    Deploy iperf VM NSGv04
  Run Keyword If   ${NSGv05} == True    Deploy iperf VM NSGv05
  Run Keyword If   ${NSGv06} == True    Deploy iperf VM NSGv06
  Run Keyword If   ${NSGv07} == True    Deploy iperf VM NSGv07
  Run Keyword If   ${NSGv08} == True    Deploy iperf VM NSGv08
  Run Keyword If   ${NSGv09} == True    Deploy iperf VM NSGv09
  Run Keyword If   ${NSGv10} == True    Deploy iperf VM NSGv10
  Run Keyword If   ${NSGv11} == True    Deploy iperf VM NSGv11
  Run Keyword If   ${NSGv12} == True    Deploy iperf VM NSGv12
  Run Keyword If   ${NSGv13} == True    Deploy iperf VM NSGv13
  Run Keyword If   ${NSGv14} == True    Deploy iperf VM NSGv14
  Run Keyword If   ${NSGv15} == True    Deploy iperf VM NSGv15
  Run Keyword If   ${NSGv16} == True    Deploy iperf VM NSGv16
  Run Keyword If   ${NSGv17} == True    Deploy iperf VM NSGv17
  Run Keyword If   ${NSGv18} == True    Deploy iperf VM NSGv18
  Run Keyword If   ${NSGv19} == True    Deploy iperf VM NSGv19
  Run Keyword If   ${NSGv20} == True    Deploy iperf VM NSGv20
  Run Keyword If   ${NSGv21} == True    Deploy iperf VM NSGv21
  Run Keyword If   ${NSGv22} == True    Deploy iperf VM NSGv22
  Run Keyword If   ${NSGv23} == True    Deploy iperf VM NSGv23
  Run Keyword If   ${NSGv24} == True    Deploy iperf VM NSGv24
  Run Keyword If   ${NSGv25} == True    Deploy iperf VM NSGv25
  Run Keyword If   ${NSGv26} == True    Deploy iperf VM NSGv26
  Run Keyword If   ${NSGv27} == True    Deploy iperf VM NSGv27
  Run Keyword If   ${NSGv28} == True    Deploy iperf VM NSGv28
  Run Keyword If   ${NSGv29} == True    Deploy iperf VM NSGv29
  Run Keyword If   ${NSGv30} == True    Deploy iperf VM NSGv30
  Run Keyword If   ${NSGv31} == True    Deploy iperf VM NSGv31
  Run Keyword If   ${NSGv32} == True    Deploy iperf VM NSGv32
  Run Keyword If   ${NSGv33} == True    Deploy iperf VM NSGv33
  Run Keyword If   ${NSGv34} == True    Deploy iperf VM NSGv34
  Run Keyword If   ${NSGv35} == True    Deploy iperf VM NSGv35
  Run Keyword If   ${NSGv36} == True    Deploy iperf VM NSGv36
  Run Keyword If   ${NSGv37} == True    Deploy iperf VM NSGv37
  Run Keyword If   ${NSGv38} == True    Deploy iperf VM NSGv38
  Run Keyword If   ${NSGv39} == True    Deploy iperf VM NSGv39
  Run Keyword If   ${NSGv40} == True    Deploy iperf VM NSGv40
  Run Keyword If   ${NSGv41} == True    Deploy iperf VM NSGv41
  Run Keyword If   ${NSGv42} == True    Deploy iperf VM NSGv42
  Run Keyword If   ${NSGv43} == True    Deploy iperf VM NSGv43
  Run Keyword If   ${NSGv44} == True    Deploy iperf VM NSGv44
  Run Keyword If   ${NSGv45} == True    Deploy iperf VM NSGv45
  Run Keyword If   ${NSGv46} == True    Deploy iperf VM NSGv46
  Run Keyword If   ${NSGv47} == True    Deploy iperf VM NSGv47
  Run Keyword If   ${NSGv48} == True    Deploy iperf VM NSGv48
  Run Keyword If   ${NSGv49} == True    Deploy iperf VM NSGv49
  Run Keyword If   ${NSGv50} == True    Deploy iperf VM NSGv50
  
*** Keywords ***

Deploy iperf VM NSGv01
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv01
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip1}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM01
	...    data_ip=${cats_data_ip1}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw1}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv02
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv02
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip2}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM02
	...    data_ip=${cats_data_ip2}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw2}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv03
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv03
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip3}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM03
	...    data_ip=${cats_data_ip3}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw3}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv04
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv04
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip4}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM04
	...    data_ip=${cats_data_ip4}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw4}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv05
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv05
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip5}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM05
	...    data_ip=${cats_data_ip5}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw5}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv06
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv06
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip6}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM06
	...    data_ip=${cats_data_ip6}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw6}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv07
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv07
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip7}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM07
	...    data_ip=${cats_data_ip7}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw7}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv08
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv08
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip8}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM08
	...    data_ip=${cats_data_ip8}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw8}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv09
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv09
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip9}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM09
	...    data_ip=${cats_data_ip9}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw9}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv10
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv10
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip10}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM10
	...    data_ip=${cats_data_ip10}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw10}
    ...    ram=1 #(Gib)
    ...    vcpu=1

*** Comment *** 
	
Deploy iperf VM NSGv11
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv11
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip11}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM11
	...    data_ip=${cats_data_ip11}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw11}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv12
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv12
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip12}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM12
	...    data_ip=${cats_data_ip12}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw12}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv13
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv13
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip13}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM13
	...    data_ip=${cats_data_ip13}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw13}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv14
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv14
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip14}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM14
	...    data_ip=${cats_data_ip14}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw14}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv15
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv15
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip15}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM15
	...    data_ip=${cats_data_ip15}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw15}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv16
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv16
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip16}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM16
	...    data_ip=${cats_data_ip16}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw16}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv17
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv17
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip17}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM17
	...    data_ip=${cats_data_ip17}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw17}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv18
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv18
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip18}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM18
	...    data_ip=${cats_data_ip18}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw18}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv19
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv19
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip19}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM19
	...    data_ip=${cats_data_ip19}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw19}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv20
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv20
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip20}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM20
	...    data_ip=${cats_data_ip20}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw20}
    ...    ram=1 #(Gib)
    ...    vcpu=1
		
Deploy iperf VM NSGv21
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv21
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip21}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM21
	...    data_ip=${cats_data_ip21}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw21}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv22
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv22
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip22}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM22
	...    data_ip=${cats_data_ip22}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw22}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv23
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv23
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip23}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM23
	...    data_ip=${cats_data_ip23}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw23}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv24
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv24
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip24}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM24
	...    data_ip=${cats_data_ip24}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw24}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv25
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv25
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip25}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM25
	...    data_ip=${cats_data_ip25}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw25}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv26
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv26
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip26}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM26
	...    data_ip=${cats_data_ip26}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw26}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv27
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv27
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip27}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM27
	...    data_ip=${cats_data_ip27}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw27}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv28
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv28
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip28}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM28
	...    data_ip=${cats_data_ip28}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw28}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv29
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv29
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip29}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM29
	...    data_ip=${cats_data_ip29}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw29}
    ...    ram=1 #(Gib)
    ...    vcpu=1

Deploy iperf VM NSGv30
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv30
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip30}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM30
	...    data_ip=${cats_data_ip30}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw30}
    ...    ram=1 #(Gib)
    ...    vcpu=1
		
Deploy iperf VM NSGv31
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv31
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip31}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM1
	...    data_ip=${cats_data_ip31}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw31}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv32
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv32
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip32}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM32
	...    data_ip=${cats_data_ip32}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw32}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv33
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv33
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip33}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM33
	...    data_ip=${cats_data_ip33}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw33}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv34
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv34
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip34}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM34
	...    data_ip=${cats_data_ip34}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw34}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv35
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv35
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip35}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM35
	...    data_ip=${cats_data_ip35}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw35}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv36
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv36
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip36}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM36
	...    data_ip=${cats_data_ip36}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw36}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv37
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv37
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip37}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM37
	...    data_ip=${cats_data_ip37}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw37}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv38
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv38
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip38}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM38
	...    data_ip=${cats_data_ip38}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw38}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv39
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv39
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip39}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM39
	...    data_ip=${cats_data_ip39}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw39}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv40
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv40
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip40}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM40
	...    data_ip=${cats_data_ip40}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw40}
    ...    ram=1 #(Gib)
    ...    vcpu=1
		
Deploy iperf VM NSGv41
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv41
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip41}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM41
	...    data_ip=${cats_data_ip41}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw41}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv42
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv42
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip42}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM42
	...    data_ip=${cats_data_ip42}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw42}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv43
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv43
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip43}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM43
	...    data_ip=${cats_data_ip43}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw43}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv44
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv44
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip44}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM44
	...    data_ip=${cats_data_ip44}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw44}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv45
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv45
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip45}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM45
	...    data_ip=${cats_data_ip45}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw45}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv46
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv46
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip46}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM46
	...    data_ip=${cats_data_ip46}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw46}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv47
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv47
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip47}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM47
	...    data_ip=${cats_data_ip47}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw47}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv48
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv48
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip48}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM48
	...    data_ip=${cats_data_ip48}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw48}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv49
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv49
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip49}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM49
	...    data_ip=${cats_data_ip49}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw49}
    ...    ram=1 #(Gib)
    ...    vcpu=1
	
Deploy iperf VM NSGv50
  Deploy Tenant VM
    ...    target_server=${cats_target_host}
    ...    target_server_username=${cats_target_host_login}
    ...    target_server_password=${cats_target_host_passwd}
    ...    vm_name=vm_MATRIX_NSGv50
    ...    tenant_vm_qcow2_path=/SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2
    ...    management_bridge=br0
    ...    management_ip=${cats_management_ip50}
    ...    management_netmask_prefix=24
    ...    management_gw=${cats_management_gw}
    ...    data_bridge=brM50
	...    data_ip=${cats_data_ip50}
    ...    data_netmask_prefix=24
    ...    data_gw=${cats_data_gw50}
    ...    ram=1 #(Gib)
    ...    vcpu=1