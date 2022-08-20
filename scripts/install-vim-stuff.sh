#!/usr/bin/env bash
# shellcheck disable=2059
GREEN='\033[0;32m'
NC='\033[0m'

# Create dir for global swap, backup and undo files
if [[ ! -d ~/.vim/tmp/ ]]; then
  mkdir -p ~/.vim/tmp/{backup,swap,undo}
fi

REPO_DIR="$( cd "$( dirname "$(dirname "${BASH_SOURCE[0]}" )" )" && pwd )"

printf "${GREEN}Installing Neovim configuration...${NC}\\n"
CONFIG_DIR=".config"
NEOVIM_DIR="$CONFIG_DIR/nvim"
mkdir -p ~/"$NEOVIM_DIR"
ln -nfsv "$REPO_DIR/$NEOVIM_DIR" ~/"$CONFIG_DIR"
printf "${GREEN}Finished installing Neovim configuration...${NC}\\n"

# Link ftplugin and spell dirs
ln -fsv "$REPO_DIR/vim/ftplugin" ~/.vim
ln -fsv "$REPO_DIR/vim/spell" ~/.vim

# Install additional tools for Neovim
./scripts/install-nvim-tooling.sh
