#!/bin/bash
set -e  # Exit on error

echo "Starting installation of development environment..."

# 1. Install zsh, and wezterm
echo "Installing git, zsh, curl, wget, fzf, zoxide..."
sudo apt-get install -y git zsh curl wget fzf zoxide

# Backup the original .zshrc
#echo "Backing up Zsh configuration..."
#mv ~/.zshrc ~/.zshrc.bak
echo "Using this repo .zshrc"
cp .zshrc ~/.zshrc

# 2. Install Docker and Docker Compose
echo "Installing Docker and Docker Compose..."
sudo apt-get update
sudo apt-get install ca-certificates
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# 3. Install uv, nvm
echo "Installing UV, NVM..."
curl -LsSf https://astral.sh/uv/install.sh | sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# Install fd, lazygit, ripgrep
# echo "Installing fd, lazygit, and ripgrep..."
# sudo apt install -y fd-find lazygit ripgrep

# Install Neovim
# echo "Installing Neovim..."
# curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
# chmod u+x nvim-linux-x86_64.appimage
# mkdir -p /opt/nvim
# mv nvim-linux-x86_64.appimage /opt/nvim/nvim
# sudo apt install fuse


