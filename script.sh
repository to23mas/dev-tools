#!/bin/bash

TEMP_ALIASES_FILE="/tmp/aliases"

echo "UPDATING..."
apt update

echo "INSTALLING"
apt install gcc g++ git fzf snapd -y
snap install nvim --classic

echo "Setting up aliases"
curl -o aliases https://raw.githubusercontent.com/to23mas/dev-tools/refs/heads/main/aliases
source aliases

echo "Setting up tmux"
curl -o tmux.conf https://raw.githubusercontent.com/to23mas/dev-tools/refs/heads/main/tmux.conf
mkdir -p /home/root/.config/tmux/
mv tmux.conf /home/root/.config/tmux/

echo "Setting up neovim"
git clone https://github.com/to23mas/.nvim.git
mkdir -p /home/root/.config/
mv .nvim /home/root/.config/nvim

export CI_REGISTRY=registry.gitlab.logmanager.cz
