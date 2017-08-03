#!/bin/bash
#==================================#
#     Snax's dmenu/wal script.     #
#==================================#

# Set the custom colors from wal.
source "$HOME/.cache/wal/colors.sh"

dmenu_run -nb "$color0" -nf "$color7" -sb "$color1" -sf "$color7" -fn Terminus-15:normal
