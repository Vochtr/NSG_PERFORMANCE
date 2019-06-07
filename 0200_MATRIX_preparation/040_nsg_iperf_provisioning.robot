*** Settings ***

Force Tags		  matrix
Documentation	  Test case for NSGv IPERF provisioning 
Test Timeout	  1 minute

Resource          ../_VARS/vars.robot
Resource          ../_VARS/create.robot
Resource          cats_lib/resources/cats_common.robot

*** Test Cases ***
# -----------------------------------------------------------------------
#                            NSG Provisioning
# -----------------------------------------------------------------------
CSPROOT Logs In 
    Csproot user is logged in VSD

Computing NSG variables
    # this KW Sets Suite Variable w/ name ${cats_nsgs} and ${cats_nsg_templates}
    # which contains a dictionary of templated parameters
    Load NSGs Variables from YAML
    ...    fname=${CURDIR}/_VARS/${cats_nsg_vars_fname}
    ...    test_prefix=${test_prefix}

Creating vPorts and attach Bridge Interfaces for physical NSGs (Iperf)
  Run Keyword If   ${NSG-C_1} == True       Create a vPort and attach Bridge Interface for NSG-C_1
  Run Keyword If   ${NSG-C_2} == True       Create a vPort and attach Bridge Interface for NSG-C_2
  Run Keyword If   ${NSG-C_3} == True       Create a vPort and attach Bridge Interface for NSG-C_3
  Run Keyword If   ${NSG-C_4} == True       Create a vPort and attach Bridge Interface for NSG-C_4
  Run Keyword If   ${NSG-E_1} == True       Create a vPort and attach Bridge Interface for NSG-E_1
  Run Keyword If   ${NSG-E_2} == True       Create a vPort and attach Bridge Interface for NSG-E_2
  Run Keyword If   ${NSG-E200_1} == True    Create a vPort and attach Bridge Interface for NSG-E200_1
  Run Keyword If   ${NSG-E200_2} == True    Create a vPort and attach Bridge Interface for NSG-E200_2
  Run Keyword If   ${NSG-E200_3} == True    Create a vPort and attach Bridge Interface for NSG-E200_3
  Run Keyword If   ${NSG-E200_4} == True    Create a vPort and attach Bridge Interface for NSG-E200_4
  Run Keyword If   ${NSG-E300_1} == True    Create a vPort and attach Bridge Interface for NSG-E300_1
  Run Keyword If   ${NSG-E300_2} == True    Create a vPort and attach Bridge Interface for NSG-E300_2
  Run Keyword If   ${NSG-X200_1} == True    Create a vPort and attach Bridge Interface for NSG-X200_1
  Run Keyword If   ${NSG-X200_2} == True    Create a vPort and attach Bridge Interface for NSG-X200_2
  Run Keyword If   ${NSG-X_1} == True       Create a vPort and attach Bridge Interface for NSG-X_1
  Run Keyword If   ${NSG-X_2} == True       Create a vPort and attach Bridge Interface for NSG-X_2
  Run Keyword If   ${NSG-X_3} == True       Create a vPort and attach Bridge Interface for NSG-X_3
  Run Keyword If   ${NSG-X_4} == True       Create a vPort and attach Bridge Interface for NSG-X_4
  Run Keyword If   ${NSG-E202_1} == True    Create a vPort and attach Bridge Interface for NSG-E202_1
  Run Keyword If   ${NSG-E202_2} == True    Create a vPort and attach Bridge Interface for NSG-E202_2
  Run Keyword If   ${NSG-E206_1} == True    Create a vPort and attach Bridge Interface for NSG-E206_1
  Run Keyword If   ${NSG-E206_2} == True    Create a vPort and attach Bridge Interface for NSG-E206_2
  Run Keyword If   ${NSG-E306_1} == True    Create a vPort and attach Bridge Interface for NSG-E306_1
  Run Keyword If   ${NSG-E306_2} == True    Create a vPort and attach Bridge Interface for NSG-E306_2

