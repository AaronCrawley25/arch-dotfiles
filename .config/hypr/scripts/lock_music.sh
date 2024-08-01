# Get player for nice icons
player=$(playerctl metadata --format "{{playerName}}")

[ $player = "spotify" ] && icon="" || icon="󰎆"

playerctl metadata --format "$icon {{title}} - {{artist}}"