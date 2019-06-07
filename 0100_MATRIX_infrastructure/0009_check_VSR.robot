*** Settings ***

Force Tags		  	preparation
Documentation		Test case to check PE1 configuration
Test Timeout		1 minute
Test Setup			VSR version check	

Resource          	../_VARS/vars.robot
Resource          	cats_lib/resources/cats_common.robot
Resource          	cats_lib/resources/sros.robot

*** Test Cases ***

Logging in to SROS (VSR)
    SROS.Login
    ...            sros_address=${cats_mgmt_vsr_ip}
    ...            username=${cats_vsr_username}
    ...            password=${cats_vsr_password} 
    ...            timeout=10s

Get BOF info (VSR)
    @{routes} =    Get BOF Static routes

Get System Info (VSR)
    ${version} =    Get System Version
    ...            verbose=True
    Log    ${version}

    ${type} =    Get System Type
    Log    ${type}

    ${name} =    Get System Name
    Log    ${name}

    &{resources} =    Get System Resources
    Log    ${resources}

#Checking XMPP (VSR)
#    XMPP is functional

#Checking NTP Configuration (VSR)
#	NTP server is configured
#	...			   ntp_server=${cats_ntp_server}
#	...			   verbose=True
	
Get Router Info (VSR)
    @{routes} =    Get ROUTER routes
	Log    ${routes}
	
    @{intfs} =    Get INTERFACES
	Log    ${intfs}

#
# no BGP configured on VSR level
#
### /show router bgp summary all
#Get BGP Summaries (VSR)
#   @{bgp} =    Get BGP Peers Summary
#	Log    ${bgp}
#
##/show router bgp group
#Get BGP Groups
#    @{groups} = Get BGP groups
#
### /show router bgp routes
#Get BGP Routes
#    Get BGP routes
#
### /show router status
#Checking BGP
#    BGP is enabled

Checking Router config
 	${output} =    Execute SROS Command    /show router 100 status
	${bgp} =	Get Line	${output}	14
#   Log to console  ${\n} VPRN 100 BGP status = |${bgp}|	   console=${True}	
    Should Be True      "Up" in """${bgp}"""
    Should Not Be True     "Down" in """${bgp}"""
	
	${output} =    Execute SROS Command    /show router 101 status
	${bgp} =	Get Line	${output}	14
#   Log to console  ${\n} VPRN 101 BGP status = |${bgp}|	   console=${True}	
    Should Be True      "Up" in """${bgp}"""
	Should Not Be True     "Down" in """${bgp}"""
	
	${output} =    Execute SROS Command    /show router 102 status
	${bgp} =	Get Line	${output}	14
#   Log to console  ${\n} VPRN 102 BGP status = |${bgp}|	   console=${True}	
    Should Be True      "Up" in """${bgp}"""
	Should Not Be True     "Down" in """${bgp}"""
	
	${output} =    Execute SROS Command    /show router 103 status
	${bgp} =	Get Line	${output}	14
#   Log to console  ${\n} VPRN 103 BGP status = |${bgp}|	   console=${True}	
    Should Be True      "Up" in """${bgp}"""
	Should Not Be True     "Down" in """${bgp}"""
	
	${output} =    Execute SROS Command    /show router 105 status
	${bgp} =	Get Line	${output}	14
#   Log to console  ${\n} VPRN 105 BGP status = |${bgp}|	   console=${True}	
    Should Be True      "Up" in """${bgp}"""
	Should Not Be True     "Down" in """${bgp}"""
	
	${output} =    Execute SROS Command    /show router 106 status
	${bgp} =	Get Line	${output}	14
#   Log to console  ${\n} VPRN 106 BGP status = |${bgp}|	   console=${True}	
    Should Be True      "Up" in """${bgp}"""
	Should Not Be True     "Down" in """${bgp}"""
	
	${output} =    Execute SROS Command    /show router 107 status
	${bgp} =	Get Line	${output}	14
#   Log to console  ${\n} VPRN 107 BGP status = |${bgp}|	   console=${True}	
    Should Be True      "Up" in """${bgp}"""
	Should Not Be True     "Down" in """${bgp}"""
	
	${output} =    Execute SROS Command    /show router 109 status
	${bgp} =	Get Line	${output}	14
#   Log to console  ${\n} VPRN 109 BGP status = |${bgp}|	   console=${True}	
    Should Be True      "Up" in """${bgp}"""
	Should Not Be True     "Down" in """${bgp}"""
	
Checking PORTS (VSR)
    @{ports} =    Get PORTS
	Log    ${ports}
	
Testing reachability VPRN-A-MPLS1 to NSG-UBR1 interface
    @{results} =    sros.Ping
                    ...     host=${cats_nsg_ubr1_gw_to_mpls1}
                    ...     router=100
                    ...     count=3
					...     verbose=True

Testing reachability VPRN-A-MPLS2 to NSG-UBR1 interface				
	@{results} =    sros.Ping
                    ...     host=${cats_nsg_ubr1_gw_to_mpls2}
                    ...     router=101
                    ...     count=3
					...     verbose=True
					
Testing reachability VPRN-B-MPLS1 to NSG-UBR1 interface
    @{results} =    sros.Ping
                    ...     host=${cats_nsg_ubr1_gw_to_mpls1}
                    ...     router=102
                    ...     count=3
					...     verbose=True

Testing reachability VPRN-B-MPLS2 to NSG-UBR1 interface
    @{results} =    sros.Ping
                    ...     host=${cats_nsg_ubr1_gw_to_mpls2}
                    ...     router=103
                    ...     count=3
					...     verbose=True

Testing reachability INTERNET to NSG-UBR1 interface			
	@{results} =    sros.Ping
                    ...     host=${cats_nsg_ubr1_gw_to_internet}
                    ...     router=109
                    ...     count=3
					...     verbose=True
		
	
Testing reachability VPRN-A-MPLS1 to NSG-UBR2 interface
    @{results} =    sros.Ping
                    ...     host=${cats_nsg_ubr2_gw_to_mpls1}
                    ...     router=105
                    ...     count=3
					...     verbose=True

Testing reachability VPRN-A-MPLS2 to NSG-UBR2 interface				
	@{results} =    sros.Ping
                    ...     host=${cats_nsg_ubr2_gw_to_mpls2}
                    ...     router=107
                    ...     count=3
					...     verbose=True
					
Testing reachability VPRN-B-MPLS1 to NSG-UBR2 interface
    @{results} =    sros.Ping
                    ...     host=${cats_nsg_ubr2_gw_to_mpls1}
                    ...     router=105
                    ...     count=3
					...     verbose=True

Testing reachability VPRN-B-MPLS2 to NSG-UBR2 interface
    @{results} =    sros.Ping
                    ...     host=${cats_nsg_ubr2_gw_to_mpls2}
                    ...     router=107
                    ...     count=3
					...     verbose=True

Testing reachability INTERNET to NSG-UBR2 interface			
	@{results} =    sros.Ping
                    ...     host=${cats_nsg_ubr2_gw_to_internet}
                    ...     router=109
                    ...     count=3
					...     verbose=True		
*** Keywords ***

VSR version check
  ${output} =    Execute SROS Command     show version
