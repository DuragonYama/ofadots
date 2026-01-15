#!/usr/bin/env bash

# Wallpaper directory
WALLPAPER_DIR="$HOME/.config/hypr/wallpapers"
STATE_FILE="$HOME/.config/hypr/wallpapers/shuffle_state.txt"

# Get all wallpapers (jpg, png, webp)
mapfile -t wallpapers < <(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.webp" \))

# Load used wallpapers from previous sessions
if [[ -f "$STATE_FILE" ]]; then
    mapfile -t used < "$STATE_FILE"
else
    used=()
fi

# Find unused wallpapers
available=()
for wp in "${wallpapers[@]}"; do
    if [[ ! " ${used[*]} " =~ " $wp " ]]; then
        available+=("$wp")
    fi
done

# If all wallpapers used, reset the cycle
if [[ ${#available[@]} -eq 0 ]]; then
    used=()
    available=("${wallpapers[@]}")
fi

# Pick random from available
selected="${available[RANDOM % ${#available[@]}]}"

# Set wallpaper with swaybg
pkill swaybg
swaybg -i "$selected" -m fill &

# Mark this wallpaper as used
used+=("$selected")
printf "%s\n" "${used[@]}" > "$STATE_FILE"
