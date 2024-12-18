#!/bin/bash

sudo pacman -Syyu
sudo pacman -S git nvidia base-devel go

cd
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si
