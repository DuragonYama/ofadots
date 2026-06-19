# Package Lists

This repository provides two installation options optimized for different use cases.

## Quick Install (Recommended)

```bash
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

The script will ask you to choose:
1. **Minimal** - Only packages needed for configs to work (22 packages)
2. **Full** - Minimal + productivity tools (105 packages)
3. **Skip** - Only copy configs (if you already have packages)

## Installation Options Explained

### Minimal (20 official + 2 AUR = 22 packages)

**For users who just want the dotfiles to work without errors.**

This includes ONLY packages that are:
- Explicitly called in keybinds or scripts
- Required for Hyprland desktop to function
- Dependencies that prevent errors

**Files:** `pkglist-minimal.txt`, `aurlist-minimal.txt`

**What's included:**
- Hyprland core: `hyprland`, `waybar`, `mako`, `xdg-desktop-portal-hyprland`, `qt6-wayland`, `polkit-kde-agent`
- Apps in keybinds: `kitty`, `thunar`, `rofi`, `satty`, `swaybg`
- Editor: `neovim` (LazyVim config lives in `nvim/`)
- Script dependencies: `brightnessctl`, `cliphist`, `wl-clipboard`, `grimblast-git`, `libnotify`
- Audio/Network: `pipewire-pulse`, `pipewire-alsa`, `wireplumber`, `networkmanager`
- Theme: `whitesur-cursor-theme-git`

### Full (92 official + 13 AUR = 105 packages)

**For personal setup with additional productivity, dev, and daily-driver tools.**

Everything in minimal PLUS:
- **Editors:** nano, neovim, mousepad, featherpad
- **CLI/Terminal:** tmux, lazygit, yazi, tree, less, plocate, fastfetch
- **File tools:** 7zip, unzip, imagemagick, imv, dosfstools, ntfs-3g, ghostscript
- **Dev tools:** git, docker, docker-compose, postgresql, ollama, gemini-cli, sqlitebrowser, python-pypdf
- **Dev toolchains:** bun, nvm, jdk21-openjdk, dotnet-sdk, aspnet-runtime, aspnet-targeting-pack
- **Virtualization:** qemu-desktop, libvirt
- **Monitoring/Hardware:** htop, dmidecode, nvme-cli, smartmontools, fprintd, libfprint, tlp, tlp-rdw
- **Network:** openssh, tailscale, wireguard-tools, nm-connection-editor, bind, bluetui
- **Desktop/WM extras:** hyprpaper, quickshell, swaync, wofi, wlr-randr, cava, blueman
- **UI apps:** pavucontrol, gnome-disk-utility, libreoffice-still, discord, obsidian
- **Themes/Fonts:** materia-gtk-theme, papirus-icon-theme, noto-fonts (all variants), ttf-jetbrains-mono-nerd
- **AUR:** yay, dev tools (visual-studio-code-bin, android-studio, flutter, arduino-ide-bin, antigravity, opencode-bin, stripe-cli), browsers (zen-browser-bin, ungoogled-chromium-bin), themes (papirus-folders)

**Files:** `pkglist.txt`, `aurlist.txt`

## Manual Installation

If you prefer to install packages manually:

### Minimal
```bash
sudo pacman -S --needed - < pkglist-minimal.txt
yay -S --needed - < aurlist-minimal.txt
```

### Full
```bash
sudo pacman -S --needed - < pkglist.txt
yay -S --needed - < aurlist.txt
```

Then copy configs manually:
```bash
cp -r hypr waybar rofi kitty nvim gtk-3.0 gtk-4.0 ofa mako ~/.config/
cp .gitconfig ~/
cp mimeapps.list ~/.config/
```

## What's Intentionally Excluded

These packages can cause system breakage or conflicts on fresh installs:

- **Core system:** `base`, `base-devel`, `sudo`
- **Kernel/Firmware:** `linux`, `linux-lts`, `linux-headers`, `linux-lts-headers`, `linux-firmware`, `intel-ucode`, `sof-firmware`
- **Games/toys:** retroarch (+ assets), libretro-mgba, pcsx2, cmatrix
- **One-off/diagnostic:** memtester, and `*-debug` packages

Install these separately based on your system needs. Daily-driver apps (browsers, libreoffice, discord, obsidian) and dev toolchains are now included in the Full list.

## After Installation

1. Reboot or log out
2. Select "Hyprland" in your display manager (SDDM)
3. Login and enjoy!

**Common keybinds:**
- `SUPER + Q` - Terminal (kitty)
- `SUPER + R` - App launcher (rofi)
- `SUPER + E` - File manager (thunar)
- `SUPER + S` - Screenshot
- `SUPER + C` - Close window

Full keybind list: `~/.config/hypr/hyprland.conf` (line 249+)

## Troubleshooting

**No AUR helper (yay)?** Install it first:
```bash
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

**Missing dependencies?** The `--needed` flag prevents reinstalling existing packages. If you get errors, make sure you have a working Arch Linux base system with `base` and `base-devel` already installed.

**Want to add/remove packages?** Edit the .txt files and re-run the install script with option 3 (skip package install) to only update configs.
