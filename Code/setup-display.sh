#!/bin/bash

# Cyberdeck Display Setup Script
# Configures DSI display as primary output on Raspberry Pi 5 with Kali Linux

set -e

echo "[*] Setting up DSI display..."

# Create lightdm config directory if it doesn't exist
mkdir -p /etc/lightdm/lightdm.conf.d

# Write display config
cat > /etc/lightdm/lightdm.conf.d/01-display.conf << 'EOF'
[Seat:*]
display-setup-script=xrandr --output HDMI-1 --off --output DSI-1-2 --primary --mode 800x480
EOF

echo "[+] Display config written to /etc/lightdm/lightdm.conf.d/01-display.conf"

# Enable SSH on boot
systemctl enable ssh

echo "[+] SSH enabled on boot"

echo "[*] Setup complete. Reboot to apply changes."