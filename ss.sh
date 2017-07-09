#!/bin/bash
#===================================#
#     Snax's screenshot script.     #
#===================================#

# This was modified from a script by Andre Linusus - https://i.imgur.com/QqUCFik.png

if [ "$1" == "window" ]
then
	scrot 'scrot17%m%d_%M-%s.png' -s -e 'mv $f ~/Pictures/scrots/'
else
	scrot 'scrot17%m%d_%M-%s.png' -e 'mv $f ~/Pictures/scrots/'
fi

#dunst -p "Screenshot taken."

printf "\n  Screenshot taken.\n\n"
