*** Settings ***

Resource                ../_VARS/vars.robot
Resource                cats_lib/resources/cats_common.robot
Resource          	    cats_lib/resources/aar.robot

Force Tags              usecase
Documentation           configure Application Aware Routing
Test Timeout            1 minute

*** comment ***

Assuming Enable VSS Flow and Event Collection is enabled. DPI will be enabled in the template but not in the actual domain .

*** Test Cases ***
	
Login in VSD (Matrix Org)
    User Login    
	...	   cats_username=${cats_org_admin}
    ...    cats_password=${cats_org_admin_pwd}
    ...    cats_org_name=${cats_org_name}
	
##
## APPLICATION DISCOVERY (AD) - Enable DPI
##

Enabling DPI at L3 Domain Template
# Assuming L3 Domain Template exists in Organization
    Enable DPI at L3 Domain Template
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_template_name=${cats_l3_template1_name} 

Enabling DPI at Zone 1
# Assuming Zone1 exists in L3 Domain
    Enable DPI at Zone
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_zone_name=${cats_zone1_name} 

Enabling DPI at Zone 2
# Assuming Zone2 exists in L3 Domain
    Enable DPI at Zone
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_zone_name=${cats_zone2_name} 
		
Enabling DPI at Subnet NSG-VIRTUAL
# Assuming Subnets exists in L3 Domain
    Enable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnet1_name} 

    Enable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnet2_name} 

	Enable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnet3_name} 

	Enable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnet4_name} 

	Enable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnet5_name} 

Enabling DPI at Subnet NSG-C
# Assuming Subnets exists in L3 Domain
    Enable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetC1_name} 

	Enable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetC2_name} 

	Enable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetC3_name} 

	Enable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetC4_name} 
		
Enabling DPI at Subnet NSG-E
# Assuming Subnets exists in L3 Domain
    Enable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetE1_name} 

	Enable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetE2_name} 

Enabling DPI at Subnet NSG-E200
# Assuming Subnets exists in L3 Domain
    
	Enable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetE2001_name} 

	Enable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetE2002_name} 

	Enable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetE2003_name} 

	Enable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetE2004_name} 

Enabling DPI at Subnet NSG-E300
# Assuming Subnets exists in L3 Domain
    Enable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetE3001_name} 

	Enable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetE3002_name} 
		
Enabling DPI at Subnet NSG-X200
# Assuming Subnets exists in L3 Domain
    
	Enable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetX2001_name} 

	Enable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetX2002_name} 

Enabling DPI at Subnet NSG-X
# Assuming Subnets exists in L3 Domain
    Enable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetX1_name} 

	Enable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetX2_name} 

	Enable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetX3_name} 

	Enable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetX4_name} 

Enabling DPI at Subnet NSG-E202
# Assuming Subnets exists in L3 Domain
    
	Enable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetE2021_name} 

	Enable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetE2022_name} 
		
Enabling DPI at Subnet NSG-E206
# Assuming Subnets exists in L3 Domain
    
	Enable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetE2061_name} 

	Enable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetE2062_name} 
		
Enabling DPI at Subnet NSG-E306
# Assuming Subnets exists in L3 Domain
    
	Enable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetE3061_name} 

	Enable DPI at Subnet
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}  
        ...    cats_subnet_name=${cats_subnetE3062_name} 
		

##
## NETWORK PERFORMANCE MEASUREMENT (NPM) - Define Performance Monitor
##

Creating Performance Monitor in Organization
# Assuming Organization exists
    Create Performance Monitor in Organization
        ...    cats_org_name=${cats_org_name}
        ...    name=${cats_PM_name}
        ...    interval=10
        ...    numberOfPackets=1
        ...    payloadSize=1000
        ...    serviceClass=H
		
Creating NPM
# Assuming Performance Monitor exists in Organization
    Create NPM
        ...    cats_org_name=${cats_org_name}
        ...    cats_performance_monitor_name=${cats_PM_name}
        ...    name=${cats_NPM_name}
		
