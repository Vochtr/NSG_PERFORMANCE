#!/bin/bash

export NUAGE_RELEASE="5.2.1"
export VNSPOC_RELEASE="1.1.0"
export VNSPOC_SETUP="SETUP_1"

case "$VNSPOC_SETUP" in
   "SETUP_1") cp /home/cats/nuage-cats/nuage-cats/cats_config.yaml_SETUP_1 /home/cats/nuage-cats/nuage-cats/cats_config.yaml
   echo "Connected to SETUP_1"
   ;;
   "SETUP_2") cp /home/cats/nuage-cats/nuage-cats/cats_config.yaml_SETUP_2 /home/cats/nuage-cats/nuage-cats/cats_config.yaml
   echo "Connected to SETUP_2"
   ;;
   "SETUP_3") cp /home/cats/nuage-cats/nuage-cats/cats_config.yaml_SETUP_3 /home/cats/nuage-cats/nuage-cats/cats_config.yaml
   echo "Connected to SETUP_3"
   ;;
   "SETUP_4") cp /home/cats/nuage-cats/nuage-cats/cats_config.yaml_SETUP_4 /home/cats/nuage-cats/nuage-cats/cats_config.yaml
   echo "Connected to SETUP_4"
   ;;
   "SETUP_SNCF") cp /home/cats/nuage-cats/nuage-cats/cats_config.yaml_SETUP_SNCF /home/cats/nuage-cats/nuage-cats/cats_config.yaml
   echo "Connected to SETUP_SNCF"
   ;;
   "SETUP_X") cp /home/cats/nuage-cats/nuage-cats/cats_config.yaml_SETUP_X /home/cats/nuage-cats/nuage-cats/cats_config.yaml
   echo "Connected to SETUP_X"
   ;;
esac

