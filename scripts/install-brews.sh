#!/usr/bin/env bash

# Tap the Azure Functions repo
brew tap azure/functions
brew tap johanhaleby/kubetail

# Utils
brews=(
adr-tools
asciinema
azcopy
azure-cli
azure-functions-core-tools@4
aws-iam-authenticator
cmake
cloudfoundry/tap/cf-cli@7
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
pyenv-virtualenv
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
cmatrix
fig
htop
tmux
)

# GIT stuff
brews+=(
gh
git
git-secrets
hub
)

# THE editor?!
brews+=(
neovim
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

# DB stuff
brews+=(
pgadmin4
postgresql
redis
redisinsight
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
