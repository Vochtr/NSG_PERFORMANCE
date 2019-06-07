#!/bin/bash

export NUAGE_RELEASE="5.2.1"
export VNSPOC_RELEASE="1.1.0"
export VNSPOC_SETUP="SETUP_3"

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
   #clear
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}********************************************${NORMAL}"	
	echo -e "${MENU}*** ${VNSPOC_RELEASE} *** DEMO menu *** Customer use *** ${VNSPOC_SETUP} ${NORMAL}"	
	echo -e "${MENU}********************************************${NORMAL}"	
	echo -e "${MENU}**${NORMAL}"
    echo -e "${MENU}**${NUMBER}  C)${MENU} run VNSaaPOC CLEANUP ${NORMAL}"
    echo -e "${MENU}**${NUMBER}  P)${MENU} run VNSaaPOC PREPARATION ${NORMAL}"
	echo -e "${MENU}**${NUMBER}  S)${MENU} run VNSaaPOC STORYLINE batch ${NORMAL}"
	echo -e "${MENU}**${NUMBER}  T)${MENU} run VNSaaPOC TESTLIST ${NORMAL}"
	echo -e "${MENU}**${NORMAL}"	
	echo -e "${MENU}**${NUMBER}  1)${MENU} run 'Multitenancy' use case (TENANCY)${NORMAL}"
	echo -e "${MENU}**${NUMBER}  2)${MENU} run 'Bootstrap' use case (ZFB)${NORMAL}"
	echo -e "${MENU}**${NUMBER}  3)${MENU} run 'BranchToBranch' use case (B2B)${NORMAL}"
	echo -e "${MENU}**${NUMBER}  4)${MENU} run 'UnderlayBoarderRouter' use case (UBR)${NORMAL}"
	echo -e "${MENU}**${NUMBER}  5)${MENU} run 'AccessResiliency' use case (AR)${NORMAL}"
	echo -e "${MENU}**${NUMBER}  6)${MENU} run 'ApplicationAwareRouting' use case (AAR)${NORMAL}"
	echo -e "${MENU}**${NUMBER}  7)${MENU} run 'AccessControlList' use case (ACL)${NORMAL}"
	echo -e "${MENU}**${NUMBER}  8)${MENU} run 'BorderGatewayProtocol' use case (BGP)${NORMAL}"
	echo -e "${MENU}**${NUMBER}  9)${MENU} run 'DynamicHostConfigurationProtocol' use case (DHCP)${NORMAL}"
	echo -e "${MENU}**${NUMBER} 10)${MENU} run 'DoNotAdvertise' use case (DNA)${NORMAL}"
	echo -e "${MENU}**${NUMBER} 11)${MENU} run 'LocalBreakout' use case (LB)${NORMAL}"
	echo -e "${MENU}**${NUMBER} 12)${MENU} run 'NetworkAddressTranslation' use case (NAT)${NORMAL}"
	echo -e "${MENU}**${NUMBER} 13)${MENU} run 'PortAddressTranslation' use case (PAT)${NORMAL}"
	echo -e "${MENU}**${NUMBER} 14)${MENU} run 'QualityOfService' use case (QOS)${NORMAL}"
	echo -e "${MENU}**${NUMBER} 15)${MENU} run 'VirtualNetworkFunction' use case (VNF)${NORMAL}"
	echo -e "${MENU}**${NUMBER} 16)${MENU} run 'IPsecEncryption' use case (IPSEC)${NORMAL}"
	echo -e "${MENU}**${NUMBER} 17)${MENU} run 'VNSPortal ' use case (PORTAL)${NORMAL}"
	echo -e "${MENU}**${NORMAL}"	
	echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}enter to exit. ${NORMAL}"
    read opt
}
function option_picked() {
    COLOR='\033[01;31m' # bold red
    RESET='\033[00;00m' # normal white
    MESSAGE=${@:-"${RESET}Error: No message passed"} 
    echo -e "${COLOR}${MESSAGE}${RESET}"
}

