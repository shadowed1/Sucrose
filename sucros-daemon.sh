#!/bin/bash
# Sucros Daemon
# shadowed1

FIFO="/home/chronos/.sucros.fifo"

rm -f "$FIFO" 2>/dev/null
mkfifo "$FIFO"
chown 1000:1000 "$FIFO"
chmod 600 "$FIFO"

echo
echo "[elevate-daemon] Listening on $FIFO"
echo

while true; do
    if IFS= read -r cmd <"$FIFO"; then
        cmd="${cmd#"${cmd%%[![:space:]]*}"}"
        cmd="${cmd%"${cmd##*[![:space:]]}"}"
        [[ -z "$cmd" ]] && continue

        echo "[elevate-daemon] Running: $cmd" >/dev/tty
        /bin/bash -c "$cmd"
    fi
done
