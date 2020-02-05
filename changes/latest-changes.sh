#!/usr/bin/env bash

# Run this file to get the latest changes. It saves having to run all scripts
# to pick up the most recent changes.
unalias gh
brew install github/gh/gh

# Apply changes
# shellcheck source=/dev/null
source ~/.zshrc
