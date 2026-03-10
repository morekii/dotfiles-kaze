#!/bin/bash
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin

# Definir directorios de DOTFILES y SISTEMA
DOT_WAYBAR="$HOME/dotfiles/.config/waybar"
DOT_FUZZEL="$HOME/dotfiles/.config/fuzzel"
DOT_KITTY="$HOME/dotfiles/.config/kitty"

SYS_WAYBAR="$HOME/.config/waybar"
SYS_FUZZEL="$HOME/.config/fuzzel"
SYS_KITTY="$HOME/.config/kitty"

# Detectar tema activo
CURRENT=$(readlink "$SYS_WAYBAR/style.css")

if [[ "$CURRENT" == *"dark"* ]]; then
    # === PASAR A LIGHT ===
    ln -sf "$DOT_WAYBAR/style-light.css" "$SYS_WAYBAR/style.css"
    ln -sf "$DOT_FUZZEL/fuzzel-light.ini" "$SYS_FUZZEL/fuzzel.ini"
    ln -sf "$DOT_KITTY/colors-light.conf" "$SYS_KITTY/colors.conf"
    
    # Transición de fondo fluida: Lanzamos y luego matamos el viejo
    swaybg -i /home/moreki/Pictures/Wallpapers/Japan/wallhaven-9o2opd.jpg -m fill &
    sleep 0.8
    pkill -o swaybg # Mata la instancia más vieja
    
else
    # === PASAR A DARK ===
    ln -sf "$DOT_WAYBAR/style-dark.css" "$SYS_WAYBAR/style.css"
    ln -sf "$DOT_FUZZEL/fuzzel-dark.ini" "$SYS_FUZZEL/fuzzel.ini"
    ln -sf "$DOT_KITTY/colors-dark.conf" "$SYS_KITTY/colors.conf"
    
    # Transición de fondo fluida
    swaybg -i /home/moreki/Pictures/Wallpapers/Anime/wallhaven-1q19l1.png -m fill &
    sleep 0.4
    pkill -o swaybg
fi

# Notificar cambios a las apps
pkill -USR2 waybar
pkill -USR1 kitty

# Forzar recarga de colores en Kitty si está abierta
if pgrep kitty > /dev/null; then
    kitty @ set-colors -a -c "$SYS_KITTY/colors.conf"
fi

#fallen angel: /home/moreki/Pictures/Wallpapers/Aesthethic/wallhaven-8g5w52.png
#nasa girl: /home/moreki/Pictures/Wallpapers/Anime/wallhaven-1q19l1.png
#eye girl: /home/moreki/Pictures/Wallpapers/Anime/wallhaven-e83jg8.jpg
#car store: /home/moreki/Pictures/Wallpapers/Japan/wallhaven-lyzly2.jpg
#cliff car: /home/moreki/Pictures/Wallpapers/Japan/wallhaven-9o2opd.jpg