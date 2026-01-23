#!/bin/bash

# Run yay -Syu in terminal
kitty -e yay -Syu

# After update finishes, refresh both update pills
pkill -RTMIN+8 waybar  # Refresh pacman updates
pkill -RTMIN+9 waybar  # Refresh AUR updates