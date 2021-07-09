#!/bin/bash

# Check if argument exists
if [ -z $1]
then
  echo "Usage: ./install.sh <deb/arch>"
  exit
fi

general () {
  # Rust
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

  ## GENERAL ##
  # Dotfiles
  cd ~
  git clone https://github.com/mstanciu552/dotfiles

  if [ -d "~/.config" ]
  then
    mkdir ~/.config  
  fi

  cp ~/dotfiles/* ~/.config -r

  # Wallpapers
  cd ~/Pictures/
  git clone https://github.com/mstanciu552/wallpapers

  # vim-plug 
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

  # OMF
  curl -L https://get.oh-my.fish | fish

  ## END GENERAL ##
}

if [[ $1 == "deb" ]] 
then
  ## UPGRADE ##
  sudo apt update
  sudo apt upgrade -y
  ## END UPGRADE ##

    ## INSTALLATIONS DEBIAN##
    sudo apt install fish zsh alacritty nodejs npm python3-pip tmux git stacer 

    sudo apt install ulauncher timeshift gnome-tweaks gnome-shell-extensions chrome-gnome-shell

    sudo snap install wine bat batcat slimbookbattery tlp

    # Microsoft Teams
    wget https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.3.00.5153_amd64.deb
    apt install ./teams_1.3.00.5153_amd64.deb

    # Snap
    sudo snap install discord
    # sudo snap install wps-office  
    # sudo snap connect wps-office:removable-media
    sudo snap install wps-office-multilang
    sudo snap install spotify

    general

    sudo apt autoremove

## END INSTALLATIONS DEBIAN ##
else


## INSTALLATIONS ARCH ##
# TODO Figure out microsoft fonts
sudo pacman -Syu

sudo pacman -S base-devel git python3-pip nodejs npm neovim vim tmux fish zsh
sudo pacman -S alacritty slimbookbattery tlp bat bat eax ttf-fira-code

# FISH and OMF
sudo pacman -S fish

# AUR
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R sc0p3:sc0p3 ./yay-git
cd yay-git
makepkg -si
yay -Syu --devel --timeupdate
sudo yay -Yc

# SNAP
cd ~
git clone https://aur.archlinux.org/snapd.git
cd snapd
makepkg -si

sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

general

## END INSTALLATIONS ARCH ##
fi


