#!/bin/bash

TEMP_ALIASES_FILE="/tmp/aliases"

echo "UPDATING..."
apt update

echo "INSTALLING"
apt install gcc g++ git fzf -y
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
git clone https://github.com/to23mas/.nvim.git
rm -rf /opt/nvim
tar -C /opt -xzf nvim-linux64.tar.gz
export PATH="$PATH:/opt/nvim-linux64/bin"

echo "Setting up aliases"
curl -o "$TEMP_ALIASES_FILE" https://raw.githubusercontent.com/to23mas/.aliases/refs/heads/home/personal
source "$TEMP_ALIASES_FILE"

echo "Setting up neovim"
git clone https://github.com/to23mas/.nvim.git
mkdir .config/
mv .nvim ./.config/nvim 
nvim .
