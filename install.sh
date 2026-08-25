#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$HOME/.dotfiles"

echo "Installing dotfiles..."

# --------------------------------------------------
# Pacman packages
# --------------------------------------------------

echo "Installing pacman packages..."
echo "Remember to enable multilib in /etc/pacman.conf"
sudo pacman -S --needed \
  dolphin \
  hyprland \
  neovim \
  kitty \
  git \
  curl \
  zsh \
  firefox \
  base-devel \
  discord \
  telegram-desktop \
  steam \
  spotify-player \
  python-pipx \
  fastfetch \
  ttf-jetbrains-mono-nerd \
  noto-fonts-emoji \
  ly \
  thunderbird \
  noctalia
  

# --------------------------------------------------
# yay setup
# --------------------------------------------------

echo "Setting up yay..."

if [[ ! -d "$HOME/yay" ]]; then
  git clone https://aur.archlinux.org/yay.git "$HOME/yay"
fi

cd "$HOME/yay"
makepkg -si --noconfirm

# --------------------------------------------------
# AUR packages
# --------------------------------------------------

echo "Installing AUR packages..."

yay -S --needed \
  pokeget \
  cliphist \
  python-pywalfox \
  noctalia-qs \
  brightnessctl \
  imagemagick \
  python

# --------------------------------------------------
# Directories
# --------------------------------------------------

mkdir -p ~/.config
mkdir -p ~/Pictures
mkdir -p ~/Pictures/Screenshots

cd "$DOTFILES_DIR"

# --------------------------------------------------
# Oh My Zsh
# --------------------------------------------------

#echo "Installing oh-my-zsh..."

#if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
#  RUNZSH=no CHSH=no sh -c \
#    "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#fi

# --------------------------------------------------
# Noctalia
# --------------------------------------------------

# --------------------------------------------------
# Symlink helpers
# --------------------------------------------------

link_dir() {
  rm -rf "$2"
  ln -s "$1" "$2"
}

link_file() {
  rm -f "$2"
  ln -s "$1" "$2"
}

# --------------------------------------------------
# Symlinks
# --------------------------------------------------

echo "Configuring symlinks..."

link_dir "$DOTFILES_DIR/nvim" ~/.config/nvim
link_dir "$DOTFILES_DIR/hypr" ~/.config/hypr
link_dir "$DOTFILES_DIR/kitty" ~/.config/kitty
link_dir "$DOTFILES_DIR/noctalia" ~/.config/noctalia
link_dir "$DOTFILES_DIR/fastfetch" ~/.config/fastfetch
link_dir "$DOTFILES_DIR/Wallpapers" ~/Pictures/Wallpapers
link_dir "$DOTFILES_DIR/spotify-player" ~/.config/spotify-player

link_file "$DOTFILES_DIR/.zshrc" ~/.zshrc

sudo rm -rf /etc/ly
sudo ln -s "$DOTFILES_DIR/ly" /etc/ly

echo "Done."
