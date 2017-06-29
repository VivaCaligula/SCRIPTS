#!/bin/bash
# This was modified from a script by Andre Linusus - https://i.imgur.com/QqUCFik.png

if [ "$1" == "window" ]
then
	scrot 'scrot-17%m%d_%M-%s.png' -s -e 'mv $f ~/Pictures/scrots/'
else
	scrot 'scrot-17%m%d_%M-%s.png' -e 'mv $f ~/Pictures/scrots/'
fi

printf "\n  Screenshot taken.\n\n"