Creating vPorts and attach Bridge Interfaces for virtual NSGs (Iperf)
  Run Keyword If   ${NSGv01} == True    Create a vPort and attach Bridge Interface for NSGv01
  Run Keyword If   ${NSGv02} == True    Create a vPort and attach Bridge Interface for NSGv02
  Run Keyword If   ${NSGv03} == True    Create a vPort and attach Bridge Interface for NSGv03
  Run Keyword If   ${NSGv04} == True    Create a vPort and attach Bridge Interface for NSGv04
  Run Keyword If   ${NSGv05} == True    Create a vPort and attach Bridge Interface for NSGv05
  Run Keyword If   ${NSGv06} == True    Create a vPort and attach Bridge Interface for NSGv06
  Run Keyword If   ${NSGv07} == True    Create a vPort and attach Bridge Interface for NSGv07
  Run Keyword If   ${NSGv08} == True    Create a vPort and attach Bridge Interface for NSGv08
  Run Keyword If   ${NSGv09} == True    Create a vPort and attach Bridge Interface for NSGv09
  Run Keyword If   ${NSGv10} == True    Create a vPort and attach Bridge Interface for NSGv10
  Run Keyword If   ${NSGv11} == True    Create a vPort and attach Bridge Interface for NSGv11
  Run Keyword If   ${NSGv12} == True    Create a vPort and attach Bridge Interface for NSGv12
  Run Keyword If   ${NSGv13} == True    Create a vPort and attach Bridge Interface for NSGv13
  Run Keyword If   ${NSGv14} == True    Create a vPort and attach Bridge Interface for NSGv14
  Run Keyword If   ${NSGv15} == True    Create a vPort and attach Bridge Interface for NSGv15
  Run Keyword If   ${NSGv16} == True    Create a vPort and attach Bridge Interface for NSGv16
  Run Keyword If   ${NSGv17} == True    Create a vPort and attach Bridge Interface for NSGv17
  Run Keyword If   ${NSGv18} == True    Create a vPort and attach Bridge Interface for NSGv18
  Run Keyword If   ${NSGv19} == True    Create a vPort and attach Bridge Interface for NSGv19
  Run Keyword If   ${NSGv20} == True    Create a vPort and attach Bridge Interface for NSGv20
  Run Keyword If   ${NSGv21} == True    Create a vPort and attach Bridge Interface for NSGv21
  Run Keyword If   ${NSGv22} == True    Create a vPort and attach Bridge Interface for NSGv22
  Run Keyword If   ${NSGv23} == True    Create a vPort and attach Bridge Interface for NSGv23
  Run Keyword If   ${NSGv24} == True    Create a vPort and attach Bridge Interface for NSGv24
  Run Keyword If   ${NSGv25} == True    Create a vPort and attach Bridge Interface for NSGv25
  Run Keyword If   ${NSGv26} == True    Create a vPort and attach Bridge Interface for NSGv26
  Run Keyword If   ${NSGv27} == True    Create a vPort and attach Bridge Interface for NSGv27
  Run Keyword If   ${NSGv28} == True    Create a vPort and attach Bridge Interface for NSGv28
  Run Keyword If   ${NSGv29} == True    Create a vPort and attach Bridge Interface for NSGv29
  Run Keyword If   ${NSGv30} == True    Create a vPort and attach Bridge Interface for NSGv30
  Run Keyword If   ${NSGv31} == True    Create a vPort and attach Bridge Interface for NSGv31
  Run Keyword If   ${NSGv32} == True    Create a vPort and attach Bridge Interface for NSGv32
  Run Keyword If   ${NSGv33} == True    Create a vPort and attach Bridge Interface for NSGv33
  Run Keyword If   ${NSGv34} == True    Create a vPort and attach Bridge Interface for NSGv34
  Run Keyword If   ${NSGv35} == True    Create a vPort and attach Bridge Interface for NSGv35
  Run Keyword If   ${NSGv36} == True    Create a vPort and attach Bridge Interface for NSGv36
  Run Keyword If   ${NSGv37} == True    Create a vPort and attach Bridge Interface for NSGv37
  Run Keyword If   ${NSGv38} == True    Create a vPort and attach Bridge Interface for NSGv38
  Run Keyword If   ${NSGv39} == True    Create a vPort and attach Bridge Interface for NSGv39
  Run Keyword If   ${NSGv40} == True    Create a vPort and attach Bridge Interface for NSGv40
  Run Keyword If   ${NSGv41} == True    Create a vPort and attach Bridge Interface for NSGv41
  Run Keyword If   ${NSGv42} == True    Create a vPort and attach Bridge Interface for NSGv42
  Run Keyword If   ${NSGv43} == True    Create a vPort and attach Bridge Interface for NSGv43
  Run Keyword If   ${NSGv44} == True    Create a vPort and attach Bridge Interface for NSGv44
  Run Keyword If   ${NSGv45} == True    Create a vPort and attach Bridge Interface for NSGv45
  Run Keyword If   ${NSGv46} == True    Create a vPort and attach Bridge Interface for NSGv46
  Run Keyword If   ${NSGv47} == True    Create a vPort and attach Bridge Interface for NSGv47
  Run Keyword If   ${NSGv48} == True    Create a vPort and attach Bridge Interface for NSGv48
  Run Keyword If   ${NSGv49} == True    Create a vPort and attach Bridge Interface for NSGv49
  Run Keyword If   ${NSGv50} == True    Create a vPort and attach Bridge Interface for NSGv50  
  
