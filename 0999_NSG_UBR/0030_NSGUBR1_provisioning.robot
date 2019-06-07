*** Settings ***

Resource         	ubr_vars.robot
Resource         	cats_lib/resources/cats_common.robot
Resource         	cats_lib/resources/nsg.robot

Force Tags		  	preparation
Documentation		Test case for NSG UBR1 provisioning
Test Timeout		2 minutes

*** Test Cases ***

Checking NSGvBx availability
    [Setup]  Csproot User is logged in VSD

#	NSGvB1 is up in Monitoring
#	NSGvB2 is up in Monitoring
#	NSGvB1 is configured
#	NSGvB2 is configured
#	NSGvB1 is bootstrapped
#	NSGvB2 is bootstrapped
	
#Computing variables (NSGUBR1)
    # this KW Sets Suite Variable w/ name ${cats_nsgs} and ${cats_nsg_templates}
    # which contains a dictionary of templated parameters
    Load NSGs Variables from YAML
    ...    fname=${CURDIR}/${cats_nsg_ubr1_vars_fname}
    ...    test_prefix=NSGUBR1
	
Creating Infrastructure GW Profile (NSG UBR)
    Create Infrastructure GW Profile    
    ...    name=${cats_infra_gw_profile_name_ubr}
    ...    proxyDNSName=${cats_util1_fqdn}

Creating VSC profiles (NSG UBR)
    #VSC 5 & 6 Profile BR / UBR
    Create VSC Profile    
    ...    name=${cats_vsc_profile3_name}
    ...    firstController=${cats_vsc5_ip}
    ...    secondController=${cats_vsc6_ip}
	
Creating NSG UBR Template 
    Create NSG Template    
    ...     name=${cats_nsg_template_name_ubr1}
    ...     cats_infra_gw_profile_name=${cats_infra_gw_profile_name_ubr}
    ...     personality=NSGDUC

Creating 6 Ports in NSG UBR Template
    Create Port Template in NSG Template    
	...     name=port1
    ...     physicalName=port1
    ...     portType=NETWORK
    ...     VLANRange=0-4094
    ...     mtu=1496
    ...     cats_nsg_template_name=${cats_nsg_template_name_ubr1}

    Create Port Template in NSG Template    
    ...     name=port2
    ...     physicalName=port2
    ...     portType=NETWORK
    ...     VLANRange=0-4094
    ...     mtu=1496
    ...     cats_nsg_template_name=${cats_nsg_template_name_ubr1}

    Create Port Template in NSG Template 
    ...     name=port3
    ...     physicalName=port3
    ...     portType=ACCESS
    ...     VLANRange=0-4094
    ...     cats_nsg_template_name=${cats_nsg_template_name_ubr1}
	
	Create Port Template in NSG Template 
    ...     name=port4
    ...     physicalName=port4
    ...     portType=ACCESS
    ...     VLANRange=0-4094
    ...     cats_nsg_template_name=${cats_nsg_template_name_ubr1}
	
	Create Port Template in NSG Template 
    ...     name=port5
    ...     physicalName=port5
    ...     portType=ACCESS
    ...     VLANRange=0-4094
    ...     cats_nsg_template_name=${cats_nsg_template_name_ubr1}
	
	Create Port Template in NSG Template 
    ...     name=port6
    ...     physicalName=port6
    ...     portType=ACCESS
    ...     VLANRange=0-4094
    ...     cats_nsg_template_name=${cats_nsg_template_name_ubr1}
	
Creating 4 VLANs for Port 1 in NSG UBR Template
    Create VLAN Template in NSG Port Template    
    ...     value=148
    ...     cats_nsg_template_name=${cats_nsg_template_name_ubr1}
    ...     cats_nsg_port_template_name=port1
	
    Create VLAN Template in NSG Port Template    
    ...     value=139
    ...     ducVlan=true
    ...     cats_nsg_template_name=${cats_nsg_template_name_ubr1}
    ...     cats_nsg_port_template_name=port1

    Create VLAN Template in NSG Port Template    
    ...     value=143
    ...     ducVlan=true
    ...     cats_nsg_template_name=${cats_nsg_template_name_ubr1}
    ...     cats_nsg_port_template_name=port1

    Create VLAN Template in NSG Port Template    
    ...     value=157
	...     ducVlan=true
    ...     cats_nsg_template_name=${cats_nsg_template_name_ubr1}
    ...     cats_nsg_port_template_name=port1

Adding VSC Profile 5 & 6 to port1 in NSG UBR Template 
    Associate VSC Profile with NSG VLAN Template    
    ...     cats_vlan_id=148
    ...     cats_vsc_profile_name=${cats_vsc_profile3_name}
    ...     cats_nsg_port_template_name=port1
    ...     cats_nsg_template_name=${cats_nsg_template_name_ubr1}

