#!/bin/bash

windows=$(xtitle $(bspc query -N -n .window))
id_windows=$(bspc query -N -n .window)
focused=$(xtitle $(bspc query -N -n))
id_focused=$(bspc query -N -n)
win_id=$(wmctrl -lx | awk '{$2=$3=$4=" ";print}')

format_underline() {
	echo -n "%{u#0a6cf5}%{+u}$(shorten "$1")%{-u}   "
}

shorten() {
	echo $(echo "$1" | cut -c1-20)
}

add_action() {
	IFS=$'\n' read -rd '' -a ARR <<<"$id_windows"
	for w in "${ARR[@]}"; do
		if [[ $w == $id_focused ]]; then
			format_underline "$(xtitle $w)"
		else
			echo -n "%{A1:bspc node -f $w:}"$(shorten "$(xtitle $w)")"%{A}   "
		fi
	done

}

add_action
