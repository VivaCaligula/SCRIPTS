#!/bin/bash
#=================================#
#     Caligula's lock script.     #
#=================================#

# Params can be found here- https://github.com/chrjguill/i3lock-color

# Set the custom colors from wal.
source "$HOME/.cache/wal/colors.sh"

# i3lock -k -B=8 --textcolor=$color7 --insidecolor=$color1 --ringcolor=$color4 --linecolor=$color0 --keyhlcolor=$color0 --ringvercolor=$color0 --insidevercolor=$color0 --ringwrongcolor=$color4 --insidewrongcolor=$color8

i3lock -k -e -f -B=8 --timecolor="$color0"FF --timefont=terminus --timesize=32 --datecolor="$color0"FF --datestr="%Y/%m/%d" --datefont=terminus --datesize=24 --textcolor="$color7"80 --insidecolor="$color1"33 --ringcolor="$color1"3e --linecolor="$color1"80 --keyhlcolor="$color7"80 --bshlcolor="$color3"80 --separatorcolor="$color4"80 --veriftext="DRINKING VERIFICATION CAN" --ringvercolor="$color4"00 --insidevercolor="$color4"1c --wrongtext="WRONG" --ringwrongcolor="$color4"55 --insidewrongcolor="$color4"1c --textsize=12 --modsize=16 --radius=100

dunstify --urgency=low "Screen locked!"
