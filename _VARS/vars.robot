*** Settings ***
Library  DateTime								# THA4 541

*** Variables ***

##############################
#     OVERLAY PARAMETERS 
##############################
${test_prefix}                                  MATRIX
${cats_org_profile_name}                        ${test_prefix}_ORG_PROF
${cats_org_name}                                ${test_prefix}_ORG
${cats_org_admin}                               ${test_prefix}_ADMIN
${cats_org_admin_pwd}                           CATS

${cats_infra_gw_profile_name}                   ${test_prefix}_IGW_PROF
${cats_infra_access_profile_name}               ${test_prefix}_IA_PROF

${cats_l3_template1_name}                       ${test_prefix}_L3_TEMPL1
${cats_l3_domain1_name}                         ${test_prefix}_L3_DOMAIN1
${cats_l3_domain1_ingr_sec_pol1_name}           ${test_prefix}_INGR_SEC_POL1
${cats_l3_domain1_egr_sec_pol1_name}            ${test_prefix}_EGR_SEC_POL1

${cats_zone1_name}                              ${test_prefix}_ZONE1
${cats_zone2_name}                              ${test_prefix}_ZONE2

${cats_NSG-C-1_name}                            NSG-C_1
${cats_NSG-C-2_name}                            NSG-C_2
${cats_NSG-C-3_name}                            NSG-C_3
${cats_NSG-C-4_name}                            NSG-C_4
${cats_NSG-E-1_name}                            NSG-E_1
${cats_NSG-E-2_name}                            NSG-E_2
${cats_NSG-E200-1_name}                         NSG-E200_1
${cats_NSG-E200-2_name}                         NSG-E200_2
${cats_NSG-E200-3_name}                         NSG-E200_3
${cats_NSG-E200-4_name}                         NSG-E200_4
${cats_NSG-E300-1_name}                         NSG-E300_1
${cats_NSG-E300-2_name}                         NSG-E300_2
${cats_NSG-X200-1_name}                         NSG-X200_1
${cats_NSG-X200-2_name}                         NSG-X200_2
${cats_NSG-X-1_name}                            NSG-X_1
${cats_NSG-X-2_name}                            NSG-X_2
${cats_NSG-X-3_name}                            NSG-X_3
${cats_NSG-X-4_name}                            NSG-X_4
${cats_NSG-E202-1_name}                         NSG-E202_1
${cats_NSG-E202-2_name}                         NSG-E202_2
${cats_NSG-E206-1_name}                         NSG-E206_1
${cats_NSG-E206-2_name}                         NSG-E206_2
${cats_NSG-E306-1_name}                         NSG-E306_1
${cats_NSG-E306-2_name}                         NSG-E306_2

${cats_NSGv01_name}                             ${test_prefix}_NSGv01
${cats_NSGv02_name}                             ${test_prefix}_NSGv02
${cats_NSGv03_name}                             ${test_prefix}_NSGv03
${cats_NSGv04_name}                             ${test_prefix}_NSGv04
${cats_NSGv05_name}                             ${test_prefix}_NSGv05
${cats_NSGv06_name}                             ${test_prefix}_NSGv06
${cats_NSGv07_name}                             ${test_prefix}_NSGv07
${cats_NSGv08_name}                             ${test_prefix}_NSGv08
${cats_NSGv09_name}                             ${test_prefix}_NSGv09
${cats_NSGv10_name}                             ${test_prefix}_NSGv10

${cats_subnetC1_name}                           SUBNET_C-1
${cats_subnetC2_name}                           SUBNET_C-2
${cats_subnetC3_name}                           SUBNET_C-3
${cats_subnetC4_name}                           SUBNET_C-4
${cats_subnetE1_name}                           SUBNET_E-1
${cats_subnetE2_name}                           SUBNET_E-2
${cats_subnetE2001_name}                        SUBNET_E200-1
${cats_subnetE2002_name}                        SUBNET_E200-2
${cats_subnetE2003_name}                        SUBNET_E200-3
${cats_subnetE2004_name}                        SUBNET_E200-4
${cats_subnetE3001_name}                        SUBNET_E300-1
${cats_subnetE3002_name}                        SUBNET_E300-2
${cats_subnetX2001_name}                        SUBNET_X200-1
${cats_subnetX2002_name}                        SUBNET_X200-2
${cats_subnetX1_name}                           SUBNET_X-1
${cats_subnetX2_name}                           SUBNET_X-2
${cats_subnetX3_name}                           SUBNET_X-3
${cats_subnetX4_name}                           SUBNET_X-4
${cats_subnetE2021_name}                        SUBNET_E202-1
${cats_subnetE2022_name}                        SUBNET_E202-2
${cats_subnetE2061_name}                        SUBNET_E206-1
${cats_subnetE2062_name}                        SUBNET_E206-2
${cats_subnetE3061_name}                        SUBNET_E306-1
${cats_subnetE3062_name}                        SUBNET_E306-2

${cats_subnetRGE200_name}                       SUBNET_RGE200
${cats_subnetRGE300_name}                       SUBNET_RGE300
${cats_subnetRGX200_name}                       SUBNET_RGX200
${cats_subnetRGX_name}                          SUBNET_RGX

