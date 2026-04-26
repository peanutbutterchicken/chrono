#!/bin/bash

REPO_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOT_DIR="$REPO_DIR/dotfiles/.config"

echo "Sinisimulan ang Bigasan setup.."

# 1. installl dependencies
DEPENDENCIES="i3 feh redshift dmenu"
echo "Checking for required packages..."

if command -v apt >/dev/null 2>&1; then
    echo "Installing dependencies via apt..."
    sudo apt update
    sudo apt install -y $DEPENDENCIES
else
    echo "WARNING: 'apt' package manager not found!"
    echo "Please manually install: $DEPENDENCIES"
    sleep 3
fi

# 2. create standard directories
echo "Creating standard directories..."
mkdir -p ~/.config/i3
mkdir -p ~/.config/redshift
mkdir -p ~/.config/gtk-3.0

# 3. set executable permissions
echo "Setting executable permissions..."
chmod +x "$DOT_DIR/redshift/toggle-redshift.sh"

# 4. create symlinks
echo "Creating symlinks..."
ln -sf "$DOT_DIR/i3/config" ~/.config/i3/config
ln -sf "$DOT_DIR/redshift/redshift.conf" ~/.config/redshift.conf
ln -sf "$DOT_DIR/redshift/toggle-redshift.sh" ~/.config/redshift/toggle-redshift.sh
ln -sf "$DOT_DIR/gtk-3.0/settings.ini" ~/.config/gtk-3.0/settings.ini

ln -sf "$DOT_DIR/wallpapers/14.png" ~/.wallpaper

echo -e "\nDone! Bigasan Completed..."
