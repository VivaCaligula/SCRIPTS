#!/bin/bash
#==============================#
#     Snerx-Unix ISVOS CLI     # aka skiddie stuff
#==============================#
#
# Created and maintained by Snax, aka Caligula.
# https://snerx.com/snux
#
# This is going to become a very large script by the time it's done, but it 
# will be incredibly useful and hopefully very powerfull when it is completed. 
# The aim is to give it functionality not availible with basic shell + alias 
# use, and to provide a psuedo-graphical super-script amalgamator. 
#
# Powerline + Awesome fonts and colorls are required for this to work properly.
# https://github.com/ryanoasis/nerd-fonts
# https://github.com/athityakumar/colorls

# Version and flags.
VERSION=0.1
a=1 c=1 t=1 s=1 n=0
stty cols 64
stty rows 30

# Flag handling.
OPTIND=1         # Reset in case getopts has been used previously in the shell.
while getopts "a:c:t:s:n:hv" arg; do
case $arg in
    a)  ;;
    c)  #if ; then
            
        #else
            
        #fi
        ;;
    t)  ;;
    s)  ;;#((s=(OPTARG>4 && OPTARG<16 )?OPTARG:s))
    n)  ;;
    h)  echo -e "\nUsage: $(basename $0) [OPTION]...\n"
        echo -e "  -a [1-10]\tAdmin option."
        echo -e "  -c [1-10]\tCrypto option."
        echo -e "  -t [1-10]\tTrench option."
        echo -e "  -s [1-10]\tScript option."
        echo -e "  -n\t\tAuto-nuke all partitions."
        echo -e "  -h\t\tHelp, displays this screen."
        echo -e "  -v\t\tPrints version number.\n"
        exit 0;;
    v)  echo -e "\n  $(basename -- "$0") version $VERSION \n"
        exit 0
    esac
done
shift $((OPTIND-1))
[ "$1" = "--" ] && shift

# Color Definitions
# Normal Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White
# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White
# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White
# Color Reset
NC="\e[m"

FileCheck() {
    if [ ! -f ~/scripts/$FILE ]; then
        echo -e "  Crucial file $FILE does not exist."
        read -p "  Automatically download it? [y/n]: " response
        case $response in
        [yY]* ) echo -e "  Cloning the script library..."
                cd ~
                git clone https://github.com/VivaCaligula/SCRIPTS.git
                mv -f SCRIPTS/$FILE scripts/$FILE
                rm -rf SCRIPTS
                break;;
        [nN]* ) printf "\n"
                break;;
        * )     echo "  Enter yes or no.";;
        esac
    fi
}

# These functions are placeholders.
BootIntegrity() {
    BOOTI="${Green} ${Blue}"
}
SnortStatus() {
    SNORT="${Green} ${Blue}"
}
Network() {
    NET="${Green} ${Blue}"
}
VPNstatus() {
    VPN="${Red} ${Blue}"
}

timestamp=$(date +%Y/%m/%d)' '$(date +%H:%M:%S)
#                                
#                               
#                                
#                                
#                          

splash() {
    echo -e "${Red}                    _____ _   _ _   ___   __                    "
    echo -e "                   /  ___| \ | | | | \ \ / /                    "
    echo -e "                   \ '--.|  \| | | | |\ V /                     "
    echo -e "                    '--. \ . ' | | | |/   \                     "
    echo -e "                   /\__/ / |\  | |_| / /^\ \                    "
    echo -e "                   \____/\_| \_/\___/\/   \/                    "
    echo -e "  ============================================================  "
    echo -e "  ${Blue}Snerx's Unix ISVOS CLI :: Version ${Green}$VERSION${Blue} :: $timestamp"
    echo -e "  Boot Integrity: $BOOTI ::: Snort: $SNORT ::: Network: $NET ::: VPN: $VPN"
    echo -e "  ${Red}============================================================  "
    printf "\n"
    echo -e "  ${Cyan}   Admin      Crypto      Trenches      Rice      Nuke${Red}"
    printf "\n"
}

