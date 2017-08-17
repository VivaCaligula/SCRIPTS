#!/bin/bash
#======================================#
#     Caligula's dmenu/wal script.     #
#======================================#

# Set the custom colors from wal.
source "$HOME/.cache/wal/colors.sh"

# For classic Dmenu.
# dmenu_run -nb "$color0" -nf "$color7" -sb "$color1" -sf "$color7" -fn Terminus-15:normal

# For patched Dmenu2.
dmenu_run -i -x 0 -y 21 -w 0 -nb "$color1" -nf "$color7" -sb "$color7" -sf "$color1" -fn Terminus-14:normal
