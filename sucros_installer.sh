#!/bin/bash
# sucros installer
# shadowed1

set -e
echo "[sucros] Installing..."
BIN_DIR="/usr/local/bin"
INIT_DIR="/etc/init"
mkdir -p "$BIN_DIR"

curl -fsSL https://raw.githubusercontent.com/shadowed1/sucros/main/sucros.sh -o "$BIN_DIR/sucros"
curl -fsSL https://raw.githubusercontent.com/shadowed1/sucros/main/sucros-daemon.sh -o "$BIN_DIR/sucros-daemon"
curl -fsSL https://raw.githubusercontent.com/shadowed1/sucros/main/sucros.conf -o "$INIT_DIR/sucros.conf"

chmod 755 "$BIN_DIR/sucros"
chmod 755 "$BIN_DIR/sucros-daemon"

echo "[sucros] Installation complete"
echo "[sucros] Run: sudo sucros-daemon in VT-2 logged in as chronos"
