#!/usr/bin/bash

dir="$HOME/.config/rofi/powermenu/"
theme='powermenu'
msgTag='screenshot'
sleepDelay=0.5

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

fullscreen() {
	sleep $sleepDelay
	display=$(hyprctl activeworkspace | awk -F'on monitor ' '/on monitor/ {split($2, a, ":"); print a[1]}')
	grim -o "$display" - | tee $filename | wl-copy -t image/png
}

region() {
	location=$(slurp)
	sleep $sleepDelay
	grim -g "$location" - | tee $filename | wl-copy -t image/png
}

option=$(echo -e "󰍹\n󰊓" | confirm_cmd)
filename="$GRIM_DEFAULT_DIR/$(date +"%Y%m%d_%Hh%Mm%Ss")_grim.png"
[ $option = "󰍹" ] && fullscreen || $( [ $option = "󰊓" ]  && region )

action=$(dunstify -a "󰹑 Screenshot" -u low -I "$filename" \
	-A "default,Open" -h string:x-dunst-stack-tag:$msgTag \
	"Screenshot copied to clipboard! You can also click this notification to open it!")

[[ "$action" == "default" ]] && xdg-open $filename