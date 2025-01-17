killall -q polybar
polybar i3 &
dunst &
picom --experimental-backends &
~/.config/i3/wallpaper.sh

i3-battery-popup -n -D -L 20 -l 10
# watch -n 600 ~/.config/i3/full_battery

# Polkit for KDE
bash /usr/lib/polkit-kde-authentication-agent-1
