*** Settings ***

Resource                ../_VARS/vars.robot
Resource                cats_lib/resources/cats_common.robot
Resource                cats_lib/resources/stcv.robot

Force Tags              matrix
Documentation           test RG OVERLAY traffic between 2 (or more) NSG's
Test Timeout            10 minutes
Suite Teardown          STCV.Disconnect Chassis     

*** comment ***

This test case is to check active NSG's in Resilience Groups 


*** Test Cases ***

CSPROOT Logs In 
    Csproot user is logged in VSD

Fix RGX BUG
   Create NSG Redundancy Group
   ...    name=RGX
   ...    cats_org_name=${cats_org_name}
   ...    cats_auth_gw_name=${cats_NSG-X-2_name}
   ...    cats_sec_gw_name=${cats_NSG-X-1_name}
   
Determine the Active NSG in RGX
    VSC.Login
    ...    vsc_address=${cats_mgnt_vsc1_ip}
    ...    username=admin
    ...    password=admin

    ${service_id} =    Get L3 Domain Service Id
                       ...    enterprise=${cats_org_name}
                       ...    domain=${cats_l3_domain1_name} 

    set suite Variable    ${service_id}

    ${routes} =    Get ROUTER routes
                   ...    router_id=${service_id}
                   ...    ip_prefix=${cats_subnetRGX_network}

    set suite variable    ${routes[0]['NextHop']}


    ${vswitches} =      VSC.Execute Command     show vswitch-controller vswitches vs-ip ${routes[0]['NextHop']} detail | match nuage_gateway_id
    set suite variable    ${vswitches}
    SSHLibrary.Close Connection

    ${vswitches} =      Get Regexp Matches    ${vswitches}   \\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}
    set suite variable    ${vswitches}

    Csproot user is logged in VSD
    @{nsg_list} =    Get VRS List
                     ...    cats_vsp_name=VSP
                     ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net

    ${nsg_name} =    Create List

    : FOR    ${nsg}    IN     @{nsg_list}
    \    Run Keyword If   '${vswitches[0]}' in '${nsg.description}'   
    \    ...    Append To List     ${nsg_name}   ${nsg.name}

    Log to console     ${nsg_name[0]}
    set suite variable     ${nsg_name[0]}