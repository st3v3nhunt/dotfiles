#!/usr/bin/env bash

if ! command -v brew; then
  echo "No Homebrew install found. Install it..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  echo "Homebrew install found. Update it..."
  brew update
fi
