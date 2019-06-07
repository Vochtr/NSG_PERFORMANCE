*** Settings ***

Force Tags		  matrix
Documentation	  Test case for STCv deployment 
Test Timeout	  2 minutes

Resource          ../_VARS/vars.robot
Resource          cats_lib/resources/cats_common.robot

*** Test Cases ***
# -----------------------------------------------------------------------
#                   VSR Provisioning
# -----------------------------------------------------------------------
Connecting to Server
    Connect to Server
    ...    server_address=${cats_METRO_host}
    ...    server_login=root
    ...    server_password=Alcateldc

Copying stcv_build_vars
    SSHLibrary.Put File    ${CURDIR}/_STCV/stcv_build_vars.yml
    ...    ${cats_METRO_path}/playbooks/stcv_build_vars.yml

Running STCV Predeploy
    Run METRO Playbook
    ...    nuage_metro_path=${cats_METRO_path}
    ...    command=./metro-ansible playbooks/stcv_predeploy.yml -e build_vars_file=build_vars_vcs.yml

Waiting 60 secs for STCV to boot up
    Sleep    60

Running STCV Postdeploy
    Run METRO Playbook
    ...    nuage_metro_path=${cats_METRO_path}
    ...    command=./metro-ansible playbooks/stcv_postdeploy.yml -e build_vars_file=build_vars_vcs.yml