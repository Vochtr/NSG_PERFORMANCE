*** Variables ***

${TestCaseName}                                 Test_040
${duration}										10
${traffic_frame}								1400
${traffic_load}								    180
${direction}									bi
${streamblocks}                                 2
${config_file}									NSG-E3001-E3002_bi_1400_180M_30c.xml

${NSG-C_1}										False
${NSG-C_2}										False
${NSG-E_1}										False
${NSG-E_2}										False
${NSG-E200_1}									False
${NSG-E200_2}									False
${NSG-E300_1}									True	
${NSG-E300_2}									True
${NSG-X200_1}									False
${NSG-X200_2}									False
${NSG-X_1}										False
${NSG-X_2}										False

${NSGv01}										False
${NSGv02}										False
${NSGv03}										False
${NSGv04}										False
${NSGv05}										False