#!/bin/bash
#======================================#
#     Caligula's auto-busy script.     #
#======================================#

bspc rule -a Termite follow=on state=tiled

bspc node -t tiled
clear
printf "\n"
neofetch --block_range 0 15
sleep .2
bspc node -p east -o 0.5
sleep .2

termite &
sleep .2
bspc node -p south -o 0.5
sleep .2

termite &
sleep .2
bspc node -f west
sleep .1
bspc node -p south -o 0.5
sleep .2

termite &
sleep .2
bspc node -f west
sleep .1
bspc node -f east
sleep .1
bspc node -f north
sleep .1

bspc rule -a Termite follow=on state=floating
