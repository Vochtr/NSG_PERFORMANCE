*** Variables ***

${TestCaseName}                                 Overlay_NSGv03_to_NSGv04_10M_bi_10sec

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
${NSGv03}										True
${NSGv04}										True
${NSGv05}										False
${NSGv06}										False
${NSGv07}										False
${NSGv08}										False
${NSGv09}										False
${NSGv10}										False

${duration}										10
${traffic_frame}								1400
${traffic_load}								    10
${streamblocks_vlan_dir}						2_1_bi
${VLAN1}                                        100
${VLAN2}										100

${ip_NSG1}										${cats_data_ip3}
${gw_NSG1}                                      ${cats_data_gw3}
${ip_NSG2}                                      ${cats_data_ip4}
${gw_NSG2}                                      ${cats_data_gw4}