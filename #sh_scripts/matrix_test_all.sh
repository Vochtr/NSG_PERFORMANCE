#!/bin/bash

export NUAGE_RELEASE="5.3.3"
export VNSPOC_RELEASE="1.2.0"

#p /home/cats/nuage-cats/nuage-cats/cats_config.yaml_SETUP_1 /home/cats/nuage-cats/nuage-cats/cats_config.yaml
#echo "SETUP_1"
#cp /home/cats/nuage-cats/nuage-cats/cats_config.yaml_SETUP_3 /home/cats/nuage-cats/nuage-cats/cats_config.yaml
#echo "SETUP_3"
cp /home/cats/nuage-cats/nuage-cats/cats_config.yaml_THA4_541 /home/cats/nuage-cats/nuage-cats/cats_config.yaml
echo "THA4_541"
echo "connect to this setup OK?"
sleep 3

cd /home/cats
cd nuage-cats
cd nuage-cats
cd playground
cd _PLAYLISTS

./single-test-all.sh
