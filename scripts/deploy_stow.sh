#!/bin/bash

# Directorios base
DOTFILES_DIR=$(realpath "$(dirname "$0")/..")
REPO_CONFIG_BASE="$DOTFILES_DIR/.config"
SYSTEM_CONFIG_BASE="$HOME/.config"

# Asegurar que el directorio de configuración del sistema exista
mkdir -p "$SYSTEM_CONFIG_BASE"

# Lista de apps a sincronizar (las que ya tenés en tu repo)
APPS=(
    "kitty"
    "fastfetch"
    "btop"
    "niri"
    "gtk-3.0"
    "gtk-4.0"
    "waybar"
    "swaync"
    "zsh"
    "nvim"
    "fuzzel"
    "nwg-look"
    "hypr"
    "tmux"
    "VSCodium"
    "cava"
)

echo "🛠️  Sincronizando Kaze desde dotfiles..."

for APP in "${APPS[@]}"; do
    REPO_APP_PATH="$REPO_CONFIG_BASE/$APP"
    SYSTEM_APP_PATH="$SYSTEM_CONFIG_BASE/$APP"

    # Verificamos que la carpeta exista en el repo antes de intentar vincularla
    if [ -d "$REPO_APP_PATH" ]; then
        echo "🔗 Vinculando $APP -> $SYSTEM_APP_PATH"
        
        # -s: simbólico
        # -n: si el destino es un link a un directorio, lo trata como archivo (evita anidamiento)
        # -f: fuerza la creación, eliminando si ya existía algo en $HOME/.config/$APP
        ln -snf "$REPO_APP_PATH" "$SYSTEM_APP_PATH"
    else
        echo "⚠️  Advertencia: No se encontró la carpeta de $APP en el repo ($REPO_APP_PATH). Saltando..."
    fi
done

echo "✅ ¡Kaze sincronizada y lista!"