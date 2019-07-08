#!/bin/bash

/home/cats/nuage-cats/nuage-cats/cats \
--name PerformanceTest \
--output batch.xml \
--log batch.html \
--consolewidth 150 \
/media/sf_playground/0500_MATRIX_physicalSTC/010_Overlay_NSG-C-1_to_NSG-C-2_18M_bi_1400_10c_10sec.robot \
/media/sf_playground/0500_MATRIX_physicalSTC/020_Overlay_NSG-E-1_to_NSG-E-2_45M_bi_10c_10sec.robot \
/media/sf_playground/0500_MATRIX_physicalSTC/030_Overlay_NSG-E200-1_to_NSG-E200-2_135M_bi_20c_10sec.robot \
/media/sf_playground/0500_MATRIX_physicalSTC/040_Overlay_NSG-E300-1_to_NSG-E300-2_180M_bi_30c_10sec.robot \
/media/sf_playground/0500_MATRIX_physicalSTC/050_Overlay_NSG-X200-1_to_NSG-X200-450M_bi_40c_10sec.robot \
/media/sf_playground/0500_MATRIX_physicalSTC/060_Overlay_NSG-X-1_to_NSG-X-2_950M_bi_50c_10sec.robot \
/media/sf_playground/0500_MATRIX_physicalSTC/070_Overlay_NSGv1_to_NSGv2_1M_bi_1c_10sec.robot \
/media/sf_playground/0500_MATRIX_physicalSTC/071_Overlay_NSGv1_to_NSGv2-3_1M_bi_1c_10sec.robot \
/media/sf_playground/0500_MATRIX_physicalSTC/080_Overlay_NSGv4_to_NSGv5_1M_bi_1c_10sec.robot \
/media/sf_playground/0500_MATRIX_physicalSTC/090_Overlay_NSG-Xy_xy_bi_1400_xM_bi_1c_1min.robot \
/media/sf_playground/0500_MATRIX_physicalSTC/100_Overlay_NSG-x-1_to_NSG-x-2_xM_uni_1c_10sec.robot