*** Variables ***

${TestCaseName}                                 Overlay_NSGv06_to_NSGv07_10M_bi_10sec

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
${NSGv06}										True
${NSGv07}										True
${NSGv08}										False
${NSGv09}										False
${NSGv10}										False

${duration}										10
${traffic_frame}								1400
${traffic_load}								    10
${streamblocks_vlan_dir}						2_1_bi
${VLAN1}                                        100
${VLAN2}										100

${ip_NSG1}										${cats_data_ip6}
${gw_NSG1}                                      ${cats_data_gw6}
${ip_NSG2}                                      ${cats_data_ip7}
${gw_NSG2}                                      ${cats_data_gw7}