#!/bin/bash
#=========================================#
#     Caligula's rice manager script.     #
#=========================================#
# This is a script for managing the different rice configurations
# featured here - https://github.com/VivaCaligula/DOTFILES

# Make sure script is run on linux.
if [ $OSTYPE != "linux-gnu" ]; then
    echo "Error: this script is only for Linux!"
    exit 1
fi

echo "It's recommended you save and close any open nodes before switching."
printf "\n"

while true
do
    read -p "Switch aesthetic to ROME or ANTIUM? [r/a/q]: " answer
    case $answer in
    [rR]* ) sudo cp -f ~/.config/bspwm/bwpwmRome ~/.config/bspwm/bspwmrc
            echo "Switched bspwm config..."
            sudo cp -f ~/.config/polybar/configRome ~/.config/polybar/config
            echo "Switched polybar config..."
            sudo cp -f ~/.config/termite/configRome ~/.config/termite/config
            echo "Switched termite config..."
            echo "Finished, killing of X session..."
            sleep 1
            pkill x
            break;;
    [aA]* ) sudo cp -f ~/.config/bspwm/bwpwmAntium ~/.config/bspwm/bspwmrc
            echo "Switched bspwm config..."
            sudo cp -f ~/.config/polybar/configAntium ~/.config/polybar/config
            echo "Switched polybar config..."
            sudo cp -f ~/.config/termite/configAntium ~/.config/termite/config
            echo "Switched termite config..."
            echo "Finished, killing of X session..."
            sleep 1
            pkill x
            break;;
    [qQ]* ) printf "\n"
            exit;;
    * )     echo "Enter Rome, Antium, or Quit."
    esac
done
printf "\n"
