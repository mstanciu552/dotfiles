#!/bin/bash

dunst &
picom &
nitrogen --restore
killall -q polybar
polybar sc0p3 &
i3-battery-popup -n -D -L 20 -l 10
