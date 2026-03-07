echo 'export ZDOTDIR=$HOME/.config/zsh' > ~/.zshenv
# Agrega la ruta de aplicaciones Flatpak a tu sesión
export XDG_DATA_DIRS=$XDG_DATA_DIRS:$HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share 