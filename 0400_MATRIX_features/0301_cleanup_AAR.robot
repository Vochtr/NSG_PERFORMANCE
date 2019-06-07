*** Settings ***

Resource                ../_VARS/vars.robot
Resource                cats_lib/resources/cats_common.robot
Resource          	    cats_lib/resources/aar.robot

Force Tags              usecase
Documentation           cleanup Application Aware Routing
Test Timeout            1 minute

*** comment ***

Assuming Enable VSS Flow and Event Collection is enabled. DPI is enabled in the template but not in the actual domain.

*** Test Cases ***

Login in VSD (Matrix Org)
    User Login    
	...    cats_username=${cats_org_admin}
    ...    cats_password=${cats_org_admin_pwd}
    ...    cats_org_name=${cats_org_name}

Disassociating APM Group from L3 Domain
# Assuming APM Group and L3 Doimain exist in Organization
    Disassociate APM Group from L3 Domain
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}
        ...    cats_apm_group_name=${cats_apm_group_name}	
		
# Disassociating NPM from L3 Domain
# Assuming NPM and L3 Doimain exist in Organization
    Disassociate NPM from L3 Domain
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}
        ...    cats_npm_name=${cats_NPM_name} 
		
Disassociating Performance Monitor from APM group
# Assuming APM Group and Performance Monitor exist in Organization
    Disassociate Performance Monitor from APM Group
        ...    cats_org_name=${cats_org_name}
        ...    cats_performance_monitor_name=${cats_PM_name} 
        ...    cats_apm_group_name=${cats_apm_group_name} 
		
Disassociating SSH Application from APM Group
# Assuming Application and APM exist in Organization
    Disassociate Application from APM Group
        ...    cats_org_name=${cats_org_name}
        ...    cats_application_name=${cats_app_name}
        ...    cats_apm_group_name=${cats_apm_group_name} 	
		
Disassociating Social Media Applications from APM Group
# Assuming Application and APM exist in Organization
    Disassociate Application from APM Group
        ...    cats_org_name=${cats_org_name}
        ...    cats_application_name=${cats_app1_name}
        ...    cats_apm_group_name=${cats_apm_group_name} 	
		
    Disassociate Application from APM Group
        ...    cats_org_name=${cats_org_name}
        ...    cats_application_name=${cats_app2_name}
        ...    cats_apm_group_name=${cats_apm_group_name} 	
		
    Disassociate Application from APM Group
        ...    cats_org_name=${cats_org_name}
        ...    cats_application_name=${cats_app3_name}
        ...    cats_apm_group_name=${cats_apm_group_name} 	
				
Deleting APM Group
# Assuming APM Group exists in Organization
    Delete APM Group
        ...    cats_org_name=${cats_org_name}
        ...    name=${cats_apm_group_name}

Disassociating Monitor Scope from NPM
# Assuming Monitor Scope exists in Network Performance Measurement
    Disassociate Monitor Scope from NPM
        ...    cats_org_name=${cats_org_name}
        ...    cats_npm_name=${cats_NPM_name}
        ...    name=${cats_monitor_scope_name1}
		
Disassociating Monitor Scope from SSH Application
# Assuming Monitor Scope exists in Application
    Disassociate Monitor Scope from Application
        ...    cats_org_name=${cats_org_name}
        ...    cats_application_name=${cats_app_name}
        ...    name=${cats_monitor_scope_name1}

Disassociating Monitor Scope from Social Media Applications
# Assuming Monitor Scope exists in Application
    Disassociate Monitor Scope from Application
        ...    cats_org_name=${cats_org_name}
        ...    cats_application_name=${cats_app1_name}
        ...    name=${cats_monitor_scope_name1}

	Disassociate Monitor Scope from Application
        ...    cats_org_name=${cats_org_name}
        ...    cats_application_name=${cats_app2_name}
        ...    name=${cats_monitor_scope_name1}

	Disassociate Monitor Scope from Application
        ...    cats_org_name=${cats_org_name}
        ...    cats_application_name=${cats_app3_name}
        ...    name=${cats_monitor_scope_name1}
	
Deleting SSH Application
# Assuming Application exists in Organization
    Delete Application
        ...    cats_org_name=${cats_org_name}
        ...    name=${cats_app_name}
	
Deleting Social Media Application
# Assuming Application exists in Organization
    Delete Application
        ...    cats_org_name=${cats_org_name}
        ...    name=${cats_app1_name}

	Delete Application
        ...    cats_org_name=${cats_org_name}
        ...    name=${cats_app2_name}

 	Delete Application
        ...    cats_org_name=${cats_org_name}
        ...    name=${cats_app3_name}
		
Deleting NPM
# Assuming Network Performance Measurement exists in Organization
    Delete NPM
        ...    cats_org_name=${cats_org_name}
        ...    name=${cats_NPM_name}
		
Deleting Performance Monitor from Organization
# Assuming Performance Monitor exists in Organization
    Delete Performance Monitor from Organization
        ...    cats_org_name=${cats_org_name}
        ...    name=${cats_PM_name}		

Disabling DPI at L3 Domain Template
# Assuming L3 Domain Template exists in Organization
    Disable DPI at L3 Domain Template
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_template_name=${cats_l3_template1_name}
		
Disabling DPI at Zone 1
# Assuming Zone1 exists in L3 Domain
    Disable DPI at Zone
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_zone_name=${cats_zone1_name} 

Disabling DPI at Zone 2
# Assuming Zone2 exists in L3 Domain
    Disable DPI at Zone
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_zone_name=${cats_zone2_name} 
		
Disabling DPI at Subnet NSG-VIRTUAL
# Assuming Subnets exists in L3 Domain
    Disable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnet1_name} 

    Disable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnet2_name} 

	Disable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnet3_name} 

	Disable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnet4_name} 

	Disable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnet5_name} 

Disabling DPI at Subnet NSG-C
# Assuming Subnets exists in L3 Domain
    Disable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetC1_name} 

	Disable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetC2_name} 

	Disable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetC3_name} 

	Disable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetC4_name} 
		
Disabling DPI at Subnet NSG-E
# Assuming Subnets exists in L3 Domain
    Disable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetE1_name} 

	Disable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetE2_name} 

Disabling DPI at Subnet NSG-E200
# Assuming Subnets exists in L3 Domain
    
	Disable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetE2001_name} 

	Disable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetE2002_name} 

	Disable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetE2003_name} 

	Disable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetE2004_name} 

Disabling DPI at Subnet NSG-E300
# Assuming Subnets exists in L3 Domain
    Disable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetE3001_name} 

	Disable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetE3002_name} 
		
Disabling DPI at Subnet NSG-X200
# Assuming Subnets exists in L3 Domain
    
	Disable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetX2001_name} 

	Disable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetX2002_name} 

Disabling DPI at Subnet NSG-X
# Assuming Subnets exists in L3 Domain
    Disable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetX1_name} 

	Disable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetX2_name} 

	Disable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetX3_name} 

	Disable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetX4_name} 

Disabling DPI at Subnet NSG-E202
# Assuming Subnets exists in L3 Domain
    
	Disable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetE2021_name} 

	Disable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetE2022_name} 
		
Disabling DPI at Subnet NSG-E206
# Assuming Subnets exists in L3 Domain
    
	Disable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetE2061_name} 

	Disable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetE2062_name} 
		
Disabling DPI at Subnet NSG-E306
# Assuming Subnets exists in L3 Domain
    
	Disable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetE3061_name} 

	Disable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetE3062_name} 	