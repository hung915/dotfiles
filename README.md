1. Install git zsh wezterm
   sudo add-apt-repository ppa:git-core/ppa && sudo apt-get update && sudo apt-get install -y git
   sudo apt-get install -y zsh
   curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg
   echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
   sudo apt update && sudo apt install -y wezterm
2. Change default terminal to wezterm, defautl shell to zsh
   sudo update-alternatives --config x-terminal-emulator
   chsh -s $(which zsh)
4. Install Font for powerlevel10k
   https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k
5. Config Wezterm
   https://github.com/nikolovlazar/dotfiles/blob/main/.config/wezterm/wezterm.lua
6. Config Zsh
   https://github.com/radleylewis/dotfiles/blob/master/.config/zsh/.zshrc
7. Install neovim
8. Config neovim
   
