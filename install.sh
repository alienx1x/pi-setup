#!/bin/bash
set -e

echo "🚀 Pi setup starting..."

# Check config/env
if [ ! -f "./config/env" ]; then
  echo "❌ config/env not found"
  echo "👉 Run: cp config/env.example config/env && nano config/env"
  exit 1
fi

source ./config/env

if [ -z "$HOSTNAME" ]; then
  echo "❌ HOSTNAME is not set in config/env"
  exit 1
fi

echo "✅ Config loaded"
echo "➡️ Hostname will be: $HOSTNAME"

# Configure hostname
./system/hostname.sh

# Install packages
./system/packages.sh

echo "✅ Hostname configured and packages installed"

# Enable Google Voice HAT / I2S mic
./system/i2s_setup.sh

echo "✅ I2S mic overlay configured (reboot required)"

echo "🎉 Base install complete. Please reboot to activate the I2S microphone:"
echo "   sudo reboot"

# Enable Tailscale auto-start
echo "➡️ Enabling Tailscale..."
sudo systemctl enable tailscaled
sudo systemctl start tailscaled
echo "✅ Tailscale started and enabled"



# Setup mic streaming service
echo "➡️ Setting up mic streaming..."
sudo cp ./system/mic-stream.service /etc/systemd/system/mic-stream.service
sudo systemctl daemon-reload
sudo systemctl enable mic-stream.service
sudo systemctl start mic-stream.service
echo "🎤 Mic streaming service enabled and started"


