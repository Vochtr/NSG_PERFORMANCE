*** Variables ***

@{base_routes}      1.1.1.6/32  

*** Settings ***

Force Tags		  	preparation
Documentation		Test case to check VSC5 configuration
Test Timeout		1 minute

Resource          	../_VARS/vars.robot
Resource          	cats_lib/resources/cats_common.robot
Resource          	cats_lib/resources/sros.robot

*** Test Cases ***

Logging in to SROS (VSC5)
    SROS.Login
    ...            sros_address=${cats_mgnt_VSC5_ip}
    ...            username=${cats_vsc_username}
    ...            password=${cats_vsc_password} 
    ...            timeout=15s

Checking VSD's availability (VSC5)
    VSD is available
    ...    host=${cats_mgmt_xmpp_fqdn}

Checking XMPP (VSC5)
    XMPP is functional

Get BOF info (VSC5)
    @{dns} =       Get BOF Dns servers
    ${domain} =    Get BOF Dns domain
    @{routes} =    Get BOF Static routes

Get System Info (VSC5)
    ${version} =    Get System Version
    ...            verbose=True
    Log    ${version}

    ${type} =    Get System Type
    Log    ${type}

    ${name} =    Get System Name
    Log    ${name}

    &{resources} =    Get System Resources
    Log    ${resources}

Checking NTP Configuration (VSC5)
	NTP server is configured
	...			   ntp_server=${cats_ntp_server}
	...			   verbose=True
	
Get Router Info (VSC5)
    @{routes} =    Get ROUTER routes
	Log    ${routes}
	
    @{intfs} =    Get INTERFACES
	Log    ${intfs}

Get BGP Summaries (VSC5)
    @{bgp} =    Get BGP Peers Summary
	Log    ${bgp}

Checking BGP (VSC5)
    Bgp is enabled

Checking PORTS (VSC5)
    @{ports} =    Get PORTS
	Log    ${ports}