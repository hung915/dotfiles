1. Install git zsh wezterm
   sudo add-apt-repository ppa:git-core/ppa && sudo apt-get update && sudo apt-get install -y git
   
   sudo apt-get install -y zsh
   
   curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg
   
   echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
   
   sudo apt update && sudo apt install -y wezterm
   
2. Change default terminal to wezterm, defautl shell to zsh
   sudo update-alternatives --config x-terminal-emulator
   
   chsh -s $(which zsh)
3. Install JetBrainsMono Nerd Font
   https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.tar.xz
   
   tar -xvf JetBrainsMono.tar.xz
   
   cd JetBrainsMono

   sudo mkdir /usr/share/fonts/truetype/JetBrainsMono

   sudo cp *.ttf /usr/share/fonts/truetype/JetBrainsMono

   sudo fc-cache -f -v
4. Install eza, fzf
   sudo apt install -y gpg
   
   sudo mkdir -p /etc/apt/keyrings
   
   wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
   
   echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
   
   sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
   
   sudo apt update
   
   sudo apt install -y eza

   sudo apt install -y fzf
5. Install Starship
   curl -sS https://starship.rs/install.sh | sh
   
   https://github.com/hendrikmi/dotfiles/blob/main/starship/starship.toml
6. Config Wezterm
   https://github.com/nikolovlazar/dotfiles/blob/main/.config/wezterm/wezterm.lua

   New: https://github.com/hendrikmi/dotfiles/blob/main/wezterm/wezterm.lua
7. Config Zsh
   https://github.com/radleylewis/dotfiles/blob/master/.config/zsh/.zshrc

   New: https://github.com/hendrikmi/dotfiles/blob/main/zsh/.zshrc
8. Install neovim
   sudo add-apt-repository ppa:neovim-ppa/unstable -y
   
   sudo apt update && sudo apt install -y make gcc ripgrep unzip git xclip neovim
9. Config neovim
   
