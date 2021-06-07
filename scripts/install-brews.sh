#!/usr/bin/env bash

# Tap the Azure Functions repo
brew tap azure/functions
brew tap johanhaleby/kubetail

# Utils
brews=(
adr-tools
asciinema
azure-cli
azure-functions-core-tools@3
aws-iam-authenticator
cmake
drawio
exercism
gcc
glow
gpg
gpg-suite-no-mail
groovy
hugo
imagemagick
jmeter
jq
llvm
mkcert
ninja
pipenv
pyenv
rename
shellcheck
tfenv
universal-ctags/universal-ctags/universal-ctags
vault
watch
wget
yq
)

# Terminal stuff
brews+=(
bash
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
node
python
python@2
ruby
scala
)

# Containerisation related e.g. k8s, rancher, docker, etc.
brews+=(
derailed/k9s/k9s
helm
kind
kubernetes-cli
kubetail
linkerd
minikube
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
ripgrep
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
