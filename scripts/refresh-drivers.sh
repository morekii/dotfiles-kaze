#!/bin/bash
# Script para reinstalar drivers MediaTek tras una actualización de kernel

WIFI_PATH="/usr/local/src/drivers/wifi-driver"
BT_PATH="/usr/local/src/drivers/bt-driver"

echo "🚀 Iniciando reinstalación de drivers para el kernel $(uname -r)..."

# Procesar Wi-Fi
if [ -d "$WIFI_PATH" ]; then
    echo "📶 Recompilando Wi-Fi..."
    cd "$WIFI_PATH" && sudo make clean && sudo make && sudo make install
else
    echo "❌ No se encontró la carpeta de Wi-Fi en $WIFI_PATH"
fi

# Procesar Bluetooth
if [ -d "$BT_PATH" ]; then
    echo "🦷 Recompilando Bluetooth..."
    cd "$BT_PATH" && sudo make clean && sudo make && sudo make install
else
    echo "❌ No se encontró la carpeta de Bluetooth en $BT_PATH"
fi

echo "✅ Proceso completado. Se recomienda reiniciar para aplicar cambios."
