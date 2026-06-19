#!/bin/bash

echo "================================"
echo "  ofaDotfiles Installation"
echo "================================"
echo ""

# Check if running on Arch-based system
if ! command -v pacman &> /dev/null; then
    echo "ERROR: This script requires pacman (Arch Linux)"
    exit 1
fi

# Check if yay is installed for AUR packages
if ! command -v yay &> /dev/null; then
    echo "WARNING: yay not found. Install yay first to install AUR packages."
    echo ""
    read -p "Continue without yay? (y/N): " continue_without_yay
    if [[ ! $continue_without_yay =~ ^[Yy]$ ]]; then
        exit 1
    fi
    SKIP_AUR=true
fi

echo ""
echo "Choose installation type:"
echo "1) Minimal  - Only packages needed for configs to work (22 packages)"
echo "2) Full     - Minimal + productivity tools (105 packages)"
echo "3) Skip package installation (only copy configs)"
echo ""
read -p "Enter choice [1-3]: " choice

case $choice in
    1)
        echo ""
        echo "Installing minimal packages..."
        sudo pacman -S --needed - < pkglist-minimal.txt
        if [ "$SKIP_AUR" != true ]; then
            yay -S --needed - < aurlist-minimal.txt
        fi
        ;;
    2)
        echo ""
        echo "Installing full packages..."
        sudo pacman -S --needed - < pkglist.txt
        if [ "$SKIP_AUR" != true ]; then
            yay -S --needed - < aurlist.txt
        fi
        ;;
    3)
        echo ""
        echo "Skipping package installation..."
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

echo ""
echo "Copying configuration files to ~/.config/..."
mkdir -p ~/.config

cp -r hypr ~/.config/
cp -r waybar ~/.config/
cp -r rofi ~/.config/
cp -r kitty ~/.config/
cp -r nvim ~/.config/
cp -r gtk-3.0 ~/.config/
cp -r gtk-4.0 ~/.config/
cp -r ofa ~/.config/
cp -r mako ~/.config/

# Copy other files
cp .gitconfig ~/
cp mimeapps.list ~/.config/

echo ""
echo "================================"
echo "  Installation Complete!"
echo "================================"
echo ""
echo "Next steps:"
echo "1. Reboot or log out and select Hyprland session"
echo "2. Press SUPER+R to open rofi launcher"
echo "3. Press SUPER+Q to open terminal (kitty)"
echo ""
echo "Keybinds reference: ~/.config/hypr/hyprland.conf"
echo ""
