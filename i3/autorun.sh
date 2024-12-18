#!/bin/bash

export GTK_THEME=Adwaita:dark

# killall -q polybar
# polybar i3 &
dunst &
picom &

blueman-applet &

# Monitor layout generated by arandr
xrandr --output DisplayPort-0 --off --output DisplayPort-1 --off --output DisplayPort-2 --mode 1280x1024 --pos 1920x0 --rotate normal --output HDMI-A-0 --mode 1920x1080 --pos 0x0 --rotate normal

# change wallpaper
~/.config/i3/wallpaper.sh

