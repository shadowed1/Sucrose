#!/bin/bash
# ChromeOS Elevate Daemon
# shadowed1

CMD_FILE="/usr/local/.elevate.cmds"

sudo touch "$CMD_FILE"
sudo chown 1000:1000 "$CMD_FILE"
sudo chmod 600 "$CMD_FILE"

echo ""
echo "[elevate-daemon] Listening on $CMD_FILE"
echo ""

tail -F "$CMD_FILE" | while read -r cmd; do
    cmd="$(echo "$cmd" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"
    [[ -z "$cmd" ]] && continue
    echo "[elevate-daemon] Running: $cmd"
    bash -c "$cmd"
done
