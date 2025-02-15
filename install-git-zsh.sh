#!/bin/bash
set -e  # Exit on error

echo "Starting the script...\n"

sudo apt-get update

echo "Start installing sed, zsh, git...\n"
which sed || sudo apt-get install -y sed
which zsh || sudo apt-get install -y zsh
which git || { sudo add-apt-repository ppa:git-core/ppa && sudo apt-get update && sudo apt-get install -y git; }


echo "Start installing OhMyZSH...\n"
[ -d ~/.oh-my-zsh ] || sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
