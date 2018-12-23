#!/bin/bash
#===========================================#
#     Caligula's auto-installer script.     #
#===========================================#

# This is a script for creating a BSPWM-based pseudo-DE in Arch-Linux.
# The details and purpose of this rice package: snerx.com/winux and snerx.com/snux.
# If you haven't enabled the AUR, xserver, etcetera yet, do that real quick - https://gist.github.com/VivaCaligula/65a0e3489ec110ed08d31027b1065d4d
# Additionally, you can autorun this script remotely by doing:
# $ curl https://raw.githubusercontent.com/VivaCaligula/SCRIPTS/master/installer.sh | bash

# Refresh repositories and keyring.
sudo pacman-key --refresh-keys
sudo pacman -Syu

# Automatically dl + install all the programs you want from the arch repo; this will take a while.
# Replace gdm with whatever your prefered DM is (as well as other prefered programs).
sudo pacman --color always --overwrite --noconfirm -S git zip unrar ntp openssh openvpn ruby zsh yay python-pip ttf-dejavu poppler inkscape fontforge awesome-terminal-fonts networkmanager networkmanager-openvpn bspwm sxhkd termite termite-terminfo feh compton ranger tmux htop glances scrot nmap firefox keepassxc atom vim powerline-fonts terminus-font screenfetch vlc phonon-qt5-vlc electrum transmission-qt ffmpeg bleachbit checksec extundelete mpd ncmpcpp cmatrix cool-retro-term dunst redshift wine steam nethack shellcheck keybase-gui
# To change out the DM: $ sudo systemctl enable gdm.service

# Automatically DL + install all programs from the AUR; this will take a while.
sudo yay -Syu
# Supports colored output when you enable Color option in the /etc/pacman.conf file.
yay --removemake --cleanafter --sudoloop --clean -S w3m imagemagick hsetroot micro neofetch gtop polybar dmenu2 dunstify python-pywal i3lock-color-git grub-customizer chkboot nerd-fonts-complete pacmanity discord python-tempora python-portend python-cheroot mnemosyne brainworkshop pkgbrowser tor-browser

# Whatever Shell you get, replace zsh with your prefered shell.
which zsh
chsh -s /usr/bin/zsh
sudo chsh -s /usr/bin/zsh
# To check if user has zsh shell active:
tail /etc/passwd
# Additionally, you should get https://ohmyz.sh/
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# If you want root to have the same, you will have to repeat this after $ su
# Plugins for oh-my-zsh:
cd "${ZSH_CUSTOM1:-$ZSH/custom}/plugins" || return
git clone https://github.com/djui/alias-tips.git
git clone https://github.com/Valiev/almostontop.git
git clone https://github.com/arzzen/calc.plugin.zsh.git
git clone https://github.com/zdharma/fast-syntax-highlighting.git
git clone https://github.com/supercrabtree/k.git
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install # make sure this is appended to .zshrc: [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
git clone https://github.com/changyuheng/zsh-interactive-cd.git
# Source the .plugin.zsh files in your ~/.zshrc (done already in Caligula's dotfiles).
# Extra Ruby script to add icons to ls - https://github.com/athityakumar/colorls
gem install colorls

# Extra ranger initialization (to allow img2txt in the terminal).
ranger --copy-config=scope

# Bitmap fonts, DL these if pacman's terminus-font doesn't work.
cd ~ || return
git clone https://github.com/Tecate/bitmap-fonts.git
cd ~/bitmap-fonts || return
sudo cp -avr bitmap/ /usr/share/fonts
xset fp+ /usr/share/fonts/bitmap
fc-cache -fv
ln -s ~/.Xresources ~/.Xdefaults
xrdb ~/.Xresources
cd ~ || return
sudo rm -rf bitmap-fonts

# DL the dotfiles for all the programs (automatically into their right paths) from git repo.
cd /home || return
sudo git clone https://github.com/VivaCaligula/DOTFILES.git
sudo cp -vfr /home/DOTFILES/* ~/
sudo rm -rf /home/DOTFILES

# Atom Packages
# Themes: dark-flat-ui, outlander-syntax, northern-atom-syntax, northern-atom-ui
# Packages: sync-settings, teletype, minimap, pigments, minimap-pigments, color-picker, split-diff, minimap-split-diff, highlight-line, highlight-selected, atom-clock, activate-power-mode, tree-view-autoresize, emmet, file-icons, atom-live-server, atom-beautify, gpp-compiler, minimap-linter, linter-spell, linter-spell-html, linter-shellcheck, linter-csslint, linter-htmlhint, linter-markdown, linter-pylama, linter-cpplint, tool-bar, tool-bar-main
# Disable stuff in general settings but also Settings > Packages > Whitespace

# DL all your scripts.
cd ~ || return
git clone https://github.com/VivaCaligula/SCRIPTS.git
mv SCRIPTS scripts

# To download portable WinSCP - https://winscp.net/eng/download.php
# $ unzip WinSCP*Portable.zip

# So that you don't have to "$ sudo wifi-menu" every time.
sudo systemctl enable NetworkManager.service
# To replace vi with nano as the default text editor for commands such as visudo, set the VISUAL and EDITOR environment variables:
export VISUAL=nano
export EDITOR=nano

# Restart your computer, log in with your new DM into bspwm, and you're done.
systemctl reboot
