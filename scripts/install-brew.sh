#!/usr/bin/env bash

if ! command -v brew; then
  echo "No Homebrew install found. Installing..."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew install found. Updating..."
  brew update
fi

# install.sh puts brew on PATH for later steps once this script finishes

if [[ -n "$WSL_DISTRO_NAME" && "$OSTYPE" == "linux-gnu" ]]; then
  # shellcheck source=lib.sh
  source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"
  load_brew_env
  brew install gcc
fi
