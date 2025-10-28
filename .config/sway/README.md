# SwayWM Configuration

This is a comprehensive SwayWM configuration optimized for Arch Linux with performance enhancements and modern applications.

## Features

- **Waybar**: Modern status bar with workspaces, system info, and notifications
- **Dunst**: Clean notification daemon with gruvbox theming
- **Rofi**: Application launcher with modern UI
- **Performance Optimizations**: Enhanced responsiveness and smooth animations
- **100Hz Monitor Support**: Configured for your XEC ES-27X3 monitor
- **Brightness Control**: Automatic brightness setting on startup

## Installation

1. Install required packages:
   ```bash
   sudo ./install_packages.sh
   ```

2. Apply performance optimizations:
   ```bash
   ./performance.sh
   ```

3. Reboot your system

4. Start SwayWM:
   ```bash
   sway
   ```

## Configuration Files

- `config`: Main SwayWM configuration
- `waybar/config`: Waybar configuration
- `waybar/style.css`: Waybar styling
- `dunst/dunstrc`: Notification daemon configuration
- `rofi/config.rasi`: Application launcher configuration

## Key Bindings

- `Super + D`: Open application launcher (Rofi)
- `Super + Enter`: Open terminal (Alacritty)
- `Super + Q`: Close window
- `Super + Shift + Q`: Kill window
- `Super + F`: Toggle fullscreen
- `Super + Space`: Toggle floating
- `Super + 1-10`: Switch workspaces
- `Super + Shift + 1-10`: Move window to workspace
- `Super + R`: Resize mode
- `Super + W`: Window mode
- `Super + E`: Layout mode
- `Super + L`: Lock screen
- `Print`: Screenshot (with selection)
- `Super + Print`: Screenshot (with selection)

## Workspaces

1. Web (Firefox)
2. Mail (Thunderbird)
3. Code (VS Code)
4. Terminal (Alacritty)
5. Media
6. Social
7. Games
8. Misc
9. Misc
10. Misc

## Performance Features

- Optimized rendering with `max_render_time 1`
- Immediate mode enabled
- CPU governor set to performance
- Optimized I/O scheduler
- Real-time audio priority
- Disabled unnecessary services

## Monitor Configuration

- Set to 100Hz refresh rate
- Automatic brightness control (50% on startup)
- Proper scaling and positioning

## Troubleshooting

If you encounter issues:

1. Check logs: `journalctl -u sway`
2. Verify Wayland session: `echo $XDG_SESSION_TYPE`
3. Check if services are running: `systemctl --user status waybar dunst`
4. Test configuration: `sway -c ~/.config/sway/config -d`

## Customization

- Edit `config` for SwayWM settings
- Modify `waybar/style.css` for status bar appearance
- Update `dunst/dunstrc` for notification styling
- Change `rofi/config.rasi` for launcher appearance

## Dependencies

- sway
- waybar
- dunst
- rofi
- alacritty
- pipewire
- grim
- slurp
- wl-clipboard
- swaylock
- swayidle
- brightnessctl
- ddcutil
- playerctl
- polkit-gnome
- xdg-desktop-portal-wlr