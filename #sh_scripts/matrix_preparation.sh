#!/bin/bash

export NUAGE_RELEASE="5.4.1"

#cp /home/cats/nuage-cats/nuage-cats/cats_config.yaml_SETUP_1 /home/cats/nuage-cats/nuage-cats/cats_config.yaml
#echo "SETUP_1"
#cp /home/cats/nuage-cats/nuage-cats/cats_config.yaml_SETUP_3 /home/cats/nuage-cats/nuage-cats/cats_config.yaml
#echo "SETUP_3"
#cp /home/cats/nuage-cats/nuage-cats/cats_config.yaml_THA4_533 /home/cats/nuage-cats/nuage-cats/cats_config.yaml
#echo "THA4 533"
cp /home/cats/nuage-cats/nuage-cats/cats_config.yaml_THA4_541 /home/cats/nuage-cats/nuage-cats/cats_config.yaml
echo "THA4 541"

echo "connect to this setup OK?"
sleep 3

cd /home/cats
cd nuage-cats
source helpers/activate-venv.sh 5.4.1
cd nuage-cats
cd playground
cd _PLAYLISTS

./setup-preparation.sh
