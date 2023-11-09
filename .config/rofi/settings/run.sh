#!/usr/bin/zsh
selected_option=$(echo "󰤥 Wifi\n󰂯 Bluetooth\n Audio" | rofi -dmenu -i -theme ~/.config/rofi/settings/settings.rasi -p "Settings")
[ $selected_option = "󰤥 Wifi" ] && networkmanager_dmenu
[ $selected_option = "󰂯 Bluetooth" ] && rofi-bluetooth
[ $selected_option = " Audio" ] && ~/.config/rofi/settings/run_audio.sh