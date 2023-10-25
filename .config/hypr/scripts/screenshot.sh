#!/usr/bin/zsh

dir="$HOME/.config/rofi/powermenu/"
theme='powermenu'

confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 250px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Screenshots' \
		-mesg 'Select Region' \
		-theme ${dir}/${theme}.rasi
}

option=$(echo -e "󰍹\n󰊓" | confirm_cmd)
[ $option = "󰍹" ] && grim || grim -g "$(slurp)"