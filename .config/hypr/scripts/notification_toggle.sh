#!/usr/bin/bash
dunstctl set-paused toggle
pkill -RTMIN+8 waybar
[ $(dunstctl get-pause-level) -eq 0 ] && dunstify -a "󰂚 Enabled Notifications" -u low -i dialog-information \
    -h string:x-dunst-stack-tag:notifToggle "Notifications have been unpaused and will appear again."