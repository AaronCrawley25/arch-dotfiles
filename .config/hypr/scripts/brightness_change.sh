#!/bin/bash
# changeBrightness

# Arbitrary but unique message tag
msgTag="mybrightness"
incAmount=10
fps=60

# Change the volume using acpilight (xbacklight binary)
[[ $@ == "DEC" ]] && xbacklight -dec $incAmount -fps $fps || xbacklight -inc $incAmount -fps $fps

# Get the new brightness and create notification
percent=$(xbacklight -get)
dunstify -a "󰖨 Change Brightness" -u low -i brightness-change -h string:x-dunst-stack-tag:$msgTag \
    -h int:value:"$percent" "Brightness: ${percent}%"