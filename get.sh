#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'
clear

echo -e "${BLUE}=====================================================${NC}"
echo -e "${YELLOW}              Batocera Disk Player Setup           ${NC}"
echo -e "${BLUE}=====================================================${NC}"

echo -e "Welcome to the Batocera Disk Player setup !"
echo -e "What do you want to do ?"


PS3="Your choice (choose a number) :"
options=("Install BDP" "Uninstall BDP" "Quitter")
# Menu
select opt in "${options[@]}"
do
    case $opt in
        "Install BDP")
            echo "Laucnhing installation script..."
            wget https://batodisc.xyz/install.sh
            chmod +x install.sh
            bash install.sh
            rm -- "$0"
            break
            ;;
        "Uninstall BDP")
            echo "Vérification de l'état du système..."
            wget https://batodisc.xyz/uninstall.sh
            chmod +x uninstall.sh
            bash uninstall.sh
            rm -- "$0"
            break
            ;;
        "Quitter")
            echo "Goodbye !"
            rm -- "$0"
            break
            ;;
        *) 
            # In case of an error
            echo "That's not an option !"
            ;;
    esac
done