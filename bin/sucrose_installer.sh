#!/bin/bash
# sucrose Installer
# shadowed1

set -e
echo "[sucrose] Installing..."
BIN_DIR="/usr/local/bin"
INIT_DIR="/etc/init"
mkdir -p "$BIN_DIR"

curl -fsSL https://raw.githubusercontent.com/shadowed1/sucrose/main/bin/sucrose.sh -o "$BIN_DIR/sucrose"
curl -fsSL https://raw.githubusercontent.com/shadowed1/sucrose/main/bin/sucrose-daemon.sh -o "$BIN_DIR/sucrose-daemon"
#curl -fsSL https://raw.githubusercontent.com/shadowed1/sucrose/main/bin/sucrose.conf -o "$INIT_DIR/sucrose.conf"

sudo chmod +x "$BIN_DIR/sucrose"
sudo chmod +x "$BIN_DIR/sucrose-daemon"

echo "[sucrose] Installation complete"
echo "[sucrose] Run: sudo sucrose-daemon in VT-2 logged in as chronos"
