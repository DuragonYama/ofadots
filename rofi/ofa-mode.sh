#!/bin/bash

CONFIG="$HOME/.config/ofa/commands.conf"

if [ -z "$@" ]; then
    # List all OFA commands with > prefix
    while IFS='=' read -r name script; do
        [[ -z "$name" || "$name" =~ ^[[:space:]]*# ]] && continue
        name=$(echo "$name" | xargs)
        echo ">$name"
    done < "$CONFIG"
else
    # Execute selected command
    COMMAND="${@:1}"  # Remove > prefix if present
    COMMAND="${COMMAND#>}"
    
    SCRIPT=$(grep "^$COMMAND[[:space:]]*=" "$CONFIG" | cut -d'=' -f2- | xargs)
    
    if [ -n "$SCRIPT" ]; then
        SCRIPT="${SCRIPT/#\~/$HOME}"
        coproc (nohup bash "$SCRIPT" > /dev/null 2>&1 &)
        notify-send "OFA Command" "Executed: $COMMAND"
    fi
fi
