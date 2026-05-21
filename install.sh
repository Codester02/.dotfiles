#!/usr/bin/env bash

set -e

DOTFILES_DIR="$HOME/.dotfiles"

echo "Installing dotfiles..."
echo "Installing pacman apps"
sudo pacman -S --needed dolphin hyprland neovim kitty git firefox base-devel discord telegram-desktop steam spotify-player python-pipx fastfetch ttf-jetbrains-mono-nerd noto-fonts-emoji ly

#setup Aur
echo "AUR setup"
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~/"$DOTFILES_DIR"

echo "installing AUR apps"
yay -S --needed noctalia-shell pokeget cliphist
# Create config dirs
mkdir -p ~/.config

echo "installing ohmyzsh"
#oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#pywalfox
echo "Installing pywalfox"
pipx install pywalfox
pywalfox install

#ly config
echo "ly config"
sudo rm /etc/ly/*
sudo rm /etc/ly/*/*
sudo rmdir /etc/ly/*
sudo rmdir /etc/ly

# Symlink configs
echo "configuring symlinks"
ln -sf "$DOTFILES_DIR/nvim" ~/.config/nvim
ln -sf "$DOTFILES_DIR/.zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/hypr" ~/.config/hypr
ln -sf "$DOTFILES_DIR/kitty" ~/.config/kitty
ln -sf "$DOTFILES_DIR/noctalia" ~/.config/noctalia
ln -sf "$DOTFILES_DIR/Wallpapers" ~/Pictures/Wallpapers
sudo ln -sf "$DOTFILES_DIR/ly" /etc/
echo "Done."
