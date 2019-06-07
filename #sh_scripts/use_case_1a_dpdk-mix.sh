#!/bin/bash

#export NUAGE_RELEASE="5.3.3"
export NUAGE_RELEASE="5.4.1"

cat /home/cats/nuage-cats/nuage-cats/cats_config.yaml | grep url

cd /home/cats
cd nuage-cats
#source helpers/activate-venv.sh 5.3.3
source helpers/activate-venv.sh 5.4.1
cd nuage-cats
cd playground
cd _PLAYLISTS

./use_case_1a_dpdk-mix.sh