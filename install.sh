#!/bin/bash
set -e  # Exit on error

echo "Starting installation of development environment..."

# 1. Install zsh, and wezterm
echo "Installing git, zsh, and wezterm..."
sudo apt-get install -y zsh

# Move .zshrc to ~/.config/zsh/ and set up zsh to use it
echo "Setting up Zsh configuration..."
mkdir -p ~/.config/zsh
# Create ZDOTDIR environment variable
echo "export ZDOTDIR=\$HOME/.config/zsh" | sudo tee -a /etc/zsh/zshenv

# Install zsh-autosuggestions, zsh-syntax-highlighting
echo "Installing zsh-autosuggestions and zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/zsh-syntax-highlighting

# Install wezterm
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo apt update && sudo apt install -y wezterm

# 2. Set wezterm as default terminal and zsh as default shell
echo "Setting up default terminal and shell..."
sudo update-alternatives --set x-terminal-emulator /usr/bin/wezterm
chsh -s $(which zsh)

# 3. Install fd, lazygit, ripgrep
echo "Installing fd, lazygit, and ripgrep..."
sudo apt install -y fd-find lazygit ripgrep

# 4. Install eza and fzf
echo "Installing eza and fzf..."
sudo apt install -y gpg
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza fzf

# 5. Install Starship
echo "Installing Starship..."
curl -sS https://starship.rs/install.sh | sh

# 6. Install Docker and Docker Compose
echo "Installing Docker and Docker Compose..."
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh --dry-run
sudo rm ./get-docker.sh
sudo apt-get install -y docker-compose-plugin

# 8. Install Neovim
echo "Installing Neovim..."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
mkdir -p /opt/nvim
mv nvim-linux-x86_64.appimage /opt/nvim/nvim
sudo apt install libfuse2

# 9. Install uv, nvm
curl -LsSf https://astral.sh/uv/install.sh | sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# Create necessary config directories
echo "Creating config directories..."
mkdir -p ~/.config/wezterm
mkdir -p ~/.config/zsh
mkdir -p ~/.config/nvim

echo "Installation complete!"
echo "Please manually configure:"
echo "1. Wezterm config: Copy wezterm.lua to ~/.config/wezterm/"
echo "2. Zsh config: Copy .zshrc to ~/.config/zsh/"
echo "3. Starship config: Copy starship.toml to ~/.config/"
echo "4. Neovim config: Set up your preferred configuration in ~/.config/nvim/"