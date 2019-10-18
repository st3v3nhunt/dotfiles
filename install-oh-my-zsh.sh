#!/usr/bin/env bash

# Install on-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" --unattended

# Install Powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1 && pushd fonts && ./install.sh && popd && rm -rf fonts
