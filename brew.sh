#!/usr/bin/env bash

if ! which -s brew; then
  # Install Homebrew
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  brew update
fi

# Tap other kegs
brew tap jmespath/jmespath

# Sort out permissions
sudo chown -R "$(whoami):admin" /usr/local

# Utils
brews=(
adr-tools
cmake
gpg
heroku
rancher-cli
rename
shellcheck
vault
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
hub
ghi
)

# JSON wrangling
brews+=(
jq
jp
)

# THE editor?!
brews+=(vim)

# Languages
brews+=(
elixir
erlang
go
mono
node
python
rust
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
