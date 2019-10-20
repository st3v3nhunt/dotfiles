#!/usr/bin/env bash

# Run this file to get the latest changes. It saves having to run all scripts
# to pick up the most recent changes.

brew tap homebrew/cask-fonts
brew install zsh-syntax-highlighting
brew cask install opera
brew cask install font-hack-nerd-font
brew cask install font-meslo-nerd-font
brew cask install font-droidsansmono-nerd-font

brew install rbenv
szp
rbenv insall 2.6.5
brew reinstall pipenv
brew reinstall pyenv
szp
pip install Pygments

../install-oh-my-zsh.sh
p10k configure
ln -nfsv "$PWD/../dotfiles/.p10k.zsh" ~

# Apply changes
# shellcheck source=/dev/null
source ~/.zshrc
