#!/bin/bash

# Pre-configured colors
COLORS=(
    "Red:#ff0000"
    "Blue:#0088ff"
    "Green:#00ff88"
    "Purple:#aa00ff"
    "Orange:#ff8800"
    "Cyan:#00ffff"
    "Pink:#ff0088"
    "Yellow:#ffd700"
)

# Function to convert hex to rgb
hex_to_rgb() {
    local hex=$1
    hex=${hex#"#"}
    printf "%d, %d, %d" $((16#${hex:0:2})) $((16#${hex:2:2})) $((16#${hex:4:2}))
}

# Show rofi menu
CHOICE=$(printf '%s\n' "${COLORS[@]}" | cut -d: -f1 | rofi -dmenu -p "Choose Color")

# Get the hex color
NEW_COLOR=$(printf '%s\n' "${COLORS[@]}" | grep "^$CHOICE:" | cut -d: -f2)

if [ -n "$NEW_COLOR" ]; then
    # List of colors to search and replace
    OLD_COLORS=("#ff0000" "#0088ff" "#00ff88" "#aa00ff" "#ff8800" "#00ffff" "#ff0088" "#ffd700")
    
    # Update theme folders AND active config
    for theme in minimal maximal ""; do
        if [ -z "$theme" ]; then
            CSS_FILE="$HOME/.config/waybar/style.css"
        else
            CSS_FILE="$HOME/.config/waybar/$theme/style.css"
        fi
        
        # Replace any old accent color with new one
        for old_color in "${OLD_COLORS[@]}"; do
            [ "$old_color" = "$NEW_COLOR" ] && continue
            
            # Replace hex colors
            sed -i "s/${old_color}/${NEW_COLOR}/gi" "$CSS_FILE"
            
            # Replace rgba versions for transparency
            old_rgb=$(hex_to_rgb "$old_color")
            new_rgb=$(hex_to_rgb "$NEW_COLOR")
            sed -i "s/rgba(${old_rgb},/rgba(${new_rgb},/g" "$CSS_FILE"
        done
    done
    
    # Force waybar reload
    killall waybar
    while pgrep -x waybar > /dev/null; do sleep 0.1; done
    waybar > /dev/null 2>&1 &
    
    notify-send "Waybar" "Color changed to $CHOICE" -t 2000
fi