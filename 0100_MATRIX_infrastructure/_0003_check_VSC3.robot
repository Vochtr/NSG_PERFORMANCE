*** Variables ***

@{base_routes}      1.1.1.4/32  

*** Settings ***

Force Tags		  	preparation
Documentation		Test case to check VSC3 configuration
Test Timeout		1 minute

Resource          	../_VARS/vars.robot
Resource          	cats_lib/resources/cats_common.robot
Resource          	cats_lib/resources/sros.robot

*** Test Cases ***

Logging in to SROS (VSC3)
    SROS.Login
    ...            sros_address=${cats_mgnt_VSC3_ip}
    ...            username=${cats_vsc_username}
    ...            password=${cats_vsc_password} 
    ...            timeout=15s

Checking VSD's availability (VSC3)
    VSD is available
    ...    host=${cats_mgmt_xmpp_fqdn}
	
Checking XMPP (VSC3)
    XMPP is functional

Get BOF info (VSC3)
    @{dns} =       Get BOF Dns servers
    ${domain} =    Get BOF Dns domain
    @{routes} =    Get BOF Static routes

Get System Info (VSC3)
    ${version} =    Get System Version
    ...            verbose=True
    Log    ${version}

    ${type} =    Get System Type
    Log    ${type}

    ${name} =    Get System Name
    Log    ${name}

    &{resources} =    Get System Resources
    Log    ${resources}

Checking NTP Configuration (VSC3)
	NTP server is configured
	...			   ntp_server=${cats_ntp_server}
	...			   verbose=True
	
Get Router Info (VSC3)
    @{routes} =    Get ROUTER routes
	Log    ${routes}
	
    @{intfs} =    Get INTERFACES
	Log    ${intfs}

Get BGP Summaries (VSC3)
    @{bgp} =    Get BGP Peers Summary
	Log    ${bgp}

Checking BGP (VSC3)
    Bgp is enabled

Checking PORTS (VSC3)
    @{ports} =    Get PORTS
	Log    ${ports}