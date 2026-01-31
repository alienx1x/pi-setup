#!/bin/bash
set -e

echo "🚀 Pi setup starting..."

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

./system/hostname.sh

echo "✅ Hostname configured"
echo "🎉 Base install complete. Reboot recommended."
