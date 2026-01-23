#!/bin/bash

PINS_FILE="$HOME/.config/waybar/clipboard-pins.txt"

# Count clipboard history items
history_count=$(cliphist list 2>/dev/null | wc -l)

# Count pinned items if file exists and is not empty
if [ -s "$PINS_FILE" ]; then
    pins_count=$(grep -v '^#' "$PINS_FILE" | grep -v '^$' | wc -l)
    # Total = pins + 2 separators + history
    total=$((pins_count + 2 + history_count))
else
    total=$history_count
fi

if [ "$total" -eq 0 ]; then
    echo '{"text":"0","tooltip":"Clipboard empty"}'
else
    echo "{\"text\":\"$total\",\"tooltip\":\"$total items in clipboard (${pins_count:-0} pinned, $history_count history)\"}"
fi
