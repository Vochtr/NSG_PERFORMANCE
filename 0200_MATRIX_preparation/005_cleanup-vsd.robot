*** Settings ***

Force Tags		  matrix
Documentation	  Test case for forced Matrix Organization cleanup
Test Timeout	  3 minutes

Resource          ../_VARS/vars.robot
Resource          cats_lib/resources/cats_common.robot

*** Test Cases *** 
   
CSPROOT Logs In
    Csproot user is logged in VSD

Deleting Matrix Organization in VSD
    Delete Organization in VSD    
    ...    cats_org_name=${cats_org_name}