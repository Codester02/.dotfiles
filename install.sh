#!/usr/bin/env bash

set -e

DOTFILES_DIR="$HOME/.dotfiles"

echo "Installing dotfiles..."

sudo pacman -S --needed neovim kitty git firefox base-devel discord telegram-desktop steam

#setup Aur
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~/"$DOTFILES_DIR"

yay -S noctalia-shell
# Create config dirs
mkdir -p ~/.config

# Symlink configs
ln -sf "$DOTFILES_DIR/nvim" ~/.config/nvim
ln -sf "$DOTFILES_DIR/.zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/hypr" ~/.config/hypr
ln -sf "$DOTFILES_DIR/kitty" ~/.config/kitty
ln -sf "$DOTFILES_DIR/noctalia" ~/.config/noctalia
ln -sf "$DOTFILES_DIR/Wallpapers" ~/Pictures/Wallpapers

echo "Done."
