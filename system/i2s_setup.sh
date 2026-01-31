#!/bin/bash
set -e

CONFIG_FILE="/boot/firmware/config.txt"

echo "🎛️ Ensuring Google Voice HAT overlay is enabled..."

# Check if overlay already exists
if grep -q "dtoverlay=googlevoicehat-soundcard" "$CONFIG_FILE"; then
    echo "✅ Overlay already present in config.txt"
else
    echo -e "\n# Enable Google Voice HAT\ndtoverlay=googlevoicehat-soundcard" | sudo tee -a "$CONFIG_FILE" > /dev/null
    echo "✅ Overlay added. Reboot required after install"
fi


