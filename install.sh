#!/bin/bash
set -e  # Exit on error

echo "Starting installation of development environment..."

# 1. Install zsh, and wezterm
echo "Installing git, zsh, and wezterm..."
sudo apt-get install -y zsh

# Move .zshrc to ~/.config/zsh/ and set up zsh to use it
echo "Setting up Zsh configuration..."
# Create ZDOTDIR environment variable
echo "export ZDOTDIR=\$HOME/.config/zsh" | sudo tee -a /etc/zsh/zshenv

# Install wezterm
echo "Installing wezterm..."
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo apt update && sudo apt install -y wezterm

# 2. Set wezterm as default terminal and zsh as default shell
echo "Setting up default terminal and shell..."
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/wezterm 50
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
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# 7. Install Neovim
echo "Installing Neovim..."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
mkdir -p /opt/nvim
mv nvim-linux-x86_64.appimage /opt/nvim/nvim
sudo apt install fuse

# 8. Install uv, nvm
echo "Installing UV, NVM..."
curl -LsSf https://astral.sh/uv/install.sh | sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