prompts () {
    while true
    do
        read -p "  [a/c/t/r/n/q]: " response
        case $response in
        [aA]* ) printf "\n"
                echo -e "${Cyan}       Manage Users"
                echo -e "       Manage Files"
                echo -e "       Manage Network${Red}"
                printf "\n"
                while true
                do
                    read -p "  [1/2/3/b/q]: " response
                    case $response in
                    [1]* )  echo -e "  "
                            break;;
                    [2]* )  echo -e "  "
                            break;;
                    [3]* )  echo -e "  "
                            break;;
                    [bB]* ) prompts
                            printf "\n"
                            break;;
                    [qQ]* ) printf "\n"
                            exit;;
                    * )     echo "  Enter 1-3, back, or quit.";;
                    esac
                done
                printf "\n"
                break;;
        [cC]* ) printf "\n"
                echo -e "${Cyan}       Encrypt/Decrypt + Stego"
                echo -e "       Cryptocurrency Wallets"
                echo -e "       QR &   Barcodes${Red}"
                printf "\n"
                while true
                do
                    read -p "  [1/2/3/b/q]: " response
                    case $response in
                    [1]* )  echo -e "  "
                            break;;
                    [2]* )  echo -e "  "
                            break;;
                    [3]* )  echo -e "  "
                            break;;
                    [bB]* ) prompts
                            printf "\n"
                            break;;
                    [qQ]* ) printf "\n"
                            exit;;
                    * )     echo "  Enter 1-3, back, or quit.";;
                    esac
                done
                printf "\n"
                break;;
        [tT]* ) printf "\n"
                echo -e "${Cyan}       Snort Automation"
                echo -e "       Nmap Automation"
                echo -e "       Secure Wipe Free Space${Red}"
                printf "\n"
                while true
                do
                    read -p "  [1/2/3/b/q]: " response
                    case $response in
                    [1]* )  echo -e "  "
                            break;;
                    [2]* )  echo -e "  "
                            break;;
                    [3]* )  echo -e "  "
                            break;;
                    [bB]* ) prompts
                            printf "\n"
                            break;;
                    [qQ]* ) printf "\n"
                            exit;;
                    * )     echo "  Enter 1-3, back, or quit.";;
                    esac
                done
                printf "\n"
                break;;
        [rR]* ) printf "\n"
                echo -e "${Cyan}       Cycle Wallpaper & System Colors"
                echo -e "       Rice Demo (auto-busy, superls, & ss)"
                echo -e "       Auto-DL+Install Rice${Red}"
                printf "\n"
                while true
                do
                    read -p "  [1/2/3/b/q]: " response
                    case $response in
                    [1]* )  echo -e "  Using wal to cycle background and generate new color scheme..."
                            bash ~/scripts/walcycle.sh
                            prompts
                            printf "\n"
                            break;;
                    [2]* )  echo -e "  These scripts are currently broken..."
                            bash ~/scripts/busy.sh
                            sleep 3
                            bash ~/scripts/ss.sh
                            prompts
                            printf "\n"
                            break;;
                    [3]* )  echo -e "  Curling https://raw.githubusercontent.com/VivaCaligula/SCRIPTS/master/rice.sh into bash...
"
                            curl https://raw.githubusercontent.com/VivaCaligula/SCRIPTS/master/rice.sh | bash
                            printf "\n"
                            prompts
                            printf "\n"
                            break;;
                    [bB]* ) prompts
                            printf "\n"
                            break;;
                    [qQ]* ) printf "\n"
                            exit;;
                    * )     echo "  Enter 1-3, back, or quit.";;
                    esac
                done
                printf "\n"
                break;;
        [nN]* ) while true
                do
                    printf "\n"
                    echo -e "${Cyan}  Delete encryption keys and wipe all partitions?${Red}"
                    printf "\n"
                    read -p "  [y/n]: " response
                    case $response in
                    [yY]* ) echo -e "  "
                            break;;
                    [nN]* ) prompts
                            printf "\n"
                            break;;
                    [qQ]* ) printf "\n"
                            exit;;
                    * )     echo "  Enter yes, no, or quit.";;
                    esac
                done
                printf "\n"
                break;;
        [qQ]* ) printf "\n"
                exit;;
        * )     echo -e "  Enter admin, crypto, trenches, rice, nuke, or quit.";;
        esac
    done
}

# printf "\n"
# curl https://snerx.com/curl

FILE=nmap.sh
FileCheck
clear
printf "\n"
BootIntegrity
SnortStatus
Network
VPNstatus
splash
prompts
exit


#==================================#
#               EOF                #
#==================================#