${cats_subnet1_name}                            SUBNET_01
${cats_subnet2_name}                            SUBNET_02
${cats_subnet3_name}                            SUBNET_03
${cats_subnet4_name}                            SUBNET_04
${cats_subnet5_name}                            SUBNET_05
${cats_subnet6_name}                            SUBNET_06
${cats_subnet7_name}                            SUBNET_07
${cats_subnet8_name}                            SUBNET_08
${cats_subnet9_name}                            SUBNET_09
${cats_subnet10_name}                           SUBNET_10
${cats_subnet11_name}                           SUBNET_11
${cats_subnet12_name}                           SUBNET_12
${cats_subnet13_name}                           SUBNET_13
${cats_subnet14_name}                           SUBNET_14
${cats_subnet15_name}                           SUBNET_15
${cats_subnet16_name}                           SUBNET_16
${cats_subnet17_name}                           SUBNET_17
${cats_subnet18_name}                           SUBNET_18
${cats_subnet19_name}                           SUBNET_19
${cats_subnet20_name}                           SUBNET_20
${cats_subnet21_name}                           SUBNET_21
${cats_subnet22_name}                           SUBNET_22
${cats_subnet23_name}                           SUBNET_23
${cats_subnet24_name}                           SUBNET_24
${cats_subnet25_name}                           SUBNET_25
${cats_subnet26_name}                           SUBNET_26
${cats_subnet27_name}                           SUBNET_27
${cats_subnet28_name}                           SUBNET_28
${cats_subnet29_name}                           SUBNET_29
${cats_subnet30_name}                           SUBNET_30
${cats_subnet31_name}                           SUBNET_31
${cats_subnet32_name}                           SUBNET_32
${cats_subnet33_name}                           SUBNET_33
${cats_subnet34_name}                           SUBNET_34
${cats_subnet35_name}                           SUBNET_35
${cats_subnet36_name}                           SUBNET_36
${cats_subnet37_name}                           SUBNET_37
${cats_subnet38_name}                           SUBNET_38
${cats_subnet39_name}                           SUBNET_39
${cats_subnet40_name}                           SUBNET_40
${cats_subnet41_name}                           SUBNET_41
${cats_subnet42_name}                           SUBNET_42
${cats_subnet43_name}                           SUBNET_43
${cats_subnet44_name}                           SUBNET_44
${cats_subnet45_name}                           SUBNET_45
${cats_subnet46_name}                           SUBNET_46
${cats_subnet47_name}                           SUBNET_47
${cats_subnet48_name}                           SUBNET_48
${cats_subnet49_name}                           SUBNET_49
${cats_subnet50_name}                           SUBNET_50

${cats_subnetC1_network}                        10.10.100.0/24
${cats_subnetC2_network}                        10.10.101.0/24
${cats_subnetC3_network}                        10.10.118.0/24
${cats_subnetC4_network}                        10.10.119.0/24
${cats_subnetE1_network}                        10.10.102.0/24
${cats_subnetE2_network}                        10.10.103.0/24
${cats_subnetE2001_network}                     10.10.104.0/24
${cats_subnetE2002_network}                     10.10.105.0/24
${cats_subnetE2003_network}                     10.10.120.0/24
${cats_subnetE2004_network}                     10.10.121.0/24
${cats_subnetE3001_network}                     10.10.106.0/24
${cats_subnetE3002_network}                     10.10.107.0/24
${cats_subnetX2001_network}                     10.10.108.0/24
${cats_subnetX2002_network}                     10.10.109.0/24
${cats_subnetX1_network}                        10.10.110.0/24
${cats_subnetX2_network}                        10.10.111.0/24
${cats_subnetX3_network}                        10.10.112.0/24
${cats_subnetX4_network}                        10.10.113.0/24
${cats_subnetE2021_network}                     10.10.122.0/24
${cats_subnetE2022_network}                     10.10.123.0/24
${cats_subnetE2061_network}                     10.10.114.0/24
${cats_subnetE2062_network}                     10.10.115.0/24
${cats_subnetE3061_network}                     10.10.116.0/24
${cats_subnetE3062_network}                     10.10.117.0/24

${cats_subnetRGE200_network}                    10.10.130.0/24
${cats_subnetRGE300_network}                    10.10.131.0/24
${cats_subnetRGX200_network}                    10.10.132.0/24
${cats_subnetRGX_network}                       10.10.133.0/24

${cats_subnetRGE200_gateway}                    10.10.130.1
${cats_subnetRGE300_gateway}                    10.10.131.1
${cats_subnetRGX200_gateway}                    10.10.132.1
${cats_subnetRGX_gateway}                       10.10.133.1

