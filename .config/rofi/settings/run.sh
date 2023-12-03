#!/usr/bin/zsh

DND=$([ $(dunstctl is-paused) = 'true' ] && echo '󰂛' || echo '󰂚')
selected_option=$(echo "󰤥 Wifi\n󰂯 Bluetooth\n󰍹 Display\n$DND Do Not Disturb\n Audio" | rofi -dmenu -i -theme ~/.config/rofi/settings/settings.rasi -p "Settings")
[ $selected_option = "󰤥 Wifi" ] && networkmanager_dmenu
[ $selected_option = "󰂯 Bluetooth" ] && rofi-bluetooth
[ $selected_option = "󰍹 Display" ] && nwg-displays
[ $selected_option = "$DND Do Not Disturb" ] && dunstctl set-paused toggle && pkill -RTMIN+8 waybar
[ $selected_option = " Audio" ] && ~/.config/rofi/settings/run_audio.py
