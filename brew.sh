#!/usr/bin/env bash

if ! which -s brew; then
  # Install Homebrew
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  brew update
fi

# Sort out permissions
sudo chown -R "$(whoami):admin" /usr/local

# Tap the cask for Azure Functions
brew tap azure/functions

# Utils
brews=(
adr-tools
azure-functions-core-tools
cmake
ctags
exercism
gpg
handbrake
heroku
imagemagick
jmeter
llvm
pyenv
rancher-cli
rename
shellcheck
vault
wget
wifi-password
yarn
)

# Terminal stuff
brews+=(
bash
bash-completion
htop
reattach-to-user-namespace
tmux
)

# GIT stuff
brews+=(
git
git-secrets
ghi
hub
)

# JSON wrangling
brews+=(
jq
)

# THE editor?!
brews+=(
vim
)

# Languages
brews+=(
elixir
erlang
go
node
python
python@2
rust
rustup-init
ruby
scala
)

# DBs
brews+=(
mongodb
postgresql
sqlite
)

# Search stuff
brews+=(
elasticsearch
kibana
the_silver_searcher
)

# Upgrade if already home brew installed else install
for pkg in "${brews[@]}"; do
  if brew list -1 | grep -q "^${pkg}\$"; then
    echo "Upgrading '$pkg'"
    brew upgrade "{$pkg}"
  else
    echo "Installing '$pkg'"
    brew install "{$pkg}"
  fi
done

# Cleanup
brew cleanup