${cats_subnet1_network}                         10.10.1.0/24
${cats_subnet2_network}                         10.10.2.0/24
${cats_subnet3_network}                         10.10.3.0/24
${cats_subnet4_network}                         10.10.4.0/24
${cats_subnet5_network}                         10.10.5.0/24
${cats_subnet6_network}                         10.10.6.0/24
${cats_subnet7_network}                         10.10.7.0/24
${cats_subnet8_network}                         10.10.8.0/24
${cats_subnet9_network}                         10.10.9.0/24
${cats_subnet10_network}                        10.10.10.0/24
${cats_subnet11_network}                        10.10.11.0/24
${cats_subnet12_network}                        10.10.12.0/24
${cats_subnet13_network}                        10.10.13.0/24
${cats_subnet14_network}                        10.10.14.0/24
${cats_subnet15_network}                        10.10.15.0/24
${cats_subnet16_network}                        10.10.16.0/24
${cats_subnet17_network}                        10.10.17.0/24
${cats_subnet18_network}                        10.10.18.0/24
${cats_subnet19_network}                        10.10.19.0/24
${cats_subnet20_network}                        10.10.20.0/24
${cats_subnet21_network}                        10.10.21.0/24
${cats_subnet22_network}                        10.10.22.0/24
${cats_subnet23_network}                        10.10.23.0/24
${cats_subnet24_network}                        10.10.24.0/24
${cats_subnet25_network}                        10.10.25.0/24
${cats_subnet26_network}                        10.10.26.0/24
${cats_subnet27_network}                        10.10.27.0/24
${cats_subnet28_network}                        10.10.28.0/24
${cats_subnet29_network}                        10.10.29.0/24
${cats_subnet30_network}                        10.10.30.0/24
${cats_subnet31_network}                        10.10.31.0/24
${cats_subnet32_network}                        10.10.32.0/24
${cats_subnet33_network}                        10.10.33.0/24
${cats_subnet34_network}                        10.10.34.0/24
${cats_subnet35_network}                        10.10.35.0/24
${cats_subnet36_network}                        10.10.36.0/24
${cats_subnet37_network}                        10.10.37.0/24
${cats_subnet38_network}                        10.10.38.0/24
${cats_subnet39_network}                        10.10.39.0/24
${cats_subnet40_network}                        10.10.40.0/24
${cats_subnet41_network}                        10.10.41.0/24
${cats_subnet42_network}                        10.10.42.0/24
${cats_subnet43_network}                        10.10.43.0/24
${cats_subnet44_network}                        10.10.44.0/24
${cats_subnet45_network}                        10.10.45.0/24
${cats_subnet46_network}                        10.10.46.0/24
${cats_subnet47_network}                        10.10.47.0/24
${cats_subnet48_network}                        10.10.48.0/24
${cats_subnet49_network}                        10.10.49.0/24
${cats_subnet50_network}                        10.10.50.0/24

${cats_management_ip1}  		 				10.169.46.51
${cats_management_ip2}						    10.169.46.52
${cats_management_ip3}						    10.169.46.53
${cats_management_ip4}						    10.169.46.54
${cats_management_ip5}						    10.169.46.55
${cats_management_ip6}						    10.169.46.56
${cats_management_ip7}						    10.169.46.57
${cats_management_ip8}						    10.169.46.58
${cats_management_ip9}						    10.169.46.59
${cats_management_ip10}						    10.169.46.60
${cats_management_ip11}						    10.169.46.61
${cats_management_ip12}						    10.169.46.62
${cats_management_ip13}						    10.169.46.63
${cats_management_ip14}						    10.169.46.64
${cats_management_ip15}						    10.169.46.65
${cats_management_ip16}						    10.169.46.66
${cats_management_ip17}						    10.169.46.67
${cats_management_ip18}						    10.169.46.68
${cats_management_ip19}						    10.169.46.69
${cats_management_ip20}						    10.169.46.70
${cats_management_ip21}						    10.169.46.71
${cats_management_ip22}						    10.169.46.72
${cats_management_ip23}						    10.169.46.73
${cats_management_ip24}						    10.169.46.74
${cats_management_ip25}						    10.169.46.75
${cats_management_ip26}						    10.169.46.76
${cats_management_ip27}						    10.169.46.77
${cats_management_ip28}						    10.169.46.78
${cats_management_ip29}						    10.169.46.79
${cats_management_ip30}						    10.169.46.80
${cats_management_ip31}						    10.169.46.81
${cats_management_ip32}						    10.169.46.82
${cats_management_ip33}						    10.169.46.83
${cats_management_ip34}						    10.169.46.84
${cats_management_ip35}						    10.169.46.85
${cats_management_ip36}						    10.169.46.86
${cats_management_ip37}						    10.169.46.87
${cats_management_ip38}						    10.169.46.88
${cats_management_ip39}						    10.169.46.89
${cats_management_ip40}						    10.169.46.90
${cats_management_ip41}						    10.169.46.91
${cats_management_ip42}						    10.169.46.92
${cats_management_ip43}						    10.169.46.93
${cats_management_ip44}						    10.169.46.94
${cats_management_ip45}						    10.169.46.95
${cats_management_ip46}						    10.169.46.96 
${cats_management_ip47}						    10.169.46.97
${cats_management_ip48}						    10.169.46.98
${cats_management_ip49}						    10.169.46.99
${cats_management_ip50}						    10.169.46.100

${cats_management_gw}						    10.169.46.1

${cats_data_ip_NSG-C-1}						    10.10.100.2
${cats_data_gw_NSG-C-1} 					    10.10.100.1 
${cats_data_ip_NSG-C-2}						    10.10.101.2
${cats_data_gw_NSG-C-2} 					    10.10.101.1 

