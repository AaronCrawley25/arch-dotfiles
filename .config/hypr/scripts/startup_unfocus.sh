#!/bin/sh
hyprctl keyword misc:focus_on_activate false
discord &
spotify &
sleep 15
hyprctl keyword misc:focus_on_activate true