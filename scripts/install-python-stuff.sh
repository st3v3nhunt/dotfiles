#!/usr/bin/env bash

# shellcheck source=lib.sh
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

echo "Install Python3 virtual env for Neovim"
PY3_VER=3.12.6
pyenv install -s $PY3_VER
pyenv virtualenv -f $PY3_VER nvim

# Neovim's python3_host_prog is the pyenv shim, so pynvim goes into pyenv's
# Python rather than Homebrew's, which refuses pip installs (PEP 668)
echo "Installing pynvim"
pyenv exec python3 -m pip install --upgrade pip pynvim

# CLI tools each get an isolated environment managed by uv (installed via Brewfile)
tools=(
  detect-secrets
  poetry
  pre-commit
  pylint
  pytest-watch
)

for tool in "${tools[@]}"; do
  echo "Installing latest version of $tool"
  uv tool install --upgrade "$tool"
done

echo "Installing ansible"
uv tool install --upgrade --with-executables-from ansible-core ansible

# Install pre-commit hook script
pre-commit init-templatedir ~/.git-template

if is_macos; then
  echo "Increase the max number of file handles to fix 'Too many open files' error."
  echo "Password will be required"
  sudo launchctl limit maxfiles unlimited
fi
