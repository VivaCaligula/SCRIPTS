#!/bin/bash
#=========================================#
#     Caligula's rice manager script.     #
#=========================================#
# This is a script for switching between the different rice 
# configurations featured here - https://github.com/VivaCaligula/DOTFILES

echo "It's recommended you save and close any open nodes before switching."

while true
do
    read -p "Switch aesthetic to ROME or ANTIUM? [r/a/q]: " answer
    case $answer in
    [rR]* ) echo 'rome' >> ~/riceman.txt
            sudo cp ~/riceman.txt /etc/hostname
            rm -rf ~/riceman.txt
            sudo hostname rome
            cp -f ~/.config/bspwm/bspwmrcRome ~/.config/bspwm/bspwmrc
            echo "Switched bspwm config..."
            cp -f ~/.config/polybar/configRome ~/.config/polybar/config
            echo "Switched polybar config..."
            cp -f ~/.config/termite/Rome ~/.config/termite/config
            echo "Switched termite config..."
            cp -f ~/scripts/.zshrcRome ~/.zshrc
            echo "Switched zshrc..."
            cp -f ~/scripts/dmenuRome.sh ~/scripts/dmenu.sh
            echo "Switched dmenu config..."
            echo "Finished, killing X session..."
            sleep 1
            pkill x
            break;;
    [aA]* ) echo 'antium' >> ~/riceman.txt
            sudo cp ~/riceman.txt /etc/hostname
            rm -rf ~/riceman.txt
            sudo hostname antium
            cp -f ~/.config/bspwm/bspwmrcAntium ~/.config/bspwm/bspwmrc
            echo "Switched bspwm config..."
            cp -f ~/.config/polybar/configAntium ~/.config/polybar/config
            echo "Switched polybar config..."
            cp -f ~/.config/termite/Antium ~/.config/termite/config
            echo "Switched termite config..."
            cp -f ~/scripts/.zshrcAntium ~/.zshrc
            echo "Switched zshrc..."
            cp -f ~/scripts/dmenuAntium.sh ~/scripts/dmenu.sh
            echo "Switched dmenu config..."
            echo "Finished, killing X session..."
            sleep 1
            pkill x
            break;;
    [qQ]* ) printf "\n"
            exit;;
    * )     echo "Enter Rome, Antium, or Quit."
    esac
done
printf "\n"
