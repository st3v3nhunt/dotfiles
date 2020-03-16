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

# Install Tern for Vim
(cd ~/.vim/bundle/tern_for_vim && npm install)

# Install eslint_d for syntastic JS linting
npm install -g eslint_d

REPO_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Use existing word list for vim spell
ln -nfsv "$REPO_DIR/vim/en.utf-8.add" ~/.vim/spell