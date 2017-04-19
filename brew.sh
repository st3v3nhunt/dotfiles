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
git
bash-completion
hub
heroku
the_silver_searcher
cmake
jq
jp
rancher-cli
shellcheck
htop
tmux
reattach-to-user-namespace
gpg
yarn
)

# THE editor?!
brews+=(vim)

# Languages
brews+=(mono go rust python ruby node elixir erlang scala)

# DBs
brews+=(mongodb postgresql sqlite)

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
