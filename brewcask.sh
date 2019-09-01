#!/usr/bin/env bash

# Get [Homebrew-Cask](https://caskroom.github.io/), an extension to Homebrew
echo "Tap Homebrew's cask extension..."
brew tap caskroom/cask
# Tap the cask for [drivers](https://github.com/caskroom/homebrew-drivers)
brew tap caskroom/drivers

# Browsers
casks=(
firefox
google-chrome
)

# Utils
casks+=(
burp-suite
caffeine
db-browser-for-sqlite
dotnet-sdk
dropbox
flux
gimp
google-backup-and-sync
haskell-platform
iterm2
java
kitematic
little-snitch
microsoft-azure-storage-explorer
minikube
mono-mdk
owasp-zap
postman
powershell
robo-3t
royal-tsx
spectacle
tableau-public
vmware-horizon-client
wireshark
)

# Editors
casks+=(
sublime-text
visual-studio-code
)

# IM
casks+=(
skype
slack
)

# Misc
casks+=(
garmin-express
sonos
zwift
)

echo "Updating Homebrew..."
brew update

echo "Updating installed casks..."
brew cask upgrade

# Install casks if they aren't already
for pkg in "${casks[@]}"; do
  if ! brew cask list -1 | grep -q "^$pkg\$" ; then
    echo "Installing '$pkg'..."
    brew cask install "$pkg"
  else
    echo "'$pkg' already installed"
  fi
done

# Complete
echo "Brew cask updating and installing completed."
