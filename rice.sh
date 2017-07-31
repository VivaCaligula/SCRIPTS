#!/bin/bash
#=============================#
#     Snax's rice script.     #
#=============================#

# This is a rice script for Arch + bspwm and other shit.
# It's assumed you've already installed Arch and enabled the AUR, xserver, etc.
# If you haven't, do that real quick - https://gist.github.com/VivaCaligula/65a0e3489ec110ed08d31027b1065d4d
# Additionally, you can autorun this script remotely by doing:
# $ curl https://raw.githubusercontent.com/VivaCaligula/SCRIPTS/master/rice.sh | bash

# Refresh repositories and keyring.
sudo pacman -Syu
sudo yaourt -Syu
sudo pacman-key --refresh-keys

# Automatically dl + install all the programs you want from the arch repo; this will take a while.
# Replace gdm with whatever your prefered DM is (as well as other prefered programs).
sudo pacman --color always --force --noconfirm -S git zip ntp zsh ttf-dejavu poppler inkscape fontforge awesome-terminal-fonts gnome gnome-tweak-tool networkmanager bspwm sxhkd termite dmenu feh compton ranger tmux htop nmap firefox atom vim powerline powerline-fonts terminus-font screenfetch vlc hexchat libreoffice-still obs-studio bleachbit cmatrix thunar cool-retro-term dunst redshift wine
sudo systemctl enable gdm.service
# multibit & volctl?

# Automatically DL + install all programs from the AUR; this will take a while.
yaourt --color --force --noconfirm -S w3m imagemagick neofetch hsetroot polybar-git wal-git i3lock-color-git chkboot

# DL the dotfiles for all the programs (automatically into their right paths) from git repo.
cd ~
git clone https://github.com/VivaCaligula/DOTFILES.git
sudo mv -f ~/DOTFILES/* ~/
sudo rm -rf ~/DOTFILES
cp -rf powerlineconfigs/* /usr/lib/python3.6/site-packages/powerline/
# $ polybar -r rome # Refreshes polybar's cache.

# Extra stuff for powerline.
cd ~
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..
sudo rm -rf fonts

# Whatever Shell you get, replace zsh with your prefered shell.
which zsh
chsh -s /usr/bin/zsh
sudo chsh -s /usr/bin/zsh
# To check if user has zsh shell active:
tail /etc/passwd
# Additionally, you should get - http://ohmyz.sh/
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Scripts for dotfiles and etc.
cd ~
git clone https://github.com/VivaCaligula/SCRIPTS.git
mv SCRIPTS scripts

# Extra ranger initialization (to allow img2txt in the terminal).
ranger --copy-config=scope

# Restart your computer, log in with your new DM into bspwm, and you're done.
systemctl reboot
