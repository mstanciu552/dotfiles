#!/bin/bash
id_windows=$(bspc query -N -n .window)
id_focused=$(bspc query -N -n)

format_underline() {
	echo -n "%{u#0a6cf5}%{+u}$(shorten "$1")%{-u}   "
}

format_action() {
	echo -n "%{A1:$1:}"$(shorten "$(xtitle $2)")"%{A}   "
}

shorten() {
	echo $(echo "$1" | cut -c1-20)
}

main() {
	IFS=$'\n' read -rd '' -a ARR <<<"$id_windows"
	if [[ ${#ARR[@]} -lt 1 ]]; then
		echo -n ""
		return
	fi
	for w in "${ARR[@]}"; do
		if [[ $w == $id_focused ]]; then
			format_underline "$(xtitle $w)"
		else
			command="bspc node -f $w"
			format_action "$command" $w
		fi
	done

}

if [[ main ]]; then
	main
else
	echo -n ""
fi
