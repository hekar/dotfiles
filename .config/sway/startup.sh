#!/bin/bash

# SwayWM Startup Script
# This script sets up the environment and starts SwayWM

# Set environment variables
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=sway

# Start necessary services
systemctl --user import-environment DISPLAY WAYLAND_DISPLAY
dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY

# Start authentication agent
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# Start desktop portal
/usr/lib/xdg-desktop-portal-wlr &

# Start waybar
waybar &

# Start dunst
dunst &

# Set monitor brightness
ddcutil setvcp 10 50 --display 1 &

# Start sway
exec sway