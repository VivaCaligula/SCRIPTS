#!/bin/bash
#======================================#
#     Caligula's auto-busy script.     #
#======================================#

bspc rule -a Termite follow=on state=tiled

termite &
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
sleep .2
bspc node -p south -o 0.5
sleep .2

termite &
sleep .2

# bspc node -f north
# sleep .2
# neofetch --block_range 0 15
# sleep .2
# 
# bspc node -f east
# sleep .2
# htop
# sleep .2
# 
# bspc node -f south
# sleep .2
# ls
# sleep .2
# 
# bspc node -f west
# sleep .2
# ranger
# sleep .2

bspc rule -a Termite follow=on state=floating