Associating Monitor Scope to NPM
# Assuming Network Performance Measurement exists in Organization
    Associate Monitor Scope to NPM
        ...    cats_org_name=${cats_org_name}
        ...    cats_npm_name=${cats_NPM_name}
        ...    name=${cats_monitor_scope_name1}
        ...    allowAllSourceNSGs=True
        ...    allowAllDestinationNSGs=True	
		

##
## APPLICATION - Define Applications
##

Creating SSH Application
# Assuming Organization exists
    Create Application
        ...    cats_org_name=${cats_org_name}
        ...    name=${cats_app_name}
        ...    preClassificationPath=DEFAULT
        ...    protocol=TCP
        ...    sourcePort=${cats_stcv_txport}
        ...    etherType=0x0800
        ...    enablePPS=False
        ...    DSCP=*
        ...    oneWayDelay=100

Creating Social Media Applications
# Assuming Organization exists
	Create Application
        ...    cats_org_name=${cats_org_name}
        ...    name=${cats_app1_name}
        ...    preClassificationPath=DEFAULT
        ...    protocol=TCP
        ...    etherType=0x0800
        ...    enablePPS=False
        ...    DSCP=*
        ...    oneWayDelay=100
	
	Create Application
        ...    cats_org_name=${cats_org_name}
        ...    name=${cats_app2_name}
        ...    preClassificationPath=DEFAULT
        ...    protocol=TCP
        ...    etherType=0x0800
        ...    enablePPS=False
        ...    DSCP=*
        ...    oneWayDelay=100
	
	Create Application
        ...    cats_org_name=${cats_org_name}
        ...    name=${cats_app3_name}
        ...    preClassificationPath=DEFAULT
        ...    protocol=TCP
        ...    etherType=0x0800
        ...    enablePPS=False
        ...    DSCP=*
        ...    oneWayDelay=100

Retrieving Application Signatures List
# Assuming Organization and Application Signatures exist
    @{obj_list}=   Get List of Application Signatures
                   ...    cats_org_name=${cats_org_name}

Associating Application Signatures to Social Media Application
# Assuming Application and Application Signature exist in Organization
    Associate Application Signature to Application
    ...    cats_org_name=${cats_org_name}
    ...    cats_application_name=${cats_app1_name}
    ...    cats_application_signature_name=Skype
	
    Associate Application Signature to Application
    ...    cats_org_name=${cats_org_name}
    ...    cats_application_name=${cats_app2_name}
    ...    cats_application_signature_name=Facebook
    
	Associate Application Signature to Application
    ...    cats_org_name=${cats_org_name}
    ...    cats_application_name=${cats_app3_name}
    ...    cats_application_signature_name=Google
				   
##
## APPLICATION PERFORMANCE MANAGEMENT (APM) - create/enable APM (group) 
##
	
Creating APM
# Assuming Organization exists
    Create APM Group
        ...    cats_org_name=${cats_org_name}
        ...    name=${cats_apm_group_name}	
		
Enabling SSH Application Performance Management
# Assuming Application exists in Organization
    Enable Application Performance Management
        ...    cats_org_name=${cats_org_name}
        ...    cats_application_name=${cats_app_name}
        ...    oneWayLoss=5.5
        ...    oneWayDelay=100
        ...    oneWayJitter=15
        ...    performanceMonitorType=FIRST_PACKET_AND_CONTINUOUS
        ...    enablePPS=True
        ...    optimizePathSelection=LATENCY