${cats_data_ip_NSG-C-3}						    10.10.118.2
${cats_data_gw_NSG-C-3} 					    10.10.118.1 
${cats_data_ip_NSG-C-4}						    10.10.119.2
${cats_data_gw_NSG-C-4} 					    10.10.119.1 

${cats_data_ip_NSG-E-1}						    10.10.102.2
${cats_data_gw_NSG-E-1} 					    10.10.102.1 
${cats_data_ip_NSG-E-2}						    10.10.103.2
${cats_data_gw_NSG-E-2} 					    10.10.103.1 

${cats_data_ip_NSG-E200-1}					    10.10.104.2
${cats_data_gw_NSG-E200-1} 					    10.10.104.1 
${cats_data_ip_NSG-E200-2}					    10.10.105.2
${cats_data_gw_NSG-E200-2} 					    10.10.105.1 

${cats_data_ip_NSG-E200-3}					    10.10.120.2
${cats_data_gw_NSG-E200-3} 					    10.10.120.1 
${cats_data_ip_NSG-E200-4}					    10.10.121.2
${cats_data_gw_NSG-E200-4} 					    10.10.121.1 

${cats_data_ip_NSG-E300-1}					    10.10.106.2
${cats_data_gw_NSG-E300-1} 					    10.10.106.1 
${cats_data_ip_NSG-E300-2}					    10.10.107.2
${cats_data_gw_NSG-E300-2} 					    10.10.107.1 

${cats_data_ip_NSG-X200-1}					    10.10.108.2
${cats_data_gw_NSG-X200-1} 					    10.10.108.1 
${cats_data_ip_NSG-X200-2}					    10.10.109.2
${cats_data_gw_NSG-X200-2} 					    10.10.109.1 

${cats_data_ip_NSG-X-1}						    10.10.110.2
${cats_data_gw_NSG-X-1} 					    10.10.110.1 
${cats_data_ip_NSG-X-2}						    10.10.111.2
${cats_data_gw_NSG-X-2} 					    10.10.111.1 
${cats_data_ip_NSG-X-3}						    10.10.112.2
${cats_data_gw_NSG-X-3} 					    10.10.112.1 
${cats_data_ip_NSG-X-4}						    10.10.113.2
${cats_data_gw_NSG-X-4} 					    10.10.113.1 

${cats_data_ip_NSG-E202-1}					    10.10.122.2
${cats_data_gw_NSG-E202-1} 					    10.10.122.1 
${cats_data_ip_NSG-E202-2}					    10.10.123.2
${cats_data_gw_NSG-E202-2} 					    10.10.123.1 

${cats_data_ip_NSG-E206-1}					    10.10.114.2
${cats_data_gw_NSG-E206-1} 					    10.10.114.1 
${cats_data_ip_NSG-E206-2}					    10.10.115.2
${cats_data_gw_NSG-E206-2} 					    10.10.115.1 

${cats_data_ip_NSG-E306-1}					    10.10.116.2
${cats_data_gw_NSG-E306-1} 					    10.10.116.1 
${cats_data_ip_NSG-E306-2}					    10.10.117.2
${cats_data_gw_NSG-E306-2} 					    10.10.117.1 

${cats_data_ip1}						        10.10.1.2
${cats_data_ip2}						        10.10.2.2
${cats_data_ip3}						        10.10.3.2
${cats_data_ip4}    						    10.10.4.2
${cats_data_ip5}	    					    10.10.5.2
${cats_data_ip6}		    				    10.10.6.2
${cats_data_ip7}			    			    10.10.7.2
${cats_data_ip8}				    		    10.10.8.2
${cats_data_ip9}					    	    10.10.9.2
${cats_data_ip10}						        10.10.10.2
${cats_data_ip11}						        10.10.11.2
${cats_data_ip12}						        10.10.12.2
${cats_data_ip13}						        10.10.13.2
${cats_data_ip14}    						    10.10.14.2
${cats_data_ip15}	    					    10.10.15.2
${cats_data_ip16}		    				    10.10.16.2
${cats_data_ip17}			    			    10.10.17.2
${cats_data_ip18}				    		    10.10.18.2
${cats_data_ip19}					    	    10.10.19.2
${cats_data_ip20}						        10.10.20.2
${cats_data_ip21}						        10.10.21.2
${cats_data_ip22}						        10.10.22.2
${cats_data_ip23}						        10.10.23.2
${cats_data_ip24}    						    10.10.24.2
${cats_data_ip25}	    					    10.10.25.2
${cats_data_ip26}		    				    10.10.26.2
${cats_data_ip27}			    			    10.10.27.2
${cats_data_ip28}				    		    10.10.28.2
${cats_data_ip29}					    	    10.10.29.2
${cats_data_ip30}						        10.10.30.2
${cats_data_ip31}						        10.10.31.2
${cats_data_ip32}						        10.10.32.2
${cats_data_ip33}						        10.10.33.2
${cats_data_ip34}    						    10.10.34.2
${cats_data_ip35}	    					    10.10.35.2
${cats_data_ip36}		    				    10.10.36.2
${cats_data_ip37}			    			    10.10.37.2
${cats_data_ip38}				    		    10.10.38.2
${cats_data_ip39}					    	    10.10.39.2
${cats_data_ip40}						        10.10.40.2
${cats_data_ip41}						        10.10.41.2
${cats_data_ip42}						        10.10.42.2
${cats_data_ip43}						        10.10.43.2
${cats_data_ip44}    						    10.10.44.2
${cats_data_ip45}	    					    10.10.45.2
${cats_data_ip46}		    				    10.10.46.2
${cats_data_ip47}			    			    10.10.47.2
${cats_data_ip48}				    		    10.10.48.2
${cats_data_ip49}					    	    10.10.49.2
${cats_data_ip50}						        10.10.50.2
    
