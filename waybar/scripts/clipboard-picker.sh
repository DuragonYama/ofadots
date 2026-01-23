#!/bin/bash

PINS_FILE="$HOME/.config/waybar/clipboard-pins.txt"

# Create pins file if it doesn't exist
touch "$PINS_FILE"

# Build menu with pinned items first (if any exist)
if [ -s "$PINS_FILE" ]; then
    # Show pinned items with separator, then history
    {
        echo "=== PINNED ==="
        cat "$PINS_FILE"
        echo ""
        echo "=== HISTORY ==="
        cliphist list
    } | rofi -dmenu -p "Clipboard" -theme-str 'window {width: 50%;}' -i | {
        read -r selection
        # Skip if empty or separator
        if [[ -n "$selection" && "$selection" != "=== "* && "$selection" != "" ]]; then
            # Check if it's a pinned item
            if grep -Fxq "$selection" "$PINS_FILE"; then
                echo "$selection" | wl-copy
            else
                # It's from history, use cliphist decode
                echo "$selection" | cliphist decode | wl-copy
            fi
        fi
    }
else
    # No pins, just show history
    cliphist list | rofi -dmenu -p "Clipboard" -theme-str 'window {width: 50%;}' -i | cliphist decode | wl-copy
fi
