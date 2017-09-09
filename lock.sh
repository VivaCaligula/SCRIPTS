#!/bin/bash
#=================================#
#     Caligula's lock script.     #
#=================================#

# Params can be found here- https://github.com/chrjguill/i3lock-color

# Set the custom colors from wal.
source "$HOME/.cache/wal/colors.sh"

# i3lock -k -B=8 --textcolor=$color7 --insidecolor=$color1 --ringcolor=$color4 --linecolor=$color0 --keyhlcolor=$color0 --ringvercolor=$color0 --insidevercolor=$color0 --ringwrongcolor=$color4 --insidewrongcolor=$color8

i3lock -k -B=8 --textcolor=ffffff00 --insidecolor=ffffff1c --ringcolor=ffffff3e --linecolor=ffffff00 --keyhlcolor=00000080 --ringvercolor=00000000 --insidevercolor=0000001c --ringwrongcolor=00000055 --insidewrongcolor=0000001c

dunstify --urgency=low "Screen locked!"