cat /home/cats/nuage-cats/nuage-cats/cats_config.yaml | grep 'url'	

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
	echo -e "${MENU}** ${VNSPOC_RELEASE} ** FRAMEWORK menu ** Nokia Internal use ** ${VNSPOC_SETUP}${NORMAL}"	
	echo -e "${MENU}***************************************************${NORMAL}"	
	echo -e "${MENU}**${NORMAL}"	
	echo -e "${MENU}**${NUMBER} R)${MENU} run REGRESSION test ${NORMAL}"
	echo -e "${MENU}**${NORMAL}"	
    echo -e "${MENU}**${NUMBER} I)${MENU} run infrastructure check ${NORMAL}"
	echo -e "${MENU}**${NORMAL}"	
    echo -e "${MENU}**${NUMBER} 1)${MENU} run VNSaaPOC including 'cleanup' tag ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 2)${MENU} run VNSaaPOC including 'deletion' tag ${NORMAL}"
	echo -e "${MENU}**${NUMBER} 3)${MENU} run VNSaaPOC including 'preparation' tag ${NORMAL}"
	echo -e "${MENU}**${NUMBER} 4)${MENU} run VNSaaPOC including 'spirent' tag ${NORMAL}"
	echo -e "${MENU}**${NUMBER} 5)${MENU} run VNSaaPOC including 'usecase' tag ${NORMAL}"
	echo -e "${MENU}**${NORMAL}"	
	echo -e "${MENU}**${NUMBER} 10)${MENU} initialize Customer-A NSGs ${NORMAL}"
	echo -e "${MENU}**${NUMBER} 11)${MENU} initialize Customer-B NSGs ${NORMAL}"
	echo -e "${MENU}**${NUMBER} 12)${MENU} initialize Customer-X NSGs ${NORMAL}"
	echo -e "${MENU}**${NUMBER} 13)${MENU} initialize NSG_UBR1 ${NORMAL}"
	echo -e "${MENU}**${NUMBER} 14)${MENU} initialize NSG_UBR2 ${NORMAL}"
	echo -e "${MENU}**${NORMAL}"	
	echo -e "${MENU}**${NUMBER} P)${MENU} run Performance lab preparation (under test) ${NORMAL}"
	echo -e "${MENU}**${NUMBER} T)${MENU} run Traffic test on real NSG (under test) ${NORMAL}"
	echo -e "${MENU}**${NUMBER} t)${MENU} run test ${NORMAL}"
	echo -e "${MENU}**${NORMAL}"	
	echo -e "${MENU}**${NORMAL} C)${MENU} run Customized StoryLine ${NORMAL}"	
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
		i) clear;
		    option_picked "run infrastructure check ${VNSPOC_RELEASE}";
			./test-infrastructure.sh
            show_menu;
            ;; 
        I) clear;
            option_picked "run infrastructure check ${VNSPOC_RELEASE}";
			./test-infrastructure.sh
            show_menu;
            ;; 
        r) clear;
		    option_picked "run regression tests ${VNSPOC_RELEASE}";
			./test-regression.sh
            show_menu;
            ;; 
        R) clear;
            option_picked "run regression tests ${VNSPOC_RELEASE}";
			./test-regression.sh
            show_menu;
            ;; 
        1) clear;
            option_picked "run VNSaaPOC including 'cleanup' tag ${VNSPOC_RELEASE}";
			./tag-cleanup.sh
            show_menu;
            ;; 
		2) clear;
            option_picked "run VNSaaPOC including 'deletion' tag ${VNSPOC_RELEASE}";
			./tag-deletion.sh
            show_menu;
            ;; 
		3) clear;
            option_picked "run VNSaaPOC including 'preparation' tag ${VNSPOC_RELEASE}";
			./tag-preparation.sh
            show_menu;
            ;; 
		4) clear;
            option_picked "run VNSaaPOC including 'spirent' tag ${VNSPOC_RELEASE}";
			./tag-spirent.sh
            show_menu;
            ;; 
	    5) clear;
            option_picked "run VNSaaPOC including 'usecase' tag ${VNSPOC_RELEASE}";
			./tag-usecase.sh
            show_menu;
            ;; 
		10) clear;
            option_picked "initialize Customer-A NSGs ${VNSPOC_RELEASE}";
			./init-Cust-A_NSG.sh
            show_menu;
            ;; 	
		11) clear;
            option_picked "initialize Customer-B NSGs ${VNSPOC_RELEASE}";
			./init-Cust-B_NSG.sh
            show_menu;
            ;; 	
		12) clear;
            option_picked "initialize Customer-X NSGs ${VNSPOC_RELEASE}";
			./init-Cust-X_NSG.sh
            show_menu;
            ;; 	
		13) clear;
            option_picked "initialize NSG_UBR1 ${VNSPOC_RELEASE}";
			./init-NSG_UBR1.sh
            show_menu;
            ;; 
		14) clear;
            option_picked "initialize NSG_UBR2 ${VNSPOC_RELEASE}";
			./init-NSG_UBR2.sh
            show_menu;
            ;; 	
		p) clear;
            option_picked "run real Performance Lab preparations ${VNSPOC_RELEASE}";
			./test-performance.sh
            show_menu;
            ;; 	
		P) clear;
            option_picked "run real Performance Lab preparations ${VNSPOC_RELEASE}";
			./test-performance.sh
            show_menu;
            ;; 	
		t) clear;
            option_picked "run test ${VNSPOC_RELEASE}";
			./test.sh
            show_menu;
            ;; 	
		T) clear;
            option_picked "run real Traffic test ${VNSPOC_RELEASE}";
			./test-traffic.sh
            show_menu;
            ;; 	
		c) clear;
            option_picked "run Customized StoryLine ${VNSPOC_RELEASE}";
			./demo-customized.sh
            show_menu;
            ;; 	
		C) clear;
            option_picked "run Customized StoryLine ${VNSPOC_RELEASE}";
			./demo-customized.sh
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
