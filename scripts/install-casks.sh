#!/usr/bin/env bash

# Get [Homebrew-Cask](https://caskroom.github.io/), an extension to Homebrew
echo "Tap Homebrew's cask extension..."
brew tap homebrew/cask-drivers

# Browsers
casks=(
firefox
google-chrome
)

# Utils
casks+=(
alacritty
another-redis-desktop-manager
caffeine
db-browser-for-sqlite
dotnet-sdk
gimp
google-drive
google-cloud-sdk
iterm2
karabiner-elements
keycastr
lens
microsoft-azure-storage-explorer
microsoft-office
ngrok
owasp-zap
postman
powershell
royal-tsx
spectacle
wireshark
)

# Editors
casks+=(
visual-studio-code
)

# IM
casks+=(
microsoft-teams
signal
slack
)

echo "Updating Homebrew..."
brew update

echo "Updating installed casks..."
brew upgrade --cask

# Install casks if they aren't already
for pkg in "${casks[@]}"; do
  if ! brew list --cask -1 | grep -q "^$pkg\$" ; then
    echo "Installing '$pkg'..."
    brew install --appdir=~/Applications "$pkg" --cask
  else
    echo "'$pkg' already installed"
  fi
done

# Complete
echo "Brew cask updating and installing completed."
