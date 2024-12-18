#!/bin/bash

pgrep -x sxhkd >/dev/null || sxhkd &

killall -q polybar
kill -9 $(pgrep -f 'polybar') >/dev/null 2>&1
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar bspwm &

killall -q dunst
dunst &

picom --experimental-backends &

~/.config/i3/wallpaper.sh
i3-battery-popup -n -D -L 20 -l 10
