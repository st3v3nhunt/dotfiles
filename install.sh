#!/usr/bin/env bash

if [[ -n "$WSL_DISTRO_NAME" && "$OSTYPE" == "linux-gnu" ]]; then
  ./scripts/install-wsl-stuff.sh
fi

./scripts/install-oh-my-zsh.sh
./scripts/install-dotfiles.sh
./scripts/install-brew.sh
./scripts/install-brews.sh

if [[ "$OSTYPE" == "darwin"* ]]; then
  ./scripts/defaults.sh
  ./scripts/install-mac-stuff.sh
  ./scripts/install-casks.sh
fi

./scripts/install-gems.sh
./scripts/install-nvm.sh
./scripts/install-npms.sh
./scripts/install-pips.sh
./scripts/install-tmux-stuff.sh
./scripts/install-vim-stuff.sh
./scripts/install-dotnet-tools.sh
