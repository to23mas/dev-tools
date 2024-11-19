#!/bin/bash

TEMP_ALIASES_FILE="/tmp/aliases"

echo "UPDATING..."
apt update

echo "INSTALLING"
apt install gcc g++ git fzf snapd -y
snap install nvim --classic

echo "Setting up aliases"
curl -o "$TEMP_ALIASES_FILE" https://raw.githubusercontent.com/to23mas/dev-tools/refs/heads/main/aliases
source "$TEMP_ALIASES_FILE"

echo "Setting up neovim"
git clone https://github.com/to23mas/.nvim.git
mkdir -p /home/root/.config/
mv .nvim /home/root/.config/nvim
nvim .
