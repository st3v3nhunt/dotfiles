#!/usr/bin/env bash

if ! command -v brew; then
  echo "No Homebrew install found. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  echo "Homebrew install found. Updating..."
  brew update
fi

echo "Reloading zsh"
# shellcheck source=/dev/null
source ~/.zshrc

if [[ -n "$WSL_DISTRO_NAME" && "$OSTYPE" == "linux-gnu" ]]; then
  brew install gcc
fi
