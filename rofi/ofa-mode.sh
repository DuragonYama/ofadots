#!/bin/bash
CONFIG="$HOME/.config/ofa/commands.conf"

if [ -z "$@" ]; then
    while IFS='=' read -r name script; do
        [[ -z "$name" || "$name" =~ ^[[:space:]]*# ]] && continue
        name=$(echo "$name" | xargs)
        echo ">$name"
    done < "$CONFIG"
else
    COMMAND="${@:1}"
    COMMAND="${COMMAND#>}"
    
    SCRIPT=$(grep "^$COMMAND[[:space:]]*=" "$CONFIG" | cut -d'=' -f2- | xargs)
    
    if [ -n "$SCRIPT" ]; then
        SCRIPT="${SCRIPT/#\~/$HOME}"
        notify-send "OFA: $COMMAND" -t 2000
        coproc (nohup sh -c "$SCRIPT" > /dev/null 2>&1 &)
    fi
fi
