#!/usr/bin/env bash

printf "Installing Vundle\n"
if [[ ! -d ~/.vim/bundle/Vundle.vim/ ]]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

printf "Installing Vundle Plugins\n"
vim +PluginInstall +qall