${cats_data_gw1}	    					    10.10.1.1
${cats_data_gw2}		    				    10.10.2.1
${cats_data_gw3}			    			    10.10.3.1
${cats_data_gw4}				    		    10.10.4.1
${cats_data_gw5}					    	    10.10.5.1
${cats_data_gw6}						        10.10.6.1
${cats_data_gw7}	    					    10.10.7.1
${cats_data_gw8}		    				    10.10.8.1
${cats_data_gw9}			    			    10.10.9.1
${cats_data_gw10}	    					    10.10.10.1
${cats_data_gw11}	    					    10.10.11.1
${cats_data_gw12}		    				    10.10.12.1
${cats_data_gw13}			    			    10.10.13.1
${cats_data_gw14}				    		    10.10.14.1
${cats_data_gw15}					    	    10.10.15.1
${cats_data_gw16}						        10.10.16.1
${cats_data_gw17}	    					    10.10.17.1
${cats_data_gw18}		    				    10.10.18.1
${cats_data_gw19}			    			    10.10.19.1
${cats_data_gw20}	    					    10.10.20.1
${cats_data_gw21}	    					    10.10.21.1
${cats_data_gw22}		    				    10.10.22.1
${cats_data_gw23}			    			    10.10.23.1
${cats_data_gw24}				    		    10.10.24.1
${cats_data_gw25}					    	    10.10.25.1
${cats_data_gw26}						        10.10.26.1
${cats_data_gw27}	    					    10.10.27.1
${cats_data_gw28}		    				    10.10.28.1
${cats_data_gw29}			    			    10.10.29.1
${cats_data_gw30}	    					    10.10.30.1
${cats_data_gw31}	    					    10.10.31.1
${cats_data_gw32}		    				    10.10.32.1
${cats_data_gw33}			    			    10.10.33.1
${cats_data_gw34}				    		    10.10.34.1
${cats_data_gw35}					    	    10.10.35.1
${cats_data_gw36}						        10.10.36.1
${cats_data_gw37}	    					    10.10.37.1
${cats_data_gw38}		    				    10.10.38.1
${cats_data_gw39}			    			    10.10.39.1
${cats_data_gw40}	    					    10.10.40.1
${cats_data_gw41}	    					    10.10.41.1
${cats_data_gw42}		    				    10.10.42.1
${cats_data_gw43}			    			    10.10.43.1
${cats_data_gw44}				    		    10.10.44.1
${cats_data_gw45}					    	    10.10.45.1
${cats_data_gw46}						        10.10.46.1
${cats_data_gw47}	    					    10.10.47.1
${cats_data_gw48}		    				    10.10.48.1
${cats_data_gw49}			    			    10.10.49.1
${cats_data_gw50}			    			    10.10.50.1

${cats_vm_username}			                    root
${cats_vm_password}              			    Alcateldc

${tenant_vm_net_ns}							    ns-data

${cats_NSGc-1_address_primary}				    10.156.46.2	
${cats_NSGc-1_gateway_primary}				    10.156.46.1
${cats_NSGc-2_address_primary}				    10.156.46.3	
${cats_NSGc-2_gateway_primary}				    10.156.46.1
${cats_NSGc-3_address_primary}				    10.156.46.22	
${cats_NSGc-3_gateway_primary}				    10.156.46.1
${cats_NSGc-4_address_primary}				    10.156.46.23
${cats_NSGc-4_gateway_primary}				    10.156.46.1

${cats_NSGe-1-1_address_primary}				10.156.46.4	
${cats_NSGe-1-1_gateway_primary}				10.156.46.1
${cats_NSGe-1-2_address_primary}				10.155.46.4	
${cats_NSGe-1-2_gateway_primary}				10.155.46.1
${cats_NSGe-2-1_address_primary}				10.156.46.5	
${cats_NSGe-2-1_gateway_primary}				10.156.46.1
${cats_NSGe-2-2_address_primary}				10.155.46.5	
${cats_NSGe-2-2_gateway_primary}				10.155.46.1

${cats_NSGe200-1_address_primary}				10.156.46.6	
${cats_NSGe200-1_gateway_primary}				10.156.46.1
${cats_NSGe200-2_address_primary}				10.156.46.7	
${cats_NSGe200-2_gateway_primary}				10.156.46.1
${cats_NSGe200-3_address_primary}				10.156.46.24	
${cats_NSGe200-3_gateway_primary}				10.156.46.1
${cats_NSGe200-4_address_primary}				10.156.46.25
${cats_NSGe200-4_gateway_primary}				10.156.46.1

