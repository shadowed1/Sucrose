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

sudo chmod +x "$BIN_DIR/sucrose"
sudo chmod +x "$BIN_DIR/sucrose-daemon"

BASHRC="$HOME/.bashrc"

sed -i '/^# <<< SUCROSE SUDO MARKER <<</,/^# <<< END SUCROSE SUDO MARKER <<</d' "$BASHRC"

{
    echo "# <<< SUCROSE SUDO MARKER <<<"
    echo '# Auto-alias sudo to sucrose tester'
    echo 'sudo_output=$(sudo --version 2>&1 | head -n1)'
    echo 'if [[ "$sudo_output" == "sudo: The \"no new privileges\""* ]]; then'
    echo "    alias sudo='sucrose'"
    echo 'else'
    echo '    unalias sudo 2>/dev/null'
    echo 'fi'
    echo "# <<< END SUCROSE SUDO MARKER <<<"
} >> "$BASHRC"

echo "[+] Sucrose sudo alias logic added to $BASHRC"


echo "[sucrose] Installation complete"
echo "[sucrose] Run: sudo sucrose-daemon in VT-2 logged in as chronos"
