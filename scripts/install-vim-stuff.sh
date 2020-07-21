#!/usr/bin/env bash

printf "Installing Vundle\\n"
if [[ ! -d ~/.vim/bundle/Vundle.vim/ ]]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

printf "Installing Vundle Plugins\\n"
vim +PluginInstall +qall

# Create dir for global swap, backup and undo files
if [[ ! -d ~/.vim/tmp/ ]]; then
  mkdir -p ~/.vim/tmp/{backup,swap,undo}
fi

# Install YouCompleteMe
 ~/.vim/bundle/YouCompleteMe/install.py --all

# Use existing word list for vim spell
if [[ ! -d ~/.vim/spell/ ]]; then
  mkdir ~/.vim/spell
fi

REPO_DIR="$( cd "$( dirname "$(dirname "${BASH_SOURCE[0]}" )" )" && pwd )"

# mkdir ~/.vim/spell
ln -fsv "$REPO_DIR/vim/spell" ~/.vim/

# Link ftplugin
ln -fsv "$REPO_DIR/vim/ftplugin" ~/.vim/
