#!/usr/bin/bash

# Get player to determine whether to use spotify specific stuff
player=$(playerctl metadata --format "{{playerName}}")

[ -z $* ] && exit

if [ $* == "--text" ]; then
    [ $player == "spotify" ] && icon="" || icon="󰎆"
    playerctl metadata --format "$icon {{title}} - {{artist}}"
elif [ $* == "--art" ]; then
    # Get URL
    url=$(playerctl metadata --format "{{mpris:artUrl}}")
    
    # If its spotify download the album art
    if [ $player == "spotify" ]; then
        trackid=$(playerctl metadata --format "{{mpris:trackid}}")
        basepath="$HOME/.cache/lockart"
        fullpath="$basepath$trackid"
        
        [ ! -f $fullpath ] && wget -q $url -O $fullpath &
        echo $fullpath
    fi
else
    echo Incorrect Arguments
fi
