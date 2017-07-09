#!/bin/bash
#=============================#
#     Snax's rice script.     #
#=============================#

# This is a rice script for Arch + bspwm and other shit.
# It's assumed you've already installed Arch and enabled the AUR, xserver, etc.
# If you haven't, do that real quick - https://gist.github.com/VivaCaligula/65a0e3489ec110ed08d31027b1065d4d
# Additionally, you can autorun this script remotely by doing:
# $ curl https://github.com/VivaCaligula/SCRIPTS/blob/master/rice.sh | bash

# Refresh repositories and keyring.
sudo pacman -Syu
sudo yaourt -Syu
sudo pacman-key --refresh-keys

# Automatically dl + install all the programs you want from the arch repo; this will take a while.
# Replace gdm with whatever your prefered DM is (as well as other prefered programs).
sudo pacman --color always --force --noconfirm -S git zip ntp zsh ttf-dejavu awesome-terminal-fonts gnome gnome-tweak-tool poppler inkscape firefox htop ranger atom vim tmux powerline screenfetch vlc hexchat libreoffice-still multibit volctl obs-studio bleachbit snort nmap cmatrix thunar bspwm sxhkd termite dmenu feh compton dunst redshift
systemctl enable gdm.service

# Automatically DL + install all programs from the AUR; this will take a while.
sudo yaourt --color --force --noconfirm -S w3m imagemagick neofetch hsetroot polybar wal-git i3lock-color-git

# DL the dotfiles for all the programs (automatically into their right paths) from git repo.
cd ~
git pull https://github.com/VivaCaligula/DOTFILES.git
cp -f powerlineconfigs/* /usr/lib/python3.6/site-packages/powerline/

# Extra stuff for powerline.
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..
sudo rm -rf fonts

# Whatever Shell you get, replace zsh with your prefered shell.
which zsh
chsh -s /usr/bin/zsh
# To check if user has zsh shell active:
tail /etc/passwd
# Additionally, you should get - http://ohmyz.sh/
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Extra ranger initialization (to allow img2txt in the terminal).
ranger --copy-config=scope

# Restart your computer, log in with your new DM into bspwm, and you're done.
systemctl reboot
