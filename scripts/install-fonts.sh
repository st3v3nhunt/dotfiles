#!/usr/bin/env bash

echo "Installing zsh-nvm (https://github.com/powerline/fonts.git)"
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts || exit
./install.sh
cd ..
rm -rf fonts
