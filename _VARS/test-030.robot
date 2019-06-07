*** Variables ***

${TestCaseName}                                 Overlay_NSG-y-1_to_NSG-X-1_10M_uni_10sec

${NSG-C_1}										True
${NSG-C_2}										False
${NSG-E_1}										True
${NSG-E_2}										False
${NSG-E200_1}									True
${NSG-E200_2}									False
${NSG-E300_1}									True
${NSG-E300_2}									False
${NSG-X200_1}									True
${NSG-X200_2}									False
${NSG-X_1}										True
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

${duration}										10
${traffic_frame}								1400
${traffic_load}								    10
${streamblocks_vlan_dir}						5_0_uni

${ip_NSG1}										${cats_data_ip_NSG-C-1}
${gw_NSG1}                                      ${cats_data_gw_NSG-C-1}
${ip_NSG3}                                      ${cats_data_ip_NSG-E-1}
${gw_NSG3}                                      ${cats_data_gw_NSG-E-1}
${ip_NSG4}                                      ${cats_data_ip_NSG-E200-1}
${gw_NSG4}                                      ${cats_data_gw_NSG-E200-1}
${ip_NSG5}                                      ${cats_data_ip_NSG-E300-1}
${gw_NSG5}                                      ${cats_data_gw_NSG-E300-1}
${ip_NSG6}                                      ${cats_data_ip_NSG-X200-1}
${gw_NSG6}                                      ${cats_data_gw_NSG-X200-1}

${ip_NSG2}                                      ${cats_data_ip_NSG-X-1}
${gw_NSG2}                                      ${cats_data_gw_NSG-X-1}