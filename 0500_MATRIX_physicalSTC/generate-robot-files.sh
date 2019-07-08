#!/bin/bash

cd /media/sf_playground/0500_MATRIX_physicalSTC

ls 0[0-9]0_Overlay_*
ls 1[0-9]0_Overlay_*

rm -f 0[0-9]0_Overlay_*
rm -f 1[0-9]0_Overlay_*

sed 's/${case}/010/g' test_template.robot > 010_Overlay_NSG-C-1_to_NSG-C-2_18M_bi_1400_10c_10sec.robot
sed 's/${case}/020/g' test_template.robot > 020_Overlay_NSG-E-1_to_NSG-E-2_45M_bi_10c_10sec.robot
sed 's/${case}/030/g' test_template.robot > 030_Overlay_NSG-E200-1_to_NSG-E200-2_135M_bi_20c_10sec.robot
sed 's/${case}/040/g' test_template.robot > 040_Overlay_NSG-E300-1_to_NSG-E300-2_180M_bi_30c_10sec.robot
sed 's/${case}/050/g' test_template.robot > 050_Overlay_NSG-X200-1_to_NSG-X200-450M_bi_40c_10sec.robot
sed 's/${case}/060/g' test_template.robot > 060_Overlay_NSG-X-1_to_NSG-X-2_950M_bi_50c_10sec.robot
sed 's/${case}/070/g' test_template.robot > 070_Overlay_NSGv1_to_NSGv2_1M_bi_1c_10sec.robot
sed 's/${case}/071/g' test_template.robot > 071_Overlay_NSGv1_to_NSGv2-3_1M_bi_1c_10sec.robot
sed 's/${case}/080/g' test_template.robot > 080_Overlay_NSGv4_to_NSGv5_1M_bi_1c_10sec.robot
sed 's/${case}/090/g' test_template.robot > 090_Overlay_NSG-Xy_xy_bi_1400_xM_bi_1c_1min.robot
sed 's/${case}/100/g' test_template.robot > 100_Overlay_NSG-x-1_to_NSG-x-2_xM_uni_1c_10sec.robot

cd /home/cats