#!/usr/bin/zsh
current_option=$(powerprofilesctl get)

if [[ $current_option == "performance" ]]; then
    current_index=0
elif [[ $current_option == "balanced" ]]; then
    current_index=1
elif [[ $current_option == "power-saver" ]]; then
    current_index=2
fi

selected_option=$(printf "  Performance\n  Balanced\n  Power Saver" | rofi -dmenu -i -theme ~/.config/rofi/settings/settings.rasi -p "Settings" -a $current_index)

[[ $selected_option == "  Performance" ]] && powerprofilesctl set performance
[[ $selected_option == "  Balanced" ]] && powerprofilesctl set balanced
[[ $selected_option == "  Power Saver" ]] && powerprofilesctl set power-saver