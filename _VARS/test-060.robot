*** Variables ***

${TestCaseName}                                 Overlay_NSG-E-1_to_NSG-E-2_50M_bi_1min

${NSG-C_1}										False
${NSG-C_2}										False
${NSG-E_1}										True
${NSG-E_2}										True
${NSG-E200_1}									False
${NSG-E200_2}									False
${NSG-E300_1}									False
${NSG-E300_2}									False
${NSG-X200_1}									False
${NSG-X200_2}									False
${NSG-X_1}										False
${NSG-X_2}										False

${NSGv01}										False
${NSGv02}										False
${NSGv03}										False
${NSGv04}										False
${NSGv05}										False
${NSGv06}										False
${NSGv07}										False
${NSGv08}										False
${NSGv09}										False
${NSGv10}										False

${duration}										60
${traffic_frame}								1400
${traffic_load}								    45
${streamblocks_vlan_dir}						2_0_bi
#${VLAN1}                                        206
#${VLAN2}                                        207

${ip_NSG1}										${cats_data_ip_NSG-E-1}
${gw_NSG1}                                      ${cats_data_gw_NSG-E-1}
${ip_NSG2}                                      ${cats_data_ip_NSG-E-2}
${gw_NSG2}                                      ${cats_data_gw_NSG-E-2}