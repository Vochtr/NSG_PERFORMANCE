*** Variables ***

${TestCaseName}                                 Overlay_NSG-X-1_to_NSG-X-2_500M_bi_1min

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
${NSG-X_1}										True
${NSG-X_2}										True

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
${traffic_load}								    450
${streamblocks_vlan_dir}						2_0_bi

${ip_NSG1}										${cats_data_ip_NSG-X-1}
${gw_NSG1}                                      ${cats_data_gw_NSG-X-1}
${ip_NSG2}                                      ${cats_data_ip_NSG-X-2}
${gw_NSG2}                                      ${cats_data_gw_NSG-X-2}