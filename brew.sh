#!/usr/bin/env bash

which -s brew
if [[ $? != 0 ]] ; then
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
cmake
heroku
rancher-cli
shellcheck
gpg
yarn
ghi
)

# Terminal stuff
brews+=(bash-completion htop tmux reattach-to-user-namespace)

# GIT stuff
brews+=(git hub ghi)

# JSON wrangling
brews+=(jq jp)

# THE editor?!
brews+=(vim)

# Languages
brews+=(mono go rust python ruby node elixir erlang scala)

# DBs
brews+=(mongodb postgresql sqlite)

# Search stuff
brews+=(elasticsearch kibana the_silver_searcher)

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
