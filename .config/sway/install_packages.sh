#!/bin/bash

# SwayWM Package Installation Script for Arch Linux
# Run with: sudo ./install_packages.sh

echo "Installing SwayWM and related packages..."

# Core packages
pacman -S --noconfirm sway waybar dunst rofi alacritty

# Audio
pacman -S --noconfirm pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber

# Utilities
pacman -S --noconfirm grim slurp wl-clipboard swaylock swayidle

# Brightness control
pacman -S --noconfirm brightnessctl ddcutil

# Media control
pacman -S --noconfirm playerctl

# Authentication
pacman -S --noconfirm polkit-gnome

# Desktop portal
pacman -S --noconfirm xdg-desktop-portal-wlr

# Fonts
pacman -S --noconfirm ttf-jetbrains-mono ttf-font-awesome

# Icons
pacman -S --noconfirm papirus-icon-theme

# Network manager
pacman -S --noconfirm network-manager-applet

# File manager
pacman -S --noconfirm thunar

# Image viewer
pacman -S --noconfirm feh

# PDF viewer
pacman -S --noconfirm zathura

# Text editor
pacman -S --noconfirm neovim

# Terminal file manager
pacman -S --noconfirm ranger

# System monitoring
pacman -S --noconfirm htop btop

# Archive tools
pacman -S --noconfirm zip unzip p7zip

# Git
pacman -S --noconfirm git

# Development tools
pacman -S --noconfirm base-devel

echo "Installation complete!"
echo "Please log out and log back in to start using SwayWM."
echo "Or run: sway"