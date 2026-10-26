#!/usr/bin/env bash

# shellcheck source=lib.sh
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

# Python and the Python CLI tools, including pre-commit, are installed by mise
# (.config/mise/config.toml)

# Install pre-commit hook script
pre-commit init-templatedir ~/.git-template

if is_macos; then
  echo "Increase the max number of file handles to fix 'Too many open files' error."
  echo "Password will be required"
  sudo launchctl limit maxfiles unlimited
fi
