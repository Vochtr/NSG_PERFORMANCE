#!/bin/bash

export NUAGE_RELEASE="5.2.2"
export VNSPOC_RELEASE="1.1.0"

#cat /home/cats/nuage-cats/nuage-cats/cats_config.yaml | grep 'url'	

#source /home/cats/venvs/nuage-cats-5.1.1u1/bin/activate
source ~/nuage-cats/helpers/activate-venv.sh 5.2.1

cd /home/cats
cd nuage-cats
cd nuage-cats
cd playground
cd VNSPOC-playlists

show_menu(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}***************************************************${NORMAL}"	
	echo -e "${MENU}** ${VNSPOC_RELEASE} ** TRAININGs menu ** Nokia Internal use **${NORMAL}"	
	echo -e "${MENU}***************************************************${NORMAL}"	
	echo -e "${MENU}**${NORMAL}"	
	echo -e "${MENU}**${NUMBER} 1)${MENU} run infrastructure check SETUP_1 ${NORMAL}"
	echo -e "${MENU}**${NUMBER} 2)${MENU} run infrastructure check SETUP_2 ${NORMAL}"
	echo -e "${MENU}**${NUMBER} 3)${MENU} run infrastructure check SETUP_3 ${NORMAL}"
	echo -e "${MENU}**${NUMBER} 4)${MENU} run infrastructure check SETUP_D ${NORMAL}"
	echo -e "${MENU}**${NUMBER} 5)${MENU} run infrastructure check SETUP_P ${NORMAL}"
	echo -e "${MENU}**${NUMBER} 6)${MENU} run infrastructure check REGION_2 ${NORMAL}"
	echo -e "${MENU}**${NUMBER} 7)${MENU} run infrastructure check REGION_3 ${NORMAL}"
	echo -e "${MENU}**${NORMAL}"	
	echo -e "${MENU}***************************************************${NORMAL}"	
	echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}enter to exit. ${NORMAL}"
    read opt
}
function option_picked() {
    COLOR='\033[01;31m' # bold red
    RESET='\033[00;00m' # normal white
    MESSAGE=${@:-"${RESET}Error: No message passed"} 
    echo -e "${COLOR}${MESSAGE}${RESET}"
}

clear
show_menu
while [ opt != '' ]
    do
    if [[ $opt = "" ]]; then 
            exit;
    else
        case $opt in
	1) clear;
	    option_picked "Connected to SETUP_1";
            export VNSPOC_SETUP="SETUP_1"
            cp /home/cats/nuage-cats/nuage-cats/cats_config.yaml_SETUP_1 /home/cats/nuage-cats/nuage-cats/cats_config.yaml
	    ./test-infrastructure.sh
            show_menu;
            ;; 
        2) clear;
	    option_picked "Connected to SETUP_2";
            export VNSPOC_SETUP="SETUP_2"
            cp /home/cats/nuage-cats/nuage-cats/cats_config.yaml_SETUP_2 /home/cats/nuage-cats/nuage-cats/cats_config.yaml
	    ./test-infrastructure.sh
            show_menu;
            ;; 
        3) clear;
	    option_picked "Connected to SETUP_3";
            export VNSPOC_SETUP="SETUP_3"
            cp /home/cats/nuage-cats/nuage-cats/cats_config.yaml_SETUP_3 /home/cats/nuage-cats/nuage-cats/cats_config.yaml
	    ./test-infrastructure.sh
            show_menu;
            ;; 
        4) clear;
	    option_picked "Connected to SETUP_D";
            export VNSPOC_SETUP="SETUP_D"
            cp /home/cats/nuage-cats/nuage-cats/cats_config.yaml_SETUP_D /home/cats/nuage-cats/nuage-cats/cats_config.yaml
	    ./test-infrastructure.sh
            show_menu;
            ;; 
        5) clear;
	    option_picked "Connected to SETUP_P";
            export VNSPOC_SETUP="SETUP_P"
            cp /home/cats/nuage-cats/nuage-cats/cats_config.yaml_SETUP_P /home/cats/nuage-cats/nuage-cats/cats_config.yaml
	    ./test-infrastructure.sh
            show_menu;
            ;; 
        6) clear;
	    option_picked "Connected to REGION_2";
            export VNSPOC_SETUP="REGION_2"
            cp /home/cats/nuage-cats/nuage-cats/cats_config.yaml_REGION_2 /home/cats/nuage-cats/nuage-cats/cats_config.yaml
	    ./test-infrastructure.sh
            show_menu;
            ;; 
        7) clear;
	    option_picked "Connected to REGION_3";
            export VNSPOC_SETUP="REGION_3"
            cp /home/cats/nuage-cats/nuage-cats/cats_config.yaml_REGION_3 /home/cats/nuage-cats/nuage-cats/cats_config.yaml
	    ./test-infrastructure.sh
            show_menu;
            ;; 
			
        x)exit;
        ;;			
        \n)exit;
        ;;
        *)clear;
        option_picked "Pick an option from the menu";
        show_menu;
        ;;
    esac
fi
done