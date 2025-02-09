#!/usr/bin/env bash

# Tap the Azure Functions repo
brew tap azure/functions
brew tap hashicorp/tap
brew tap heroku/brew
brew tap johanhaleby/kubetail

# Utils
brews=(
actionlint
adr-tools
asciinema
asdf
azcopy
azure-cli
azure-functions-core-tools@4
aws-iam-authenticator
aws-vault
black
cmake
cloudfoundry/tap/cf-cli@7
coreutils
curl
drawio
exercism
fd
gawk
gcc
glow
gpg
gpg-suite-no-mail
gnu-sed
hashicorp/tap/terraform
hugo
imagemagick
jmeter
jq
jupyterlab
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
watch
wget
wireguard-tools
yq
)

# Terminal stuff
brews+=(
bash
btop
cmatrix
fzf
htop
ripgrep
tldr
tmux
)

# GIT stuff
brews+=(
gh
git
git-lfs
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
java
node
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
beekeeper-studio
pgadmin4
postgresql@16
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