${cats_NSGe300-1_address_primary}				10.156.46.8	
${cats_NSGe300-1_gateway_primary}				10.156.46.1
${cats_NSGe300-2_address_primary}				10.156.46.9	
${cats_NSGe300-2_gateway_primary}				10.156.46.1

${cats_NSGx200-1_address_primary}				10.156.46.10	
${cats_NSGx200-1_gateway_primary}				10.156.46.1
${cats_NSGx200-2_address_primary}				10.156.46.11
${cats_NSGx200-2_gateway_primary}				10.156.46.1

${cats_NSGx-1_address_primary}				    10.156.46.12	
${cats_NSGx-1_gateway_primary}				    10.156.46.1
${cats_NSGx-2_address_primary}				    10.156.46.13	
${cats_NSGx-2_gateway_primary}				    10.156.46.1
${cats_NSGx-3_address_primary}				    10.156.46.14	
${cats_NSGx-3_gateway_primary}				    10.156.46.1
${cats_NSGx-4_address_primary}				    10.156.46.15	
${cats_NSGx-4_gateway_primary}				    10.156.46.1

${cats_NSGe202-1_address_primary}				10.156.46.20
${cats_NSGe202-1_gateway_primary}				10.156.46.1
${cats_NSGe202-2_address_primary}				10.156.46.21	
${cats_NSGe202-2_gateway_primary}				10.156.46.1

${cats_NSGe206-1_address_primary}				10.156.46.16	
${cats_NSGe206-1_gateway_primary}				10.156.46.1
${cats_NSGe206-2_address_primary}				10.156.46.17	
${cats_NSGe206-2_gateway_primary}				10.156.46.1

${cats_NSGe306-1_address_primary}				10.156.46.18	
${cats_NSGe306-1_gateway_primary}				10.156.46.1
${cats_NSGe306-2_address_primary}				10.156.46.19	
${cats_NSGe306-2_gateway_primary}				10.156.46.1

${cats_NSGxxx_netmask}						    255.255.255.0
${cats_NSGxxx_DNSAddress}					    10.161.46.169

##############################
#     DHCP PARAMETERS                       
##############################
${cats_minAddress1_subnet1}  				   10.10.1.2
${cats_maxAddress1_subnet1}					   10.10.1.3
${cats_minAddress2_subnet1}  				   10.10.1.4
${cats_maxAddress2_subnet1}					   10.10.1.5
${cats_minAddress1_subnet2}  				   10.10.2.2
${cats_maxAddress1_subnet2}					   10.10.2.3
${cats_minAddress2_subnet2}  				   10.10.2.4
${cats_maxAddress2_subnet2}					   10.10.2.5

${cats_minAddress1_subnetC1}  				   10.10.100.2
${cats_maxAddress1_subnetC1}				   10.10.100.3
${cats_minAddress1_subnetE1}  				   10.10.102.2
${cats_maxAddress1_subnetE1}				   10.10.102.3
${cats_minAddress1_subnetE2001} 			   10.10.104.2
${cats_maxAddress1_subnetE2001}				   10.10.104.3
${cats_minAddress1_subnetE3001} 			   10.10.106.2
${cats_maxAddress1_subnetE3001}				   10.10.106.3
${cats_minAddress1_subnetX2001} 			   10.10.108.2
${cats_maxAddress1_subnetX2001}				   10.10.108.3
${cats_minAddress1_subnetX1}  				   10.10.110.2
${cats_maxAddress1_subnetX1}				   10.10.110.3
${cats_minAddress1_subnetE2021} 			   10.10.122.2
${cats_maxAddress1_subnetE2021}				   10.10.122.3
${cats_minAddress1_subnetE2061} 			   10.10.114.2
${cats_maxAddress1_subnetE2061}				   10.10.114.3
${cats_minAddress1_subnetE3061} 			   10.10.116.2
${cats_maxAddress1_subnetE3061}				   10.10.116.3

##############################
#     AAR PARAMETERS                       
##############################
${cats_PM_name}                                Matrix-PM
${cats_NPM_name}                               Matrix-NPM
${cats_apm_group_name}                         Matrix-APM
${cats_monitor_scope_name1}                    Matrix-MS1
${cats_app_name}                               SSH-app
${cats_app1_name}                              Matrix-SKYPE
${cats_app2_name}                              Matrix-FACEBOOK
${cats_app3_name}                              Matrix-GOOGLE
${cats_stcv_txport}                            5201


##############################
#     NSGv PARAMETERS
##############################
${cats_nsg_vars_fname}                         cats_matrix_vars.yaml

${build_vars_filename}                         build_vars_${test_prefix}.yml

##############################                 
#     METRO PARAMETERS                         
##############################        
${cats_CATS_host}                              10.169.46.220
${cats_METRO_host}                             10.169.46.4
${cats_target_host}                            10.169.46.4

${cats_CATS_host_login}                        cats
${cats_CATS_host_passwd}                       cats
${cats_METRO_host_login}                       root
${cats_METRO_host_passwd}                      Alcateldc
${cats_target_host_login}                      root
${cats_target_host_passwd}                     Alcateldc

