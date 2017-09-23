#!/bin/bash
#=======================================#
#     Caligula's screenshot script.     #
#=======================================#
# This was modified from a script by Andre Linusus - https://i.imgur.com/QqUCFik.png

mkdir -p ~/Pictures/scrots/
#ICON="/usr/share/icons/Adwaita/16x16/devices/camera-photo.png"

if [ "$1" == "window" ]
then
	scrot -q 100 'scrot17-%m-%d_%H-%M-%S.png' -s -e 'mv $f ~/Pictures/scrots/'
else
	sleep 3
	scrot -q 100 'scrot17-%m-%d_%H-%M-%S.png' -e 'mv $f ~/Pictures/scrots/'
fi

dunstify --urgency=normal -p --icon=$ICON "Screenshot taken."
