#!/bin/bash
echo "Installing dotfiles..."

# WezTerm
mkdir -p ~/.config/wezterm
ln -sf ~/dotfiles/.config/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua

# Oh My Posh theme
mkdir -p ~/.config/oh-my-posh
ln -sf ~/dotfiles/.config/oh-my-posh/theme.omp.json ~/.config/oh-my-posh/theme.omp.json

echo "Done! Restart your terminal."
