#! /bin/sh
#========================================#
#     Caligula's wal recycle script.     #
#========================================#

# Cycle wal background image and colorscheme.
wal -i "$HOME/Pictures/wal"

# Restart polybar to match new colorscheme.
pkill polybar
polybar rome &

# Refresh bspwm's colorscheme.
source "$HOME/.cache/wal/colors.sh"
#color0=`sed -n '1p' ~/.cache/wal/colors`
#olor1=`sed -n '2p' ~/.cache/wal/colors`
#color7=`sed -n '8p' ~/.cache/wal/colors`
bspc config normal_border_color $color0
bspc config focused_border_color $color7
bspc config active_border_color $color1
bspc config presel_feedback_color $color7
