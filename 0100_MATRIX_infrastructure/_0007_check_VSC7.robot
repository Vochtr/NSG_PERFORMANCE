*** Variables ***

@{base_routes}      1.1.1.8/32 

*** Settings ***
Force Tags		  	preparation
Documentation		Test case to check VSC7 configuration
Test Timeout		1 minute

Resource          	../_VARS/vars.robot
Resource          	cats_lib/resources/cats_common.robot
Resource          	cats_lib/resources/sros.robot

*** Test Cases ***

Logging in to SROS (VSC7)
    SROS.Login
    ...            sros_address=${cats_mgnt_VSC7_ip}
    ...            username=${cats_vsc_username}
    ...            password=${cats_vsc_password} 
    ...            timeout=15s

Checking VSD's availability (VSC7)
    VSD is available
    ...    host=${cats_mgmt_xmpp_fqdn}

Checking XMPP (VSC7)
    XMPP is functional

Get BOF info (VSC7)
    @{dns} =       Get BOF Dns servers
    ${domain} =    Get BOF Dns domain
    @{routes} =    Get BOF Static routes

Get System Info (VSC7)
    ${version} =    Get System Version
    ...            verbose=True
    Log    ${version}

    ${type} =    Get System Type
    Log    ${type}

    ${name} =    Get System Name
    Log    ${name}

    &{resources} =    Get System Resources
    Log    ${resources}

Checking NTP Configuration (VSC7)
	NTP server is configured
	...			   ntp_server=${cats_ntp_server}
	...			   verbose=True
	
Get Router Info (VSC7)
    @{routes} =    Get ROUTER routes
	Log    ${routes}
	
    @{intfs} =    Get INTERFACES
	Log    ${intfs}

Get BGP Summaries (VSC7)
    @{bgp} =    Get BGP Peers Summary
	Log    ${bgp}

Checking BGP (VSC7)
    Bgp is enabled

Checking PORTS (VSC7)
    @{ports} =    Get PORTS
	Log    ${ports}