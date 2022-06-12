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
NEOVIM_DIR=".config/nvim"
NEOVIM_INIT="$NEOVIM_DIR/init.lua"
NEOVIM_LUA_DIR="$NEOVIM_DIR/lua/"
mkdir -p ~/"$NEOVIM_DIR"
ln -nfsv "$REPO_DIR/$NEOVIM_INIT" ~/"$NEOVIM_DIR"
ln -fsv "$REPO_DIR/$NEOVIM_LUA_DIR" ~/"$NEOVIM_DIR"
ln -nfsv "$REPO_DIR/vim/coc-settings.json" ~/$NEOVIM_DIR/coc-settings.json
printf "${GREEN}Finished installing Neovim configuration...${NC}\\n"

# Link ftplugin and spell dirs
ln -fsv "$REPO_DIR/vim/ftplugin" ~/.vim
ln -fsv "$REPO_DIR/vim/spell" ~/.vim
ln -nfsv "$REPO_DIR/vim/coc-settings.json" ~/.vim/coc-settings.json
