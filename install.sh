#!/usr/bin/env bash
set -e

source "$(dirname "$0")/scripts/utils/detect-os.sh"

if is_wsl; then
  ./scripts/install-wsl-stuff.sh
fi

./scripts/install-dotfiles.sh
./scripts/install-oh-my-zsh.sh
./scripts/install-brew.sh
./scripts/install-brews.sh

if is_macos; then
  ./scripts/defaults.sh
  ./scripts/install-mac-stuff.sh
  ./scripts/install-casks.sh
fi

./scripts/install-gems.sh
./scripts/install-gcloud.sh
./scripts/install-go-stuff.sh
./scripts/install-misc.sh
./scripts/install-node-stuff.sh
./scripts/install-python-stuff.sh
./scripts/install-tmux-stuff.sh
./scripts/install-dotnet-tools.sh
./scripts/install-rust-stuff.sh
./scripts/install-or-upgrade-aws-cli.sh
./scripts/install-wasm-stuff.sh
./scripts/install-vim-stuff.sh
