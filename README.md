# ofaDotfiles

Minimal Hyprland configuration for Arch Linux with a clean, functional desktop environment.

## Features

- **Hyprland** - Tiling Wayland compositor with smooth animations
- **Waybar** - Customizable status bar with system monitoring
- **Rofi** - Application launcher with custom OFA mode
- **Mako** - Lightweight notification daemon
- **Kitty** - GPU-accelerated terminal
- **Custom scripts** - Wallpaper rotation, clipboard management, VPN status, and more

## Quick Install

```bash
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

The installer will prompt you to choose:
1. **Minimal** - 22 packages (only what's needed for configs to work)
2. **Full** - 105 packages (minimal + productivity tools)
3. **Skip** - Only copy configs

## Screenshots

![Desktop](screenshots/desktop.png)
![Rofi](screenshots/rofi.png)

## Requirements

- Arch Linux or Arch-based distribution
- Working internet connection
- `base` and `base-devel` installed
- `yay` (AUR helper) - will prompt to continue without it

## What's Included

### Configs
- `hypr/` - Hyprland window manager configuration
- `waybar/` - Status bar with multiple themes (minimal/maximal)
- `rofi/` - App launcher with OFA custom mode
- `kitty/` - Terminal emulator
- `nvim/` - Neovim (LazyVim) configuration
- `mako/` - Notifications
- `ofa/` - Custom scripts and commands
- `gtk-3.0/`, `gtk-4.0/` - GTK theme settings

### Key Bindings

| Keys | Action |
|------|--------|
| `SUPER + Q` | Open terminal |
| `SUPER + R` | Application launcher |
| `SUPER + E` | File manager |
| `SUPER + C` | Close window |
| `SUPER + V` | Toggle floating |
| `SUPER + S` | Screenshot area |
| `SUPER + SHIFT + S` | Screenshot with annotation |
| `SUPER + 1-9` | Switch workspace |

See `hypr/hyprland.conf` for full list.

## Package Lists

Two installation modes are available:

- **Minimal** (`pkglist-minimal.txt`, `aurlist-minimal.txt`) - 22 packages
  - Only packages explicitly used in configs
  - Perfect for testing or lightweight systems

- **Full** (`pkglist.txt`, `aurlist.txt`) - 105 packages
  - Everything in minimal + productivity, dev, and daily-driver tools
  - Includes: git, docker, neovim, lazygit, tmux, tailscale, dev toolchains (bun, dotnet, jdk, flutter, android-studio), browsers, libreoffice, etc.

See [PACKAGES.md](PACKAGES.md) for detailed package lists.

## Post-Installation

1. Reboot or log out
2. Select "Hyprland" in SDDM login screen
3. Login and enjoy!

Optional: Configure wallpapers in `~/.config/hypr/wallpapers/`

## Customization

- **Waybar themes:** Run waybar selector via OFA mode (`SUPER + R` > type "waybar-selection")
- **Wallpapers:** Place images in `~/.config/hypr/wallpapers/` (auto-rotates)
- **Colors:** Edit `hypr/hyprland.conf` and `waybar/style.css`

## Troubleshooting

**Black screen after login?**
- Check if Hyprland is installed: `pacman -Q hyprland`
- Check logs: `~/.local/share/hyprland/hyprland.log`

**Waybar not showing?**
- Ensure waybar is installed: `pacman -Q waybar`
- Restart: `killall waybar && waybar &`

**Screenshots not working?**
- Install grimblast: `yay -S grimblast-git`

See [PACKAGES.md](PACKAGES.md) for more troubleshooting.

## Credits

- [Hyprland](https://hyprland.org/) - Tiling compositor
- [Waybar](https://github.com/Alexays/Waybar) - Status bar
- [Rofi](https://github.com/davatorium/rofi) - Launcher

## License

MIT - Feel free to use and modify
