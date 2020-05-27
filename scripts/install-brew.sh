#!/usr/bin/env bash

if ! command -v brew; then
  echo "No Homebrew install found. Install it..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  echo "Homebrew install found. Update it..."
  brew update
fi

if [[ -n "$WSL_DISTRO_NAME" && "$OSTYPE" == "linux-gnu" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

echo "Reloading zsh"
# shellcheck source=/dev/null
source ~/.zshrc

if [[ -n "$WSL_DISTRO_NAME" && "$OSTYPE" == "linux-gnu" ]]; then
  brew install gcc
fi
