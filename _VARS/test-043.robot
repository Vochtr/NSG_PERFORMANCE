*** Variables ***

${TestCaseName}                                 Overlay_NSGv08_to_NSGv09_10M_bi_10sec

${NSG-C_1}										False
${NSG-C_2}										False
${NSG-E_1}										False
${NSG-E_2}										False
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
${NSGv08}										True
${NSGv09}										True
${NSGv10}										False

${duration}										10
${traffic_frame}								1400
${traffic_load}								    10
${streamblocks_vlan_dir}						2_1_bi
${VLAN1}                                        100
${VLAN2}										100

${ip_NSG1}										${cats_data_ip8}
${gw_NSG1}                                      ${cats_data_gw8}
${ip_NSG2}                                      ${cats_data_ip9}
${gw_NSG2}                                      ${cats_data_gw9}