*** Keywords ***
  
# NSG-C_1
Create a vPort and attach Bridge Interface for NSG-C_1
    Create Bridge vPort for NSG
    ...    name=NSG-C_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetC1_name}
    ...    cats_nsg_name=${cats_NSG-C-1_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template7']['port2']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSG-C_1_itfc_I
    ...    cats_vport_name=NSG-C_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSG-C_2
Create a vPort and attach Bridge Interface for NSG-C_2
    Create Bridge vPort for NSG
    ...    name=NSG-C_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetC2_name}
    ...    cats_nsg_name=${cats_NSG-C-2_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template7']['port2']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSG-C_2_itfc_I
    ...    cats_vport_name=NSG-C_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
# NSG-C_3
Create a vPort and attach Bridge Interface for NSG-C_3
    Create Bridge vPort for NSG
    ...    name=NSG-C_3_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetC3_name}
    ...    cats_nsg_name=${cats_NSG-C-3_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template7']['port2']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSG-C_3_itfc_I
    ...    cats_vport_name=NSG-C_3_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSG-C_4
Create a vPort and attach Bridge Interface for NSG-C_4
    Create Bridge vPort for NSG
    ...    name=NSG-C_4_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetC4_name}
    ...    cats_nsg_name=${cats_NSG-C-4_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template7']['port2']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSG-C_4_itfc_I
    ...    cats_vport_name=NSG-C_4_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
# NSG-E_1
Create a vPort and attach Bridge Interface for NSG-E_1
    Create Bridge vPort for NSG
    ...    name=NSG-E_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE1_name}
    ...    cats_nsg_name=${cats_NSG-E-1_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port5']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSG-E_1_itfc_I
    ...    cats_vport_name=NSG-E_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
# NSG-E_2
Create a vPort and attach Bridge Interface for NSG-E_2
    Create Bridge vPort for NSG
    ...    name=NSG-E_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE2_name}
    ...    cats_nsg_name=${cats_NSG-E-2_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port5']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSG-E_2_itfc_I
    ...    cats_vport_name=NSG-E_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
# NSG-E200_1
Create a vPort and attach Bridge Interface for NSG-E200_1
    Create Bridge vPort for NSG
    ...    name=NSG-E200_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE2001_name}
    ...    cats_nsg_name=${cats_NSG-E200-1_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port5']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSG-E200_1_itfc_I
    ...    cats_vport_name=NSG-E200_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
# NSG-E200_2
Create a vPort and attach Bridge Interface for NSG-E200_2
    Create Bridge vPort for NSG
    ...    name=NSG-E200_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE2002_name}
    ...    cats_nsg_name=${cats_NSG-E200-2_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port5']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSG-E200_2_itfc_I
    ...    cats_vport_name=NSG-E200_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
# NSG-E200_3
Create a vPort and attach Bridge Interface for NSG-E200_3
    Create Bridge vPort for NSG
    ...    name=NSG-E200_3_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE2003_name}
    ...    cats_nsg_name=${cats_NSG-E200-3_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port5']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSG-E200_3_itfc_I
    ...    cats_vport_name=NSG-E200_3_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
# NSG-E200_4
Create a vPort and attach Bridge Interface for NSG-E200_4
    Create Bridge vPort for NSG
    ...    name=NSG-E200_4_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE2004_name}
    ...    cats_nsg_name=${cats_NSG-E200-4_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port5']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSG-E200_4_itfc_I
    ...    cats_vport_name=NSG-E200_4_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
# NSG-E300_1
Create a vPort and attach Bridge Interface for NSG-E300_1
    Create Bridge vPort for NSG
    ...    name=NSG-E300_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE3001_name}
    ...    cats_nsg_name=${cats_NSG-E300-1_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port5']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSG-E300_1_itfc_I
    ...    cats_vport_name=NSG-E300_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
# NSG-E300_2
Create a vPort and attach Bridge Interface for NSG-E300_2
    Create Bridge vPort for NSG
    ...    name=NSG-E300_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE3002_name}
    ...    cats_nsg_name=${cats_NSG-E300-2_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port5']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSG-E300_2_itfc_I
    ...    cats_vport_name=NSG-E300_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
# NSG-X200_1
Create a vPort and attach Bridge Interface for NSG-X200_1
    Create Bridge vPort for NSG
    ...    name=NSG-X200_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetX2001_name}
    ...    cats_nsg_name=${cats_NSG-X200-1_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port5']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSG-X200_1_itfc_I
    ...    cats_vport_name=NSG-X200_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
# NSG-X200_2
Create a vPort and attach Bridge Interface for NSG-X200_2
    Create Bridge vPort for NSG
    ...    name=NSG-X200_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetX2002_name}
    ...    cats_nsg_name=${cats_NSG-X200-2_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port5']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSG-X200_2_itfc_I
    ...    cats_vport_name=NSG-X200_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
		
# NSG-X_1
Create a vPort and attach Bridge Interface for NSG-X_1
    Create Bridge vPort for NSG
    ...    name=NSG-X_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetX1_name}
    ...    cats_nsg_name=${cats_NSG-X-1_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port5']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSG-X_1_itfc_I
    ...    cats_vport_name=NSG-X_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSG-X_2
Create a vPort and attach Bridge Interface for NSG-X_2
    Create Bridge vPort for NSG
    ...    name=NSG-X_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetX2_name}
    ...    cats_nsg_name=${cats_NSG-X-2_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port5']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSG-X_2_itfc_I
    ...    cats_vport_name=NSG-X_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
  
# NSG-X_3
Create a vPort and attach Bridge Interface for NSG-X_3
    Create Bridge vPort for NSG
    ...    name=NSG-X_3_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetX3_name}
    ...    cats_nsg_name=${cats_NSG-X-3_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port5']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSG-X_3_itfc_I
    ...    cats_vport_name=NSG-X_3_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSG-X_4
Create a vPort and attach Bridge Interface for NSG-X_4
    Create Bridge vPort for NSG
    ...    name=NSG-X_4_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetX4_name}
    ...    cats_nsg_name=${cats_NSG-X-4_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port5']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSG-X_4_itfc_I
    ...    cats_vport_name=NSG-X_4_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSG-E202_1
Create a vPort and attach Bridge Interface for NSG-E202_1
    Create Bridge vPort for NSG
    ...    name=NSG-E202_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE2021_name}
    ...    cats_nsg_name=${cats_NSG-E202-1_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port5']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSG-E202_1_itfc_I
    ...    cats_vport_name=NSG-E202_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
# NSG-E202_2
Create a vPort and attach Bridge Interface for NSG-E202_2
    Create Bridge vPort for NSG
    ...    name=NSG-E202_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE2022_name}
    ...    cats_nsg_name=${cats_NSG-E202-2_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port5']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSG-E202_2_itfc_I
    ...    cats_vport_name=NSG-E202_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
# NSG-E206_1
Create a vPort and attach Bridge Interface for NSG-E206_1
    Create Bridge vPort for NSG
    ...    name=NSG-E206_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE2061_name}
    ...    cats_nsg_name=${cats_NSG-E206-1_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port5']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSG-E206_1_itfc_I
    ...    cats_vport_name=NSG-E206_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
# NSG-E206_2
Create a vPort and attach Bridge Interface for NSG-E206_2
    Create Bridge vPort for NSG
    ...    name=NSG-E206_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE2062_name}
    ...    cats_nsg_name=${cats_NSG-E206-2_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port5']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSG-E206_2_itfc_I
    ...    cats_vport_name=NSG-E206_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
# NSG-E306_1
Create a vPort and attach Bridge Interface for NSG-E306_1
    Create Bridge vPort for NSG
    ...    name=NSG-E306_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE3061_name}
    ...    cats_nsg_name=${cats_NSG-E306-1_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port5']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSG-E306_1_itfc_I
    ...    cats_vport_name=NSG-E306_1_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
# NSG-E306_2
Create a vPort and attach Bridge Interface for NSG-E306_2
    Create Bridge vPort for NSG
    ...    name=NSG-E306_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnetE3062_name}
    ...    cats_nsg_name=${cats_NSG-E306-2_name}
    ...    cats_nsg_port_name=${cats_nsg_templates['template5']['port5']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSG-E306_2_itfc_I
    ...    cats_vport_name=NSG-E306_2_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
# NSGv01
Create a vPort and attach Bridge Interface for NSGv01
    Create Bridge vPort for NSG
    ...    name=NSGv01_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet1_name}
    ...    cats_nsg_name=${cats_nsgs['nsg1']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv01_itfc_I
    ...    cats_vport_name=NSGv01_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv02
Create a vPort and attach Bridge Interface for NSGv02
    Create Bridge vPort for NSG
    ...    name=NSGv02_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet2_name}
    ...    cats_nsg_name=${cats_nsgs['nsg2']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv02_itfc_I
    ...    cats_vport_name=NSGv02_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv03	
Create a vPort and attach Bridge Interface for NSGv03 
    Create Bridge vPort for NSG
    ...    name=NSGv03_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet3_name}
    ...    cats_nsg_name=${cats_nsgs['nsg3']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv03_itfc_I
    ...    cats_vport_name=NSGv03_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv04
Create a vPort and attach Bridge Interface for NSGv04 
    Create Bridge vPort for NSG
    ...    name=NSGv04_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet4_name}
    ...    cats_nsg_name=${cats_nsgs['nsg4']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv04_itfc_I
    ...    cats_vport_name=NSGv04_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv05
Create a vPort and attach Bridge Interface for NSGv05 
    Create Bridge vPort for NSG
    ...    name=NSGv05_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet5_name}
    ...    cats_nsg_name=${cats_nsgs['nsg5']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv05_itfc_I
    ...    cats_vport_name=NSGv05_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv06
Create a vPort and attach Bridge Interface for NSGv06
    Create Bridge vPort for NSG
    ...    name=NSGv06_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet6_name}
    ...    cats_nsg_name=${cats_nsgs['nsg6']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv06_itfc_I
    ...    cats_vport_name=NSGv06_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv07
Create a vPort and attach Bridge Interface for NSGv07 
    Create Bridge vPort for NSG
    ...    name=NSGv07_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet7_name}
    ...    cats_nsg_name=${cats_nsgs['nsg7']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv07_itfc_I
    ...    cats_vport_name=NSGv07_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv08
Create a vPort and attach Bridge Interface for NSGv08 
    Create Bridge vPort for NSG
    ...    name=NSGv08_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet8_name}
    ...    cats_nsg_name=${cats_nsgs['nsg8']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv08_itfc_I
    ...    cats_vport_name=NSGv08_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv09
Create a vPort and attach Bridge Interface for NSGv09 
    Create Bridge vPort for NSG
    ...    name=NSGv09_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet9_name}
    ...    cats_nsg_name=${cats_nsgs['nsg9']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv09_itfc_I
    ...    cats_vport_name=NSGv09_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
# NSGv10
Create a vPort and attach Bridge Interface for NSGv10 
    Create Bridge vPort for NSG
    ...    name=NSGv10_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet10_name}
    ...    cats_nsg_name=${cats_nsgs['nsg10']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv10_itfc_I
    ...    cats_vport_name=NSGv10_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
# NSGv11
Create a vPort and attach Bridge Interface for NSGv11 
    Create Bridge vPort for NSG
    ...    name=NSGv11_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet11_name}
    ...    cats_nsg_name=${cats_nsgs['nsg11']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv11_itfc_I
    ...    cats_vport_name=NSGv11_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv12
Create a vPort and attach Bridge Interface for NSGv12
    Create Bridge vPort for NSG
    ...    name=NSGv12_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet12_name}
    ...    cats_nsg_name=${cats_nsgs['nsg12']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv12_itfc_I
    ...    cats_vport_name=NSGv12_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv13	
Create a vPort and attach Bridge Interface for NSGv13 
    Create Bridge vPort for NSG
    ...    name=NSGv13_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet13_name}
    ...    cats_nsg_name=${cats_nsgs['nsg13']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv13_itfc_I
    ...    cats_vport_name=NSGv13_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv14
Create a vPort and attach Bridge Interface for NSGv14 
    Create Bridge vPort for NSG
    ...    name=NSGv14_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet14_name}
    ...    cats_nsg_name=${cats_nsgs['nsg14']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv14_itfc_I
    ...    cats_vport_name=NSGv14_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv15
Create a vPort and attach Bridge Interface for NSGv15 
    Create Bridge vPort for NSG
    ...    name=NSGv15_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet15_name}
    ...    cats_nsg_name=${cats_nsgs['nsg15']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv15_itfc_I
    ...    cats_vport_name=NSGv15_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv16
Create a vPort and attach Bridge Interface for NSGv16
    Create Bridge vPort for NSG
    ...    name=NSGv16_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet16_name}
    ...    cats_nsg_name=${cats_nsgs['nsg16']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv16_itfc_I
    ...    cats_vport_name=NSGv16_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv17
Create a vPort and attach Bridge Interface for NSGv17 
    Create Bridge vPort for NSG
    ...    name=NSGv17_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet17_name}
    ...    cats_nsg_name=${cats_nsgs['nsg17']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv17_itfc_I
    ...    cats_vport_name=NSGv17_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv18
Create a vPort and attach Bridge Interface for NSGv18 
    Create Bridge vPort for NSG
    ...    name=NSGv18_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet18_name}
    ...    cats_nsg_name=${cats_nsgs['nsg18']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv18_itfc_I
    ...    cats_vport_name=NSGv18_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv19
Create a vPort and attach Bridge Interface for NSGv19 
    Create Bridge vPort for NSG
    ...    name=NSGv19_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet19_name}
    ...    cats_nsg_name=${cats_nsgs['nsg19']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv19_itfc_I
    ...    cats_vport_name=NSGv19_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
# NSGv20
Create a vPort and attach Bridge Interface for NSGv20 
    Create Bridge vPort for NSG
    ...    name=NSGv20_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet20_name}
    ...    cats_nsg_name=${cats_nsgs['nsg20']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv20_itfc_I
    ...    cats_vport_name=NSGv20_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv21
Create a vPort and attach Bridge Interface for NSGv21 
    Create Bridge vPort for NSG
    ...    name=NSGv21_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet21_name}
    ...    cats_nsg_name=${cats_nsgs['nsg21']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv21_itfc_I
    ...    cats_vport_name=NSGv21_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv22
Create a vPort and attach Bridge Interface for NSGv22
    Create Bridge vPort for NSG
    ...    name=NSGv22_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet22_name}
    ...    cats_nsg_name=${cats_nsgs['nsg22']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv22_itfc_I
    ...    cats_vport_name=NSGv22_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv23	
Create a vPort and attach Bridge Interface for NSGv23 
    Create Bridge vPort for NSG
    ...    name=NSGv23_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet23_name}
    ...    cats_nsg_name=${cats_nsgs['nsg23']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv23_itfc_I
    ...    cats_vport_name=NSGv23_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv24
Create a vPort and attach Bridge Interface for NSGv24 
    Create Bridge vPort for NSG
    ...    name=NSGv24_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet24_name}
    ...    cats_nsg_name=${cats_nsgs['nsg24']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv24_itfc_I
    ...    cats_vport_name=NSGv24_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv25
Create a vPort and attach Bridge Interface for NSGv25 
    Create Bridge vPort for NSG
    ...    name=NSGv25_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet25_name}
    ...    cats_nsg_name=${cats_nsgs['nsg25']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv25_itfc_I
    ...    cats_vport_name=NSGv25_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv26
Create a vPort and attach Bridge Interface for NSGv26
    Create Bridge vPort for NSG
    ...    name=NSGv26_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet26_name}
    ...    cats_nsg_name=${cats_nsgs['nsg26']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv26_itfc_I
    ...    cats_vport_name=NSGv26_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv27
Create a vPort and attach Bridge Interface for NSGv27 
    Create Bridge vPort for NSG
    ...    name=NSGv27_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet27_name}
    ...    cats_nsg_name=${cats_nsgs['nsg27']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv27_itfc_I
    ...    cats_vport_name=NSGv27_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv28
Create a vPort and attach Bridge Interface for NSGv28 
    Create Bridge vPort for NSG
    ...    name=NSGv28_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet28_name}
    ...    cats_nsg_name=${cats_nsgs['nsg28']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv28_itfc_I
    ...    cats_vport_name=NSGv28_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv29
Create a vPort and attach Bridge Interface for NSGv29 
    Create Bridge vPort for NSG
    ...    name=NSGv29_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet29_name}
    ...    cats_nsg_name=${cats_nsgs['nsg29']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv29_itfc_I
    ...    cats_vport_name=NSGv29_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
# NSGv30
Create a vPort and attach Bridge Interface for NSGv30 
    Create Bridge vPort for NSG
    ...    name=NSGv30_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet30_name}
    ...    cats_nsg_name=${cats_nsgs['nsg30']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv30_itfc_I
    ...    cats_vport_name=NSGv30_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv31
Create a vPort and attach Bridge Interface for NSGv31 
    Create Bridge vPort for NSG
    ...    name=NSGv31_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet31_name}
    ...    cats_nsg_name=${cats_nsgs['nsg31']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv31_itfc_I
    ...    cats_vport_name=NSGv31_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv32
Create a vPort and attach Bridge Interface for NSGv32
    Create Bridge vPort for NSG
    ...    name=NSGv32_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet32_name}
    ...    cats_nsg_name=${cats_nsgs['nsg32']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv32_itfc_I
    ...    cats_vport_name=NSGv32_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv33	
Create a vPort and attach Bridge Interface for NSGv33 
    Create Bridge vPort for NSG
    ...    name=NSGv33_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet33_name}
    ...    cats_nsg_name=${cats_nsgs['nsg33']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv33_itfc_I
    ...    cats_vport_name=NSGv33_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv34
Create a vPort and attach Bridge Interface for NSGv34 
    Create Bridge vPort for NSG
    ...    name=NSGv34_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet34_name}
    ...    cats_nsg_name=${cats_nsgs['nsg34']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv34_itfc_I
    ...    cats_vport_name=NSGv34_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv35
Create a vPort and attach Bridge Interface for NSGv35 
    Create Bridge vPort for NSG
    ...    name=NSGv35_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet35_name}
    ...    cats_nsg_name=${cats_nsgs['nsg35']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv35_itfc_I
    ...    cats_vport_name=NSGv35_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv36
Create a vPort and attach Bridge Interface for NSGv36
    Create Bridge vPort for NSG
    ...    name=NSGv36_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet36_name}
    ...    cats_nsg_name=${cats_nsgs['nsg36']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv36_itfc_I
    ...    cats_vport_name=NSGv36_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv37
Create a vPort and attach Bridge Interface for NSGv37 
    Create Bridge vPort for NSG
    ...    name=NSGv37_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet37_name}
    ...    cats_nsg_name=${cats_nsgs['nsg37']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv37_itfc_I
    ...    cats_vport_name=NSGv37_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv38
Create a vPort and attach Bridge Interface for NSGv38 
    Create Bridge vPort for NSG
    ...    name=NSGv38_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet38_name}
    ...    cats_nsg_name=${cats_nsgs['nsg38']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv38_itfc_I
    ...    cats_vport_name=NSGv38_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv39
Create a vPort and attach Bridge Interface for NSGv39 
    Create Bridge vPort for NSG
    ...    name=NSGv39_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet39_name}
    ...    cats_nsg_name=${cats_nsgs['nsg39']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv39_itfc_I
    ...    cats_vport_name=NSGv39_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
# NSGv40
Create a vPort and attach Bridge Interface for NSGv40 
    Create Bridge vPort for NSG
    ...    name=NSGv40_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet40_name}
    ...    cats_nsg_name=${cats_nsgs['nsg40']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv40_itfc_I
    ...    cats_vport_name=NSGv40_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

#  NSGv41
Create a vPort and attach Bridge Interface for NSGv41 
    Create Bridge vPort for NSG
    ...    name=NSGv41_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet41_name}
    ...    cats_nsg_name=${cats_nsgs['nsg41']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv41_itfc_I
    ...    cats_vport_name=NSGv41_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv42
Create a vPort and attach Bridge Interface for NSGv42
    Create Bridge vPort for NSG
    ...    name=NSGv42_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet42_name}
    ...    cats_nsg_name=${cats_nsgs['nsg42']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv42_itfc_I
    ...    cats_vport_name=NSGv42_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv43	
Create a vPort and attach Bridge Interface for NSGv43 
    Create Bridge vPort for NSG
    ...    name=NSGv43_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet43_name}
    ...    cats_nsg_name=${cats_nsgs['nsg43']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv43_itfc_I
    ...    cats_vport_name=NSGv43_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv44
Create a vPort and attach Bridge Interface for NSGv44 
    Create Bridge vPort for NSG
    ...    name=NSGv44_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet44_name}
    ...    cats_nsg_name=${cats_nsgs['nsg44']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv44_itfc_I
    ...    cats_vport_name=NSGv44_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv45
Create a vPort and attach Bridge Interface for NSGv45 
    Create Bridge vPort for NSG
    ...    name=NSGv45_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet45_name}
    ...    cats_nsg_name=${cats_nsgs['nsg45']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv45_itfc_I
    ...    cats_vport_name=NSGv45_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv46
Create a vPort and attach Bridge Interface for NSGv46
    Create Bridge vPort for NSG
    ...    name=NSGv46_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet46_name}
    ...    cats_nsg_name=${cats_nsgs['nsg46']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv46_itfc_I
    ...    cats_vport_name=NSGv46_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv47
Create a vPort and attach Bridge Interface for NSGv47 
    Create Bridge vPort for NSG
    ...    name=NSGv47_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet47_name}
    ...    cats_nsg_name=${cats_nsgs['nsg47']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv47_itfc_I
    ...    cats_vport_name=NSGv47_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv48
Create a vPort and attach Bridge Interface for NSGv48 
    Create Bridge vPort for NSG
    ...    name=NSGv48_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet48_name}
    ...    cats_nsg_name=${cats_nsgs['nsg48']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv48_itfc_I
    ...    cats_vport_name=NSGv48_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

# NSGv49
Create a vPort and attach Bridge Interface for NSGv49 
    Create Bridge vPort for NSG
    ...    name=NSGv49_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet49_name}
    ...    cats_nsg_name=${cats_nsgs['nsg49']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv49_itfc_I
    ...    cats_vport_name=NSGv49_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
# NSGv50
Create a vPort and attach Bridge Interface for NSGv50 
    Create Bridge vPort for NSG
    ...    name=NSGv50_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_domain_type=L3
    ...    cats_subnet_name=${cats_subnet50_name}
    ...    cats_nsg_name=${cats_nsgs['nsg50']['name']}
    ...    cats_nsg_port_name=${cats_nsg_templates['template1']['port4']['name']}
    ...    cats_vlan_id=0

    Create Bridge Interface in L3 Domain
    ...    name=NSGv50_itfc_I
    ...    cats_vport_name=NSGv50_vport_I
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}