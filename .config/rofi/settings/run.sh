#!/usr/bin/zsh

Wifi="󰤥 Wifi"
Bluetooth="󰂯 Bluetooth"
Display="󰍹 Display"
DND="$([ $(dunstctl is-paused) = 'true' ] && echo '󰂛' || echo '󰂚') Do Not Disturb"
Audio=" Audio"
Power="⏻ Power Profiles"
Printers="󰐪 Printers"
Config=" Configs"
Updates=" Updates"

selected_option=$(printf "$Wifi\n$Bluetooth\n$Display\n$DND\n$Audio\n$Power\n$Printers\n$Config\n$Updates" | rofi -dmenu -i -theme ~/.config/rofi/settings/settings.rasi -p "Settings")
[ $selected_option = $Wifi ] && networkmanager_dmenu
[ $selected_option = $Bluetooth ] && rofi-bluetooth
[ $selected_option = $Display ] && nwg-displays
[ $selected_option = $DND ] && ~/.config/hypr/scripts/notification_toggle.sh
[ $selected_option = $Audio ] && ~/.config/rofi/settings/run_audio.py
[ $selected_option = $Power ] && ~/.config/rofi/settings/run_power.sh
[ $selected_option = $Printers ] && xdg-open http://localhost:631
[ $selected_option = $Config ] && $VISUAL $HOME/.config
[ $selected_option = $Updates ] && kitty man pacman
