#!/usr/bin/bash
sleep 5
hyprctl keyword misc:focus_on_activate false
discord &
spotify &
sleep 30
hyprctl keyword misc:focus_on_activate true