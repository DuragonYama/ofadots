#!/bin/bash

# Check for AUR updates (works with yay or paru)
if command -v yay &> /dev/null; then
    aur_updates=$(yay -Qua 2>/dev/null)
elif command -v paru &> /dev/null; then
    aur_updates=$(paru -Qua 2>/dev/null)
else
    echo '{"text":"?","tooltip":"No AUR helper found (install yay or paru)"}'
    exit 0
fi

if [ -z "$aur_updates" ]; then
    echo '{"text":"0","tooltip":"AUR packages up to date"}'
else
    count=$(echo "$aur_updates" | wc -l)
    packages=$(echo "$aur_updates" | head -20 | awk '{print $1}' | tr '\n' ' ')
    echo "{\"text\":\"$count\",\"tooltip\":\"AUR Updates: $packages\"}"
fi
