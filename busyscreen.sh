#!/bin/bash
#======================================#
#     Caligula's auto-busy script.     #
#======================================#

bspc rule -a Termite follow=on state=tiled

termite &
sleep .3
bspc node -p east -o 0.5
sleep .3

termite &
sleep .3
bspc node -p south -o 0.5
sleep .3

termite &
sleep .3
bspc node -f west
sleep .3
bspc node -p south -o 0.5
sleep .3

termite &
sleep .3

# bspc node -f north
# sleep .3
# neofetch --block_range 0 15
# sleep .3
# 
# bspc node -f east
# sleep .3
# htop
# sleep .3
# 
# bspc node -f south
# sleep .3
# ls
# sleep .3
# 
# bspc node -f west
# sleep .3
# ranger
# sleep .3

bspc rule -a Termite follow=on state=floating
