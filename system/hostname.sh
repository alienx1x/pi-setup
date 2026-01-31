#!/bin/bash
set -e

source ./config/env

echo "🔧 Setting hostname to: $HOSTNAME"

echo "$HOSTNAME" | sudo tee /etc/hostname > /dev/null

sudo sed -i "s/^127.0.1.1.*/127.0.1.1\t$HOSTNAME/" /etc/hosts

sudo hostnamectl set-hostname "$HOSTNAME"
