#!/usr/bin/bash
# changeVolume

# Arbitrary but unique message tag
msgTag="myvolume"

# Change volume or toggle mute through wireplumber, depending on input
[[ $@ != "MUTE" ]] && wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ $@ || wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

# Query wireplumber for the current volume and whether or not the speaker is muted
volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed 's/[^0-9.]*\([0-9.]*\).*/\1/' | awk '{printf "%d\n", $1 * 100}')
mute=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed -n 's/.*\b\(MUTED\)\b.*/\1/p')
if [[ $volume == 0 || "$mute" == "MUTED" ]]; then
    # Show the sound muted notification
    dunstify -a "󰕾 Change Volume" -u low -i audio-volume-muted -h string:x-dunst-stack-tag:$msgTag "Volume muted" 
else
    # Show the volume notification
    dunstify -a "󰕾 Change Volume" -u low -i audio-volume-high -h string:x-dunst-stack-tag:$msgTag \
    -h int:value:"$volume" "Volume: ${volume}%"
fi

# Play the volume changed sound
canberra-gtk-play -i audio-volume-change -d "changeVolume" -V 10