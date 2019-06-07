#!/bin/bash

export NUAGE_RELEASE="5.3.3"
export VNSPOC_RELEASE="1.2.0"

cp /home/cats/nuage-cats/nuage-cats/cats_config.yaml_SETUP_2 /home/cats/nuage-cats/nuage-cats/cats_config.yaml
echo "SETUP 2"
#cp /home/cats/nuage-cats/nuage-cats/cats_config.yaml_SETUP_3 /home/cats/nuage-cats/nuage-cats/cats_config.yaml
#echo "SETUP 3"

#source /home/cats/venvs/nuage-cats-5.1.1u1/bin/activate
#source ~/nuage-cats/helpers/activate-venv.sh 5.2.1

#CATS_VSD_API_URL=https://10.167.53.151:8443
#CATS_VSD_API_VER=5.3.3
#CATS_VSD_USER=csproot
#CATS_VSDPASSWORD=csproot
#CATS_VSD_ORG=csp

cd /home/cats
cd nuage-cats
cd nuage-cats
cd playground
cd _PLAYLISTS

#ls -l

show_menu(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}************************************************${NORMAL}"
	echo -e "${MENU}** ${VNSPOC_RELEASE} ** MATRIX menu ** Nokia Internal use **${NORMAL}"	
	echo -e "${MENU}************************************************${NORMAL}"	
	echo -e "${MENU}**${NORMAL}"	
	echo -e "${MENU}**${NUMBER} 1)${MENU} run infrastruct check ${NORMAL}"
	echo -e "${MENU}**${NUMBER} 2)${MENU} run setup preparation ${NORMAL}"
	echo -e "${MENU}**${NUMBER} 3)${MENU} run performance tests ${NORMAL}"
	echo -e "${MENU}**${NORMAL}"	
        echo -e "${MENU}**${NUMBER} 4)${MENU} run vss demo${NORMAL}"
        echo -e "${MENU}**${NORMAL}"
        echo -e "${MENU}**${NUMBER} 5)${MENU} run single test ${NORMAL}"
        echo -e "${MENU}**${NORMAL}" 
        echo -e "${MENU}**${NUMBER} 6)${MENU} run general create${NORMAL}"
        echo -e "${MENU}**${NORMAL}"
	echo -e "${MENU}************************************************${NORMAL}"	
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
	    option_picked "infrastruct check";
	    ./test-infrastructure.sh
            show_menu;
            ;; 
        2) clear;
	    option_picked "setup preparation";
	    ./setup-preparation.sh
            show_menu;
            ;; 
        3) clear;
	    option_picked "performance tests";
	    ./performance-tests.sh
            show_menu;
            ;; 
        4) clear;
            option_picked "single test";
            ./vss-demo.sh
            show_menu;
            ;;
        5) clear;
            option_picked "single test";
            ./single-test.sh
            show_menu;
            ;;
        6) clear;
            option_picked "general create";
            ./general-create.sh
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
