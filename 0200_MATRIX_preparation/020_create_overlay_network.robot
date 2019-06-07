*** Settings ***

Force Tags		  matrix
Documentation	  Test case for overlay creation 
Test Timeout	  1 minute

Resource          ../_VARS/vars.robot
Resource          ../_VARS/create.robot
Resource          cats_lib/resources/cats_common.robot
Resource          cats_lib/resources/nuageusermgmt.robot

*** Test Cases ***
# -----------------------------------------------------------------------
#                   Overlay Provisioning
# -----------------------------------------------------------------------
CSPROOT Logs In
    Csproot user is logged in VSD

Create Org Profile
    Create Organization Profile
    ...    name=${cats_org_profile_name}
    ...    allowAdvancedQOSConfiguration=True
    ...    allowGatewayManagement=True
    ...    BGPEnabled=True
    ...    enableApplicationPerformanceManagement=True
    ...    encryptionManagementMode=MANAGED
    ...    allowTrustedForwardingClass=True
    ...    allowedForwardingClasses=@[A, B, C, D, E, F, G, H]
    ...    VNFManagementEnabled=True

Creating Organization
    Create Organization
    ...    name=${cats_org_name}
    ...    localAS=65000
    ...    cats_org_profile_name=${cats_org_profile_name}
	...    description=Performance Lab

Creating a MATRIX ADMIN User
    NuageVSD.Create User
    ...    userName=${cats_org_admin}
    ...    password=${cats_org_admin_pwd}
    ...    cats_org_name=${cats_org_name}

Creating a RONALD User
    NuageVSD.Create User
    ...    userName=ronald
    ...    password=devocht
    ...    cats_org_name=${cats_org_name}
	...    firstName=Ronald
    ...    lastName=DeVocht
    ...    email=ronaldnuage67@gmail.com
#	...    phoneNumber=+32473936887
	
Adding user to a group
    Add User to Group
    ...    cats_username=${cats_org_admin}
    ...    cats_org_name=${cats_org_name}
    ...    cats_group_name=Administrators

Login a User
    nuageusermgmt.Login User
    ...    cats_username=${cats_org_admin}
    ...    cats_password=${cats_org_admin_pwd}
    ...    cats_org_name=${cats_org_name}

Creating an L3 domain template
    Create L3 Domain Template
    ...    name=${cats_l3_template1_name}
    ...    cats_org_name=${cats_org_name}

Creating an L3 domain
    Create L3 Domain
    ...    name=${cats_l3_domain1_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_L3_domain_template_name=${cats_l3_template1_name}

Enter in the policy change mode for L3 domain1
    Begin Policy Changes
    ...    cats_org_name=${cats_org_name}
    ...    cats_L3_domain_name=${cats_l3_domain1_name}

Creating Ingress Security Policy
    Create Ingress Security Policy in L3 Domain
    ...    name=${cats_l3_domain1_ingr_sec_pol1_name}
    ...    active=True
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

Creating Ingress Security Policy Entry in L3 domain
    Create Ingress Security Policy Entry in L3 Domain
    ...    ACLTemplateName=${cats_l3_domain1_ingr_sec_pol1_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    action=FORWARD
    ...    cats_org_name=${cats_org_name}

Creating Egress Security Policy
    Create Egress Security Policy in L3 Domain
    ...    name=${cats_l3_domain1_egr_sec_pol1_name}
    ...    active=True
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

Creating Egress Security Policy Entry in L3 domain
    Create Egress Security Policy Entry in L3 Domain
    ...    ACLTemplateName=${cats_l3_domain1_egr_sec_pol1_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    action=FORWARD
    ...    cats_org_name=${cats_org_name}

Apply policy changes for L3 domain
    Apply Policy Changes
    ...    cats_org_name=${cats_org_name}
    ...    cats_L3_domain_name=${cats_l3_domain1_name}

Creating Zones
	Create Zone
    ...    name=${cats_zone1_name}
	...    description=VIRTUAL
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
	
	Create Zone
    ...    name=${cats_zone2_name}
	...    description=PHYSICAL
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}

Creating Subnets for Virtual NSGs
  Run Keyword If   ${NSGv01} == True    Creating a SUBNET NSGv01
  Run Keyword If   ${NSGv02} == True    Creating a SUBNET NSGv02
  Run Keyword If   ${NSGv03} == True    Creating a SUBNET NSGv03
  Run Keyword If   ${NSGv04} == True    Creating a SUBNET NSGv04
  Run Keyword If   ${NSGv05} == True    Creating a SUBNET NSGv05
  Run Keyword If   ${NSGv06} == True    Creating a SUBNET NSGv06
  Run Keyword If   ${NSGv07} == True    Creating a SUBNET NSGv07
  Run Keyword If   ${NSGv08} == True    Creating a SUBNET NSGv08
  Run Keyword If   ${NSGv09} == True    Creating a SUBNET NSGv09
  Run Keyword If   ${NSGv10} == True    Creating a SUBNET NSGv10
  Run Keyword If   ${NSGv11} == True    Creating a SUBNET NSGv11
  Run Keyword If   ${NSGv12} == True    Creating a SUBNET NSGv12
  Run Keyword If   ${NSGv13} == True    Creating a SUBNET NSGv13
  Run Keyword If   ${NSGv14} == True    Creating a SUBNET NSGv14
  Run Keyword If   ${NSGv15} == True    Creating a SUBNET NSGv15
  Run Keyword If   ${NSGv16} == True    Creating a SUBNET NSGv16
  Run Keyword If   ${NSGv17} == True    Creating a SUBNET NSGv17
  Run Keyword If   ${NSGv18} == True    Creating a SUBNET NSGv18
  Run Keyword If   ${NSGv19} == True    Creating a SUBNET NSGv19
  Run Keyword If   ${NSGv20} == True    Creating a SUBNET NSGv20
  Run Keyword If   ${NSGv21} == True    Creating a SUBNET NSGv21
  Run Keyword If   ${NSGv22} == True    Creating a SUBNET NSGv22
  Run Keyword If   ${NSGv23} == True    Creating a SUBNET NSGv23
  Run Keyword If   ${NSGv24} == True    Creating a SUBNET NSGv24
  Run Keyword If   ${NSGv25} == True    Creating a SUBNET NSGv25
  Run Keyword If   ${NSGv26} == True    Creating a SUBNET NSGv26
  Run Keyword If   ${NSGv27} == True    Creating a SUBNET NSGv27
  Run Keyword If   ${NSGv28} == True    Creating a SUBNET NSGv28
  Run Keyword If   ${NSGv29} == True    Creating a SUBNET NSGv29
  Run Keyword If   ${NSGv30} == True    Creating a SUBNET NSGv30
  Run Keyword If   ${NSGv31} == True    Creating a SUBNET NSGv31
  Run Keyword If   ${NSGv32} == True    Creating a SUBNET NSGv32
  Run Keyword If   ${NSGv33} == True    Creating a SUBNET NSGv33
  Run Keyword If   ${NSGv34} == True    Creating a SUBNET NSGv34
  Run Keyword If   ${NSGv35} == True    Creating a SUBNET NSGv35
  Run Keyword If   ${NSGv36} == True    Creating a SUBNET NSGv36
  Run Keyword If   ${NSGv37} == True    Creating a SUBNET NSGv37
  Run Keyword If   ${NSGv38} == True    Creating a SUBNET NSGv38
  Run Keyword If   ${NSGv39} == True    Creating a SUBNET NSGv39
  Run Keyword If   ${NSGv40} == True    Creating a SUBNET NSGv40
  Run Keyword If   ${NSGv41} == True    Creating a SUBNET NSGv41
  Run Keyword If   ${NSGv42} == True    Creating a SUBNET NSGv42
  Run Keyword If   ${NSGv43} == True    Creating a SUBNET NSGv43
  Run Keyword If   ${NSGv44} == True    Creating a SUBNET NSGv44
  Run Keyword If   ${NSGv45} == True    Creating a SUBNET NSGv45
  Run Keyword If   ${NSGv46} == True    Creating a SUBNET NSGv46
  Run Keyword If   ${NSGv47} == True    Creating a SUBNET NSGv47
  Run Keyword If   ${NSGv48} == True    Creating a SUBNET NSGv48
  Run Keyword If   ${NSGv49} == True    Creating a SUBNET NSGv49
  Run Keyword If   ${NSGv50} == True    Creating a SUBNET NSGv50
 
Creating Subnets for Physical NSGs
  Run Keyword If   ${NSG-C_1} == True       Creating a SUBNET NSG-C_1
  Run Keyword If   ${NSG-C_2} == True       Creating a SUBNET NSG-C_2
  Run Keyword If   ${NSG-C_3} == True       Creating a SUBNET NSG-C_3
  Run Keyword If   ${NSG-C_4} == True       Creating a SUBNET NSG-C_4
  Run Keyword If   ${NSG-E_1} == True       Creating a SUBNET NSG-E_1
  Run Keyword If   ${NSG-E_2} == True       Creating a SUBNET NSG-E_2
  Run Keyword If   ${NSG-E200_1} == True    Creating a SUBNET NSG-E200_1
  Run Keyword If   ${NSG-E200_2} == True    Creating a SUBNET NSG-E200_2
  Run Keyword If   ${NSG-E200_3} == True    Creating a SUBNET NSG-E200_3
  Run Keyword If   ${NSG-E200_4} == True    Creating a SUBNET NSG-E200_4
  Run Keyword If   ${NSG-E300_1} == True    Creating a SUBNET NSG-E300_1
  Run Keyword If   ${NSG-E300_2} == True    Creating a SUBNET NSG-E300_2
  Run Keyword If   ${NSG-X200_1} == True    Creating a SUBNET NSG-X200_1
  Run Keyword If   ${NSG-X200_2} == True    Creating a SUBNET NSG-X200_2
  Run Keyword If   ${NSG-X_1} == True       Creating a SUBNET NSG-X_1
  Run Keyword If   ${NSG-X_2} == True       Creating a SUBNET NSG-X_2
  Run Keyword If   ${NSG-X_3} == True       Creating a SUBNET NSG-X_3
  Run Keyword If   ${NSG-X_4} == True       Creating a SUBNET NSG-X_4
  Run Keyword If   ${NSG-E202_1} == True    Creating a SUBNET NSG-E202_1
  Run Keyword If   ${NSG-E202_2} == True    Creating a SUBNET NSG-E202_2
  Run Keyword If   ${NSG-E206_1} == True    Creating a SUBNET NSG-E206_1
  Run Keyword If   ${NSG-E206_2} == True    Creating a SUBNET NSG-E206_2
  Run Keyword If   ${NSG-E306_1} == True    Creating a SUBNET NSG-E306_1
  Run Keyword If   ${NSG-E306_2} == True    Creating a SUBNET NSG-E306_2
  
*** Keywords ***

#NSG-C
Creating a SUBNET NSG-C_1
    Create Subnet
    ...    name=${cats_subnetC1_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone2_name}
    ...    cats_address=${cats_subnetC1_network}
	
Creating a SUBNET NSG-C_2
    Create Subnet
    ...    name=${cats_subnetC2_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone2_name}
    ...    cats_address=${cats_subnetC2_network}
	
Creating a SUBNET NSG-C_3
    Create Subnet
    ...    name=${cats_subnetC3_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone2_name}
    ...    cats_address=${cats_subnetC3_network}
	
Creating a SUBNET NSG-C_4
    Create Subnet
    ...    name=${cats_subnetC4_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone2_name}
    ...    cats_address=${cats_subnetC4_network}
	
#NSG-E
Creating a SUBNET NSG-E_1
    Create Subnet
    ...    name=${cats_subnetE1_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone2_name}
    ...    cats_address=${cats_subnetE1_network}

Creating a SUBNET NSG-E_2
    Create Subnet
    ...    name=${cats_subnetE2_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone2_name}
    ...    cats_address=${cats_subnetE2_network}

#NSG-E200
Creating a SUBNET NSG-E200_1
    Create Subnet
    ...    name=${cats_subnetE2001_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone2_name}
    ...    cats_address=${cats_subnetE2001_network}

Creating a SUBNET NSG-E200_2
    Create Subnet
    ...    name=${cats_subnetE2002_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone2_name}
    ...    cats_address=${cats_subnetE2002_network}

Creating a SUBNET NSG-E200_3
    Create Subnet
    ...    name=${cats_subnetE2003_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone2_name}
    ...    cats_address=${cats_subnetE2003_network}

Creating a SUBNET NSG-E200_4
    Create Subnet
    ...    name=${cats_subnetE2004_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone2_name}
    ...    cats_address=${cats_subnetE2004_network}

#NSG-E300
Creating a SUBNET NSG-E300_1
    Create Subnet
    ...    name=${cats_subnetE3001_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone2_name}
    ...    cats_address=${cats_subnetE3001_network}

Creating a SUBNET NSG-E300_2
    Create Subnet
    ...    name=${cats_subnetE3002_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone2_name}
    ...    cats_address=${cats_subnetE3002_network}	
	
#NSG-X200
Creating a SUBNET NSG-X200_1
    Create Subnet
    ...    name=${cats_subnetX2001_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone2_name}
    ...    cats_address=${cats_subnetX2001_network}

Creating a SUBNET NSG-X200_2
    Create Subnet
    ...    name=${cats_subnetX2002_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone2_name}
    ...    cats_address=${cats_subnetX2002_network}	
	
#NSG-X
Creating a SUBNET NSG-X_1
    Create Subnet
    ...    name=${cats_subnetX1_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone2_name}
    ...    cats_address=${cats_subnetX1_network}
	
Creating a SUBNET NSG-X_2
    Create Subnet
    ...    name=${cats_subnetX2_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone2_name}
    ...    cats_address=${cats_subnetX2_network}
	
Creating a SUBNET NSG-X_3
    Create Subnet
    ...    name=${cats_subnetX3_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone2_name}
    ...    cats_address=${cats_subnetX3_network}
	
Creating a SUBNET NSG-X_4
    Create Subnet
    ...    name=${cats_subnetX4_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone2_name}
    ...    cats_address=${cats_subnetX4_network}

#NSG-E202
Creating a SUBNET NSG-E202_1
    Create Subnet
    ...    name=${cats_subnetE2021_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone2_name}
    ...    cats_address=${cats_subnetE2021_network}

Creating a SUBNET NSG-E202_2
    Create Subnet
    ...    name=${cats_subnetE2022_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone2_name}
    ...    cats_address=${cats_subnetE2022_network}

#NSG-E206
Creating a SUBNET NSG-E206_1
    Create Subnet
    ...    name=${cats_subnetE2061_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone2_name}
    ...    cats_address=${cats_subnetE2061_network}

Creating a SUBNET NSG-E206_2
    Create Subnet
    ...    name=${cats_subnetE2062_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone2_name}
    ...    cats_address=${cats_subnetE2062_network}

#NSG-E306
Creating a SUBNET NSG-E306_1
    Create Subnet
    ...    name=${cats_subnetE3061_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone2_name}
    ...    cats_address=${cats_subnetE3061_network}

Creating a SUBNET NSG-E306_2
    Create Subnet
    ...    name=${cats_subnetE3062_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone2_name}
    ...    cats_address=${cats_subnetE3062_network}	
	
	
#NSGv	
Creating a SUBNET NSGv01
    Create Subnet
    ...    name=${cats_subnet1_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet1_network}

Creating a SUBNET NSGv02
    Create Subnet
    ...    name=${cats_subnet2_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet2_network}
	
Creating a SUBNET NSGv03
    Create Subnet
    ...    name=${cats_subnet3_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet3_network}
	
Creating a SUBNET NSGv04
    Create Subnet
    ...    name=${cats_subnet4_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet4_network}
	
Creating a SUBNET NSGv05
    Create Subnet
    ...    name=${cats_subnet5_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet5_network}
	
Creating a SUBNET NSGv06
    Create Subnet
    ...    name=${cats_subnet6_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet6_network}
	
Creating a SUBNET NSGv07
    Create Subnet
    ...    name=${cats_subnet7_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet7_network}
	
Creating a SUBNET NSGv08
    Create Subnet
    ...    name=${cats_subnet8_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet8_network}
	
Creating a SUBNET NSGv09
    Create Subnet
    ...    name=${cats_subnet9_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet9_network}
	
Creating a SUBNET NSGv10
    Create Subnet
    ...    name=${cats_subnet10_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet10_network}
	
Creating a SUBNET NSGv11
    Create Subnet
    ...    name=${cats_subnet11_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet11_network}

Creating a SUBNET NSGv12
    Create Subnet
    ...    name=${cats_subnet12_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet12_network}
	
Creating a SUBNET NSGv13
    Create Subnet
    ...    name=${cats_subnet13_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet13_network}
	
Creating a SUBNET NSGv14
    Create Subnet
    ...    name=${cats_subnet14_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet14_network}
	
Creating a SUBNET NSGv15
    Create Subnet
    ...    name=${cats_subnet15_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet15_network}
	
Creating a SUBNET NSGv16
    Create Subnet
    ...    name=${cats_subnet16_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet16_network}
	
Creating a SUBNET NSGv17
    Create Subnet
    ...    name=${cats_subnet17_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet17_network}
	
Creating a SUBNET NSGv18
    Create Subnet
    ...    name=${cats_subnet18_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet18_network}
	
Creating a SUBNET NSGv19
    Create Subnet
    ...    name=${cats_subnet19_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet19_network}
	
Creating a SUBNET NSGv20
    Create Subnet
    ...    name=${cats_subnet20_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet20_network}

Creating a SUBNET NSGv21
    Create Subnet
    ...    name=${cats_subnet21_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet21_network}

Creating a SUBNET NSGv22
    Create Subnet
    ...    name=${cats_subnet22_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet22_network}
	
Creating a SUBNET NSGv23
    Create Subnet
    ...    name=${cats_subnet23_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet23_network}
	
Creating a SUBNET NSGv24
    Create Subnet
    ...    name=${cats_subnet24_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet24_network}
	
Creating a SUBNET NSGv25
    Create Subnet
    ...    name=${cats_subnet25_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet25_network}
	
Creating a SUBNET NSGv26
    Create Subnet
    ...    name=${cats_subnet26_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet26_network}
	
Creating a SUBNET NSGv27
    Create Subnet
    ...    name=${cats_subnet27_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet27_network}
	
Creating a SUBNET NSGv28
    Create Subnet
    ...    name=${cats_subnet28_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet28_network}
	
Creating a SUBNET NSGv29
    Create Subnet
    ...    name=${cats_subnet29_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet29_network}
	
Creating a SUBNET NSGv30
    Create Subnet
    ...    name=${cats_subnet30_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet30_network}

Creating a SUBNET NSGv31
    Create Subnet
    ...    name=${cats_subnet31_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet31_network}

Creating a SUBNET NSGv32
    Create Subnet
    ...    name=${cats_subnet32_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet32_network}
	
Creating a SUBNET NSGv33
    Create Subnet
    ...    name=${cats_subnet33_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet33_network}
	
Creating a SUBNET NSGv34
    Create Subnet
    ...    name=${cats_subnet34_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet34_network}
	
Creating a SUBNET NSGv35
    Create Subnet
    ...    name=${cats_subnet35_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet35_network}
	
Creating a SUBNET NSGv36
    Create Subnet
    ...    name=${cats_subnet36_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet36_network}
	
Creating a SUBNET NSGv37
    Create Subnet
    ...    name=${cats_subnet37_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet37_network}
	
Creating a SUBNET NSGv38
    Create Subnet
    ...    name=${cats_subnet38_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet38_network}
	
Creating a SUBNET NSGv39
    Create Subnet
    ...    name=${cats_subnet39_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet39_network}
	
Creating a SUBNET NSGv40
    Create Subnet
    ...    name=${cats_subnet40_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet40_network}

Creating a SUBNET NSGv41
    Create Subnet
    ...    name=${cats_subnet41_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet41_network}

Creating a SUBNET NSGv42
    Create Subnet
    ...    name=${cats_subnet42_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet42_network}
	
Creating a SUBNET NSGv43
    Create Subnet
    ...    name=${cats_subnet43_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet43_network}
	
Creating a SUBNET NSGv44
    Create Subnet
    ...    name=${cats_subnet44_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet44_network}
	
Creating a SUBNET NSGv45
    Create Subnet
    ...    name=${cats_subnet45_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet45_network}
	
Creating a SUBNET NSGv46
    Create Subnet
    ...    name=${cats_subnet46_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet46_network}
	
Creating a SUBNET NSGv47
    Create Subnet
    ...    name=${cats_subnet47_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet47_network}
	
Creating a SUBNET NSGv48
    Create Subnet
    ...    name=${cats_subnet48_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet48_network}
	
Creating a SUBNET NSGv49
    Create Subnet
    ...    name=${cats_subnet49_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet49_network}
		
Creating a SUBNET NSGv50
    Create Subnet
    ...    name=${cats_subnet50_name}
    ...    cats_org_name=${cats_org_name}
    ...    cats_domain_name=${cats_l3_domain1_name}
    ...    cats_zone_name=${cats_zone1_name}
    ...    cats_address=${cats_subnet50_network}