#!/usr/bin/env bash

# Tap the Azure Functions repo
brew tap azure/functions
brew tap heroku/brew
brew tap johanhaleby/kubetail

# Utils
brews=(
adr-tools
asciinema
azcopy
azure-cli
azure-functions-core-tools@4
aws-iam-authenticator
aws-vault
cmake
cloudfoundry/tap/cf-cli@7
drawio
exercism
gcc
glow
gpg
gpg-suite-no-mail
hugo
imagemagick
jmeter
jq
llvm
luarocks
mkcert
ninja
pipenv
pyenv
pyenv-virtualenv
rename
shellcheck
tfenv
"--HEAD universal-ctags/universal-ctags/universal-ctags"
vault
watch
wget
wireguard-tools
yq
)

# Terminal stuff
brews+=(
bash
cmatrix
htop
ripgrep
tmux
)

# GIT stuff
brews+=(
gh
git
git-secrets
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
groovy
haskell-stack
node
python
ruby
scala
)

# Containerisation related e.g. k8s, rancher, docker, etc.
brews+=(
derailed/k9s/k9s
flyctl
helm
heroku
kind
kubernetes-cli
kubetail
linkerd
minikube
rancher-cli
skaffold
stern
)

# DB stuff
brews+=(
pgadmin4
postgresql
redis
sqlite
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
