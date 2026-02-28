#!/bin/bash

# Directorios base
DOTFILES_DIR=$(realpath "$(dirname "$0")/..")
REPO_CONFIG_BASE="$DOTFILES_DIR/.config"
SYSTEM_CONFIG_BASE="$HOME/.config"

# Asegurar que exista ~/dotfiles/.config
mkdir -p "$REPO_CONFIG_BASE"

# Lista de apps a sincronizar
APPS=("kitty")

echo "🛠️  Sincronizando la Kaze..."

for APP in "${APPS[@]}"; do
    REPO_APP_PATH="$REPO_CONFIG_BASE/$APP"
    SYSTEM_APP_PATH="$SYSTEM_CONFIG_BASE/$APP"

    # MIGRACIÓN: Si está en el sistema pero no en el repo
    if [ -d "$SYSTEM_APP_PATH" ] && [ ! -L "$SYSTEM_APP_PATH" ] && [ ! -d "$REPO_APP_PATH" ]; then
        echo "📦 Migrando $APP a dotfiles/.config/..."
        mv "$SYSTEM_APP_PATH" "$REPO_CONFIG_BASE/"
    fi

    # VÍNCULO: Crear el enlace simbólico directo (Reemplaza a Stow)
    if [ -d "$REPO_APP_PATH" ]; then
        echo "🔗 Vinculando $APP..."
        # -s (simbólico), -n (trata carpetas como archivos), -f (fuerza/sobrescribe)
        ln -snf "$REPO_APP_PATH" "$SYSTEM_APP_PATH"
    fi
done

echo "✅ ¡Kaze lista y ordenada!"
