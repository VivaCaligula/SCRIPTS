#!/bin/bash
#==================================#
#     Snax's dmenu/wal script.     #
#==================================#

# Set the custom colors from wal.
color0=`sed -n '1p' ~/.cache/wal/colors`
color1=`sed -n '2p' ~/.cache/wal/colors`
color7=`sed -n '8p' ~/.cache/wal/colors`

dmenu_run -nb "$color0" -nf "$color7" -sb "$color1" -sf "$color7" -fn Terminus-15:normal
