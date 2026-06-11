#!/bin/bash
# Evita doble instancia y apaga los monitores luego del lock
pgrep -x hyprlock > /dev/null || hyprlock &
sleep 0.5
niri msg action power-off-monitors
