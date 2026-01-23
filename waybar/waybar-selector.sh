#!/bin/bash

CONFIG_DIR="$HOME/.config/waybar"

# Find all theme directories
THEMES=()
for dir in "$CONFIG_DIR"/*/ ; do
    if [ -d "$dir" ] && [ -f "$dir/config" ]; then
        THEMES+=("$(basename "$dir")")
    fi
done

# Show rofi menu
CHOICE=$(printf '%s\n' "${THEMES[@]}" | rofi -dmenu -p "Select Waybar Theme")

if [ -n "$CHOICE" ]; then
    # Copy files
    cp "$CONFIG_DIR/$CHOICE/config" "$CONFIG_DIR/config"
    cp "$CONFIG_DIR/$CHOICE/style.css" "$CONFIG_DIR/style.css"
    
    # Kill waybar
    killall waybar
    
    # Wait for it to fully die
    while pgrep -x waybar > /dev/null; do sleep 0.1; done
    
    # Start waybar fresh
    waybar > /dev/null 2>&1 &
    
    notify-send "Waybar" "Switched to $CHOICE" -t 2000
fi