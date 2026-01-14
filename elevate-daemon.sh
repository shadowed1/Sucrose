#!/bin/bash
# ChromeOS Elevate Daemon
# shadowed1

FIFO="/usr/local/elevate/elevate.fifo"
echo "[elevate-daemon] Listening on $FIFO"

while true; do
    if read -r cmd < "$FIFO"; then
        [[ -z "$cmd" ]] && continue
        echo "[daemon] Executing: $cmd"
        sudo bash -c "$cmd"
    fi
done