Enabling Social Media Applications Performance Management
# Assuming Application exists in Organization
    Enable Application Performance Management
        ...    cats_org_name=${cats_org_name}
        ...    cats_application_name=${cats_app1_name}
        ...    oneWayLoss=5.5
        ...    oneWayDelay=100
        ...    oneWayJitter=15
        ...    performanceMonitorType=FIRST_PACKET_AND_CONTINUOUS
        ...    enablePPS=True
        ...    optimizePathSelection=LATENCY
	Enable Application Performance Management
        ...    cats_org_name=${cats_org_name}
        ...    cats_application_name=${cats_app2_name}
        ...    oneWayLoss=5.5
        ...    oneWayDelay=100
        ...    oneWayJitter=15
        ...    performanceMonitorType=FIRST_PACKET_AND_CONTINUOUS
        ...    enablePPS=True
        ...    optimizePathSelection=LATENCY
    Enable Application Performance Management
        ...    cats_org_name=${cats_org_name}
        ...    cats_application_name=${cats_app3_name}
        ...    oneWayLoss=5.5
        ...    oneWayDelay=100
        ...    oneWayJitter=15
        ...    performanceMonitorType=FIRST_PACKET_AND_CONTINUOUS
        ...    enablePPS=True
        ...    optimizePathSelection=LATENCY
		
Associating Monitor Scope to SSH Application
# Assuming Application exists in Organization
    Associate Monitor Scope to Application
        ...    cats_org_name=${cats_org_name}
        ...    cats_application_name=${cats_app_name}
        ...    name=${cats_monitor_scope_name1}
        ...    allowAllSourceNSGs=True
        ...    allowAllDestinationNSGs=True

Associating Monitor Scope to Social Media Applications
    Associate Monitor Scope to Application
        ...    cats_org_name=${cats_org_name}
        ...    cats_application_name=${cats_app1_name}
        ...    name=${cats_monitor_scope_name1}
        ...    allowAllSourceNSGs=True
        ...    allowAllDestinationNSGs=True
	
	Associate Monitor Scope to Application
        ...    cats_org_name=${cats_org_name}
        ...    cats_application_name=${cats_app2_name}
        ...    name=${cats_monitor_scope_name1}
        ...    allowAllSourceNSGs=True
        ...    allowAllDestinationNSGs=True
	
	Associate Monitor Scope to Application
        ...    cats_org_name=${cats_org_name}
        ...    cats_application_name=${cats_app3_name}
        ...    name=${cats_monitor_scope_name1}
        ...    allowAllSourceNSGs=True
        ...    allowAllDestinationNSGs=True

Associating Performance Monitor to APM group
# Assuming APM Group and Performance Monitor exist in Organization
    Associate Performance Monitor to APM Group
        ...    cats_org_name=${cats_org_name}
        ...    cats_performance_monitor_name=${cats_PM_name}
        ...    cats_apm_group_name=${cats_apm_group_name}
		
Associating SSH Application to APM Group
# Assuming Application and APM exist in Organization
    Associate Application to APM Group
        ...    cats_org_name=${cats_org_name}
        ...    cats_application_name=${cats_app_name}
        ...    cats_apm_group_name=${cats_apm_group_name}
        ...    priority=100
		
Associating Social Media Applications to APM Group
# Assuming Application and APM exist in Organization
    Associate Application to APM Group
        ...    cats_org_name=${cats_org_name}
        ...    cats_application_name=${cats_app1_name}
        ...    cats_apm_group_name=${cats_apm_group_name}
        ...    priority=110
		
	Associate Application to APM Group
        ...    cats_org_name=${cats_org_name}
        ...    cats_application_name=${cats_app2_name}
        ...    cats_apm_group_name=${cats_apm_group_name}
        ...    priority=120
		
	Associate Application to APM Group
        ...    cats_org_name=${cats_org_name}
        ...    cats_application_name=${cats_app3_name}
        ...    cats_apm_group_name=${cats_apm_group_name}
        ...    priority=130

Associating APM Group to L3 Domain
# Assuming APM Group and L3 Doimain exist in Organization
    Associate APM Group to L3 Domain
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}
        ...    cats_apm_group_name=${cats_apm_group_name}
        ...    priority=1

Associating NPM to L3 Domain
# Assuming NPM and L3 Doimain exist in Organization
    Associate NPM to L3 Domain
        ...    cats_org_name=${cats_org_name}
        ...    cats_domain_name=${cats_l3_domain1_name}
        ...    cats_npm_name=${cats_NPM_name}
        ...    priority=5