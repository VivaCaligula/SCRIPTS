#!/bin/bash
#======================================#
#     Caligula's auto-busy script.     #
#======================================#

bspc rule -a Termite follow=on state=tiled

termite &
sleep .4
bspc node -p east -o 0.5
sleep .4

termite &
sleep .4
bspc node -p south -o 0.5
sleep .4

termite &
sleep .4
bspc node -f west
sleep .4
bspc node -p south -o 0.5
sleep .4

termite &
sleep .4

bspc node -f north
sleep .4
neofetch --block_range 0 15
sleep .4

bspc node -f east
sleep .4
htop
sleep .4

bspc node -f south
sleep .4
ls
sleep .4

bspc node -f west
sleep .4
ranger
sleep .4

bspc rule -a Termite follow=on state=floating
