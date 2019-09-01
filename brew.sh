#!/usr/bin/env bash

if ! command -v brew; then
  echo "No Homebrew install found. Install it..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew install found. Update it..."
  brew update
fi

# Sort out permissions
sudo chown -R "$(whoami):admin" /usr/local

# Tap the Azure Functions repo
brew tap azure/functions

# Utils
brews=(
adr-tools
azure-functions-core-tools
cmake
ctags
docker-machine-driver-hyperkit
exercism
gpg
handbrake
heroku
hyperkit
imagemagick
jmeter
kubernetes-cli
llvm
pipenv
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
bash-completion@2
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

# Upgrade if already installed via Homebrew otherwise install it
for pkg in "${brews[@]}"; do
  if brew list -1 | grep -q "^${pkg}\$"; then
    echo "Upgrading '$pkg'"
    brew upgrade "$pkg"
  else
    echo "Installing '$pkg'"
    brew install "$pkg"
  fi
done

# Enable docker-machine-driver to access the hypervisor (hyperkit)
sudo chown root:wheel /usr/local/opt/docker-machine-driver-hyperkit/bin/docker-machine-driver-hyperkit
sudo chmod u+s /usr/local/opt/docker-machine-driver-hyperkit/bin/docker-machine-driver-hyperkit

echo "Clean up..."
brew cleanup