#Add VSC Profile 5 & 6 to port2 in NSG UBR Template 
#    Associate VSC Profile with NSG VLAN Template    
#    ...     cats_vlan_id=148
#    ...     cats_vsc_profile_name=${cats_vsc_profile3_name}
#    ...     cats_nsg_port_template_name=port2
#    ...     cats_nsg_template_name=${cats_nsg_template_name_ubr1}

Creating 3 Underlays (Internet & MPLS1 & MPLS2)

    Create Underlay in Platform Configuration
    ...     name=${cats_underlay_1}

    Create Underlay in Platform Configuration
    ...     name=${cats_underlay_2}

    Create Underlay in Platform Configuration
    ...     name=${cats_underlay_3}
	
Creating Uplink Connection (primary - vlan 148)
	Create Uplink Connection in NSG Vlan Template
    ...     mode=Static
    ...     role=PRIMARY
    ...     cats_nsg_template_name=${cats_nsg_template_name_ubr1}
    ...     cats_nsg_port_template_name=port1
    ...     cats_vlan_id=148
    ...     address=${cats_nsg_ubr1_ip_to_controller}
    ...     gateway=${cats_nsg_ubr1_gw_to_controller}
    ...     netmask=${cats_nsg_ubr_netmask}
    ...     DNSAddress=${cats_nsg_ubr_dns}

Creating Uplink Connection (mpls1 underlay - vlan 157)
	Create Uplink Connection in NSG Vlan Template
    ...     mode=Static
    ...     role=NONE
    ...     cats_nsg_template_name=${cats_nsg_template_name_ubr1}
    ...     cats_nsg_port_template_name=port1
	...     cats_underlay_name=${cats_underlay_1}
    ...     cats_vlan_id=157
    ...     address=${cats_nsg_ubr1_ip_to_mpls1}
    ...     gateway=${cats_nsg_ubr1_gw_to_mpls1}
    ...     netmask=${cats_nsg_ubr_netmask}
    ...     DNSAddress=${cats_nsg_ubr_dns}

Creating Uplink Connection (mpls2 underlay - vlan 143)    
	Create Uplink Connection in NSG Vlan Template
    ...     mode=Static
    ...     role=NONE
    ...     cats_nsg_template_name=${cats_nsg_template_name_ubr1}
    ...     cats_nsg_port_template_name=port1
	...     cats_underlay_name=${cats_underlay_2}
    ...     cats_vlan_id=143
    ...     address=${cats_nsg_ubr1_ip_to_mpls2}
    ...     gateway=${cats_nsg_ubr1_gw_to_mpls2}
    ...     netmask=${cats_nsg_ubr_netmask}
    ...     DNSAddress=${cats_nsg_ubr_dns}

Creating Uplink Connection (internet underlay - vlan 139)
	Create Uplink Connection in NSG Vlan Template
    ...     mode=Static
    ...     role=NONE
    ...     cats_nsg_template_name=${cats_nsg_template_name_ubr1}
    ...     cats_nsg_port_template_name=port1
	...     cats_underlay_name=${cats_underlay_3}
    ...     cats_vlan_id=139
    ...     address=${cats_nsg_ubr1_ip_to_internet}
    ...     gateway=${cats_nsg_ubr1_gw_to_internet}
    ...     netmask=${cats_nsg_ubr_netmask}
    ...     DNSAddress=${cats_nsg_ubr_dns}
	
Associating Underlay Uplink Connection (mpls1 - vlan 157)
    Associate Underlay with NSG Template Uplink
    ...    cats_nsg_template_name=${cats_nsg_template_name_ubr1}
    ...    cats_nsg_port_template_name=port1
    ...    cats_vlan_id=157
    ...    cats_underlay_name=${cats_underlay_1}
 
Associating Underlay Uplink Connection (mpls2 - vlan 143)
    Associate Underlay with NSG Template Uplink
    ...    cats_nsg_template_name=${cats_nsg_template_name_ubr1}
    ...    cats_nsg_port_template_name=port1
    ...    cats_vlan_id=143
    ...    cats_underlay_name=${cats_underlay_2}
    
Associating Underlay Uplink Connection (internet - vlan 139)
	Associate Underlay with NSG Template Uplink
    ...    cats_nsg_template_name=${cats_nsg_template_name_ubr1}
    ...    cats_nsg_port_template_name=port1
    ...    cats_vlan_id=139
    ...    cats_underlay_name=${cats_underlay_3}

#########################
Creating NSG UBR1 Instance
#########################
	
    Create NSG UBR 
    ...     name=${cats_nsg_name_ubr1}
    ...     cats_nsg_ubr_template_name=${cats_nsg_template_name_ubr1}
	
Assign permissions to NSG UBR1 so enterprise can use this entity

    Grant Enterprise Permission To UBR
    ...     cats_nsg_ubr_name=${cats_nsg_name_ubr1} 
    ...     cats_org_name=${cats_org_name}