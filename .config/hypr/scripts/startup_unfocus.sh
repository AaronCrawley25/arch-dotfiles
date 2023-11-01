#!/bin/sh
hyprctl keyword misc:focus_on_activate false
discord &
spotify &
sleep 10
hyprctl keyword misc:focus_on_activate true