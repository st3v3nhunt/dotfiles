#!/usr/bin/env bash

if ! command -v brew; then
  echo "No Homebrew install found. Installing..."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew install found. Updating..."
  brew update
fi

# install.sh puts brew on PATH for later steps once this script finishes