${cats_METRO_path}                             /root/nuage-metro

${nuage_zipped_files_dir}                      "/SharedNFS/ISOs-and-Software/Nuage_Software/5.4.1/"
${nuage_unzipped_files_dir}                    "/SharedNFS/ISOs-and-Software/Nuage_Software/5.4.1/unzip/"

${ansible_deployment_host}                     ${cats_METRO_host}
${default_target_server}                       ${cats_target_host}

${dummy_br_name}                               br9
${default_port1_bridge}                        br3
${default_port2_bridge}                        br8
${default_port3_bridge}                        br7
${default_port4_bridge}                        ${dummy_br_name}
${default_port5_bridge}                        ${dummy_br_name}
${default_port6_bridge}                        ${dummy_br_name}

${zfb_isos_dir}                                zfbisos

##############################
#     VNS PARAMETERS
##############################
${cats_mgmt_xmpp_fqdn}                         vsd1.mgmt.vnspoc.541.net
${cats_mgnt_vsc1_ip}                           10.169.46.163
${cats_mgnt_vsc2_ip}                           10.169.46.164
#${cats_mgnt_vsc3_ip}                           10.169.46.163
#${cats_mgnt_vsc4_ip}                           10.169.46.164
#${cats_mgnt_vsc5_ip}                           10.169.46.165
#${cats_mgnt_vsc6_ip}                           10.169.46.166
#${cats_mgnt_vsc7_ip}                           10.169.46.167
#${cats_mgnt_vsc8_ip}                           10.169.46.168

${cats_util1_fqdn}                             vnsutil1.data.vnspoc.541.net
${cats_vsc1_ip}                                10.164.46.163
${cats_vsc2_ip}                                10.164.46.164
#${cats_vsc3_ip}                                10.164.46.163
#${cats_vsc4_ip}                                10.164.46.164
#${cats_vsc5_ip}                                10.163.46.165
#${cats_vsc6_ip}                                10.163.46.166
#${cats_vsc7_ip}                                10.162.46.167
#${cats_vsc8_ip}                                10.162.46.168

${cats_ntp_server}          				   10.169.46.4
${cats_dns_server}          				   10.169.46.169
${cats_util_server}          				   10.169.46.159
${cats_portal_server}                          10.169.46.179
${cats_stats_server}          				   10.169.46.155
${cats_proxy_server}          				   10.169.46.149
${cats_vsd1_server}          				   10.169.46.152
#${cats_vsd2_server}          				   10.169.46.152
#${cats_vsd3_server}          				   10.169.46.153
${cats_mgmt_vsr_ip}                            10.169.46.174

${DATA_GW}								       10.161.46.1

${cats_vsc_profile1_name}                      ${test_prefix}_VSC_PROF1
${cats_internet_uplink1_vlan}                  200
${cats_internet_uplink2_vlan}                  201
${cats_nsg_matrix_spirent_vlan}                100

${cats_vsc_username}			               admin
${cats_vsc_password}            			   admin
${cats_dns_username}			               root
${cats_dns_password}            			   Alcateldc
${cats_util_username}			               root
${cats_util_password}            			   Alcateldc
${cats_portal_username}                        root
${cats_portal_password}                        Alcateldc
${cats_stats_username}			               root
${cats_stats_password}            			   Alcateldc
${cats_proxy_username}			               root
${cats_proxy_password}            			   Alcateldc
${cats_vsd1_username}			               root
${cats_vsd1_password}            			   Alcateldc
${cats_vsd2_username}			               root
${cats_vsd2_password}            			   Alcateldc
${cats_vsd3_username}			               root
${cats_vsd3_password}            			   Alcateldc
${cats_vsr_username}			               admin
${cats_vsr_password}            			   admin

##############################
#     NSG UBR PARAMETERS
##############################
${cats_nsg_ubr1_ip_to_controller}			   10.165.46.26
${cats_nsg_ubr1_gw_to_controller}			   10.165.46.25
${cats_nsg_ubr1_ip_to_internet}				   10.165.46.38
${cats_nsg_ubr1_gw_to_internet}				   10.165.46.37
${cats_nsg_ubr1_ip_to_mpls1}				   10.165.46.18
${cats_nsg_ubr1_gw_to_mpls1}				   10.165.46.17
${cats_nsg_ubr1_ip_to_mpls2}				   10.165.46.34
${cats_nsg_ubr1_gw_to_mpls2}				   10.165.46.33
${cats_nsg_ubr2_ip_to_controller}			   10.165.46.66
${cats_nsg_ubr2_gw_to_controller}			   10.165.46.65
${cats_nsg_ubr2_ip_to_internet}				   10.165.46.78
${cats_nsg_ubr2_gw_to_internet}				   10.165.46.77
${cats_nsg_ubr2_ip_to_mpls1}				   10.165.46.58
${cats_nsg_ubr2_gw_to_mpls1}				   10.165.46.57
${cats_nsg_ubr2_ip_to_mpls2}				   10.165.46.74
${cats_nsg_ubr2_gw_to_mpls2}				   10.165.46.73

##############################
#     STCv PARAMETERS
##############################

