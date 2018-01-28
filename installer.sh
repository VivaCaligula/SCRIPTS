#!/bin/bash
#===========================================#
#     Caligula's auto-installer script.     #
#===========================================#

# This is an installer script for graphical environments, tools, and other shit.
# It's assumed you've already installed Arch and enabled the AUR, xserver, etc.
# If you haven't, do that real quick - https://gist.github.com/VivaCaligula/65a0e3489ec110ed08d31027b1065d4d
# Additionally, you can autorun this script remotely by doing:
# $ curl https://raw.githubusercontent.com/VivaCaligula/SCRIPTS/master/installer.sh | bash

# Refresh repositories and keyring.
sudo pacman-key --refresh-keys
sudo pacman -Syu
sudo yaourt -Syu

# Automatically dl + install all the programs you want from the arch repo; this will take a while.
# Replace gdm with whatever your prefered DM is (as well as other prefered programs).
sudo pacman --color always --force --noconfirm -S git zip unrar ntp openssh openvpn zsh rxvt-unicode python-pip ttf-dejavu poppler inkscape fontforge awesome-terminal-fonts gnome gnome-tweak-tool networkmanager networkmanager-openvpn bspwm sxhkd termite termite-terminfo feh compton ranger tmux htop scrot nmap firefox chromium keepassxc atom vim powerline-fonts terminus-font screenfetch vlc phonon-qt4-vlc electrum hexchat transmission-qt libreoffice-still obs-studio ffmpeg gimp bleachbit checksec extundelete mpd ncmpcpp cmatrix thunar cool-retro-term dunst redshift gimp wine steam kodi nethack dwarffortress shellcheck
# dmenu replaced with patched dmenu2 in AUR
sudo systemctl enable gdm.service

# Automatically DL + install all programs from the AUR; this will take a while.
yaourt --color --force --noconfirm -S w3m imagemagick hsetroot micro neofetch gtop polybar dmenu2 dunstify python-pywal i3lock-color-git grub-customizer chkboot nerd-fonts-complete pacmanity discord-canary python-tempora python-portend python-cheroot mnemosyne brainworkshop keybase-bin pkgbrowser ghostwriter

# Whatever Shell you get, replace zsh with your prefered shell.
which zsh
chsh -s /usr/bin/zsh
sudo chsh -s /usr/bin/zsh
# To check if user has zsh shell active:
tail /etc/passwd
# Additionally, you should get http://ohmyz.sh/
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

# To use GTK-like theme with Qt edit ~/.config/Trolltech.conf and set
#   [Qt]
#   style=GTK+
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
git clone https://github.com/VivaCaligula/DOTFILES.git
sudo mv -vf /home/DOTFILES/* ~/
sudo rm -rf /home/DOTFILES
# $ polybar -r bar_name # Refreshes polybar's cache.

# Atom Packages
# Themes: dark-flat-ui, outlander-syntax, northern-atom-syntax, northern-atom-ui
# Packages: Teletype, Minimap, Pigments, minimap-pigments, color-picker, split-diff, minimap-split-diff, highlight-line, highlight-selected, atom-clock, activate-power-mode, tree-view-autoresize, linter-shellcheck
# Disable stuff in general settings but also Settings > Packages > Whitespace

# DL all your scripts.
cd ~ || return
git clone https://github.com/VivaCaligula/SCRIPTS.git
mv SCRIPTS scripts

# To download the torbrowser.
# Download the tarball from - https://www.torproject.org/download/download-easy.html.en#linux
# $ cd ~/Downloads 
# $ tar -xf tor-whatever
# To download portable WinSCP - https://winscp.net/eng/download.php
# $ unzip WinSCP*Portable.zip
# To download Glances - https://nicolargo.github.io/glances/
curl -L https://bit.ly/glances | /bin/bash
rm glances

# So that you don't have to "$ sudo wifi-menu" every time.
sudo systemctl enable NetworkManager.service
# To replace vi with nano as the default text editor for commands such as visudo, set the VISUAL and EDITOR environment variables:
# export VISUAL=nano
# export EDITOR=nano

# Restart your computer, log in with your new DM into bspwm, and you're done.
systemctl reboot
