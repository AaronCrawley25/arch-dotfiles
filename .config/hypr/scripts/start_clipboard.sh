rm $HOME/.cache/cliphist/db # Wipe clipboard history FULLY
wl-paste --type text --watch cliphist store & # Stores only text data
wl-paste --type image --watch cliphist store & # Stores only image data