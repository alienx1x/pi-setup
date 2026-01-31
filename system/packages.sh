#!/bin/bash
set -e

echo "📦 Installing required packages..."

sudo apt update

sudo apt install -y \
  curl \
  git \
  ffmpeg \
  alsa-utils \
  i2c-tools

echo "✅ Packages installed"