#4.69
#${cats_chassis_STCv}                           10.169.46.81
#4.91 physical
####${cats_chassis_STCv}                           192.168.0.4
#4.91 virtual
${cats_chassis_STCv}                           10.169.46.82	
${STCv_port1}                                   vnet184
${STCv_port2}                                   vnet185
${STCv_VM_name}                                 stcv.491
#4.81
#${cats_chassis_STCv}                           10.169.46.83
	

${time}  									   EMPTY
${day}										   0
${hour}									       0
${min}										   0
${sec}										   0

*** Keywords ***

NSG-C_1 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
 			 ...    cats_vrs_name=${cats_NSG-C-1_name}
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'
	
NSG-C_2 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
			 ...    cats_vrs_name=${cats_NSG-C-2_name}			 
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'
	
NSG-C_3 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
 			 ...    cats_vrs_name=${cats_NSG-C-3_name}
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'
	
NSG-C_4 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
			 ...    cats_vrs_name=${cats_NSG-C-4_name}			 
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'
	

NSG-E_1 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
 			 ...    cats_vrs_name=${cats_NSG-E-1_name}
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'
	
NSG-E_2 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
			 ...    cats_vrs_name=${cats_NSG-E-2_name}			 
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'

	
NSG-E200_1 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
 			 ...    cats_vrs_name=${cats_NSG-E200-1_name}
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'
	
NSG-E200_2 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
			 ...    cats_vrs_name=${cats_NSG-E200-2_name}
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'

NSG-E200_3 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
 			 ...    cats_vrs_name=${cats_NSG-E200-3_name}
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'
	
NSG-E200_4 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
			 ...    cats_vrs_name=${cats_NSG-E200-4_name}
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'

	
NSG-E300_1 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
 			 ...    cats_vrs_name=${cats_NSG-E300-1_name}
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'
	
NSG-E300_2 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
			 ...    cats_vrs_name=${cats_NSG-E300-2_name}
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'

	
NSG-X200_1 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
 			 ...    cats_vrs_name=${cats_NSG-X200-1_name}
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'
	
NSG-X200_2 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
			 ...    cats_vrs_name=${cats_NSG-X200-2_name}			 
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'
	
	
NSG-X_1 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
 			 ...    cats_vrs_name=${cats_NSG-X-1_name}
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'
	
NSG-X_2 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
			 ...    cats_vrs_name=${cats_NSG-X-2_name}			 
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'		

NSG-X_3 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
 			 ...    cats_vrs_name=${cats_NSG-X-3_name}
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'
	
NSG-X_4 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
			 ...    cats_vrs_name=${cats_NSG-X-4_name}			 
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'		

	
NSG-E202_1 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
 			 ...    cats_vrs_name=${cats_NSG-E202-1_name}
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'
	
NSG-E202_2 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
			 ...    cats_vrs_name=${cats_NSG-E202-2_name}
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'

	
NSG-E206_1 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
 			 ...    cats_vrs_name=${cats_NSG-E206-1_name}
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'
	
NSG-E206_2 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
			 ...    cats_vrs_name=${cats_NSG-E206-2_name}
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'
	
	
NSG-E306_1 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
 			 ...    cats_vrs_name=${cats_NSG-E306-1_name}
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'
	
NSG-E306_2 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
			 ...    cats_vrs_name=${cats_NSG-E306-2_name}
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'
	
	
NSGv01 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
			 ...    cats_vrs_name=${test_prefix}_NSGv01
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
	${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'
		
NSGv02 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
			 ...    cats_vrs_name=${test_prefix}_NSGv02
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'
	
NSGv03 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
			 ...    cats_vrs_name=${test_prefix}_NSGv03
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'
	
NSGv04 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
			 ...    cats_vrs_name=${test_prefix}_NSGv04
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'
	
NSGv05 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
			 ...    cats_vrs_name=${test_prefix}_NSGv05
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'
	
NSGv06 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
			 ...    cats_vrs_name=${test_prefix}_NSGv06
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'
	
NSGv07 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
			 ...    cats_vrs_name=${test_prefix}_NSGv07
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'
	
NSGv08 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
			 ...    cats_vrs_name=${test_prefix}_NSGv08
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'
	
NSGv09 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
			 ...    cats_vrs_name=${test_prefix}_NSGv09
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'

NSGv10 is up in Monitoring
    ${obj}=   Get VRS
			 ...    cats_controller_name=vsc1.mgmt.vnspoc.541.net
			 ...    cats_vrs_name=${test_prefix}_NSGv10
    ${sec} =    Evaluate    int(round(${obj.uptime} / 1000))
	${min} =    Evaluate    int(round(${obj.uptime} / 60000))
    ${hour} =   Evaluate    int(round(${obj.uptime} / 3600000))
    ${day} =    Evaluate    int(round(${obj.uptime} / 86400000))
    ${msg} =    Catenate    SEPARATOR=${\n}
    ...    		${\n}		${obj.name} = ${obj.status} for ${day} days / ${hour} hours / ${min} minutes / ${sec} seconds
	Log to console  ${msg}	console=${True}
	Should Be True	'${obj.status}' == 'UP'