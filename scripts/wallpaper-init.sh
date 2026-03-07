#!/bin/bash
WAYBAR_STYLE="$HOME/.config/waybar/style.css"

# Si el link apunta a light, pone el fondo light, sino el dark
if [[ $(readlink "$WAYBAR_STYLE") == *"light"* ]]; then
    swaybg -m fill -i /home/moreki/Pictures/Wallpapers/Anime/wallhaven-e83jg8.jpg &
else
    swaybg -m fill -i /home/moreki/Pictures/Wallpapers/Anime/wallhaven-1q19l1.png &
fi