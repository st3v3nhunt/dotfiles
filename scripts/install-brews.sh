#!/usr/bin/env bash

# Tap the Azure Functions repo
brew tap azure/functions

# Utils
brews=(
adr-tools
asciinema
azure-cli
azure-functions-core-tools
aws-iam-authenticator
cmake
ctags
exercism
gcc
gpg
groovy
hugo
imagemagick
jmeter
llvm
minikube
pipenv
pyenv
rename
shellcheck
tfenv
vault
watch
wget
)

# Terminal stuff
brews+=(
bash
bash-completion@2
htop
tmux
)

# GIT stuff
brews+=(
git
git-secrets
github/gh/gh
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
haskell-stack
python
python@2
rust
rustup-init
ruby
scala
)

# Containerisation related e.g. k8s, rancher, docker, etc.
brews+=(
derailed/k9s/k9s
helm
kind
kubernetes-cli
octant
rancher-cli
skaffold
stern
)

# DBs
brews+=(
postgresql
sqlite
)

# Search stuff
brews+=(
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