#clear
show_menu
while [ opt != '' ]
    do
    if [[ $opt = "" ]]; then 
            exit;
    else
        case $opt in
		c) clear;
		    option_picked "run setup cleanup ${VNSPOC_RELEASE}";
			./demo-cleanup.sh
    		./demo-delete.sh
            show_menu;
            ;; 
        C) clear;
            option_picked "run setup cleanup ${VNSPOC_RELEASE}";
			./demo-cleanup.sh
    		./demo-delete.sh
            show_menu;
            ;; 
		p) clear;
		    option_picked "run setup preparation ${VNSPOC_RELEASE}";
			./demo-preparation.sh
            show_menu;
            ;; 
    	P) clear;
            option_picked "run setup preparation ${VNSPOC_RELEASE}";
			./demo-preparation.sh
            show_menu;
            ;; 
		s) clear;
            option_picked "run StoryLine use case ${VNSPOC_RELEASE}";
			./demo-storyline.sh
            show_menu;
            ;; 
        S) clear;
            option_picked "run StoryLine use case ${VNSPOC_RELEASE}";
			./demo-storyline.sh
            show_menu;
            ;; 
	    t) clear;
            option_picked "run Customized TestList ${VNSPOC_RELEASE}";
			./demo-testlist.sh
            show_menu;
            ;; 	
		T) clear;
            option_picked "run Customized TestList ${VNSPOC_RELEASE}";
			./demo-testlist.sh
            show_menu;
            ;; 	
		1) clear;
            option_picked "run MULTITENANCY use case ${VNSPOC_RELEASE}";
			./uc-TENANCY.sh
            show_menu;
            ;; 
		2) clear;
            option_picked "run ZF BOOTSTRAP use case ${VNSPOC_RELEASE}";
			./uc-ZFB.sh
            show_menu;
            ;; 
		3) clear;
            option_picked "run BRANCH to BRANCH use case ${VNSPOC_RELEASE}";
			./uc-B2B.sh
            show_menu;
            ;; 
		4) clear;
            option_picked "run UNDERLAYBOARDERROUTER use case ${VNSPOC_RELEASE}";
			./uc-UBR.sh
            show_menu;
            ;; 
		5) clear;
            option_picked "run AR use case ${VNSPOC_RELEASE}";
			./uc-AR.sh
            show_menu;
            ;; 
		6) clear;
            option_picked "run AAR use case ${VNSPOC_RELEASE}";
			./uc-AAR.sh
            show_menu;
            ;; 
		7) clear;
            option_picked "run ACL use case ${VNSPOC_RELEASE}";
			./uc-ACL.sh
            show_menu;
            ;; 
		8) clear;
            option_picked "run BGP use case ${VNSPOC_RELEASE}";
			./uc-BGP.sh
            show_menu;
            ;; 
		9) clear;
            option_picked "run DHCP use case ${VNSPOC_RELEASE}";
			./uc-DHCP.sh
            show_menu;
            ;; 
		10) clear;
            option_picked "run DNA use case ${VNSPOC_RELEASE}";
			./uc-DNA.sh
            show_menu;
            ;; 
		11) clear;
            option_picked "run LB use case ${VNSPOC_RELEASE}";
			./uc-LB.sh
            show_menu;
            ;; 
		12) clear;
            option_picked "run NAT use case ${VNSPOC_RELEASE}";
			./uc-NAT.sh
            show_menu;
            ;; 
		13) clear;
            option_picked "run PAT use case ${VNSPOC_RELEASE}";
			./uc-PAT.sh
            show_menu;
            ;; 
		14) clear;
            option_picked "run QOS use case ${VNSPOC_RELEASE}";
			./uc-QOS.sh
            show_menu;
            ;; 
		15) clear;
            option_picked "run VNF use case ${VNSPOC_RELEASE}";
			./uc-VNF.sh
            show_menu;
            ;; 	
	    16) clear;
            option_picked "run IPSEC use case ${VNSPOC_RELEASE}";
			./uc-IPSEC.sh
            show_menu;
            ;; 	
        17) clear;
            option_picked "run PORTAL use case ${VNSPOC_RELEASE}";
			./uc-PORTAL.sh
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
