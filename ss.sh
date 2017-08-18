#!/bin/bash
#=======================================#
#     Caligula's screenshot script.     #
#=======================================#

# This was modified from a script by Andre Linusus - https://i.imgur.com/QqUCFik.png

mkdir -p ~/Pictures/scrots/

if [ "$1" == "window" ]
then
	scrot 'scrot17-%m-%d_%H-%M-%S.png' -s -e 'mv $f ~/Pictures/scrots/'
else
	sleep 3
	scrot 'scrot17-%m-%d_%H-%M-%S.png' -e 'mv $f ~/Pictures/scrots/'
fi

#dunst -p "Screenshot taken."
printf "\n  Screenshot taken.\n\n"
