#!/usr/bin/env bash

# Get [Homebrew-Cask](https://caskroom.github.io/), an extension to Homebrew
echo "Tap Homebrew's cask extension..."
brew tap homebrew/cask-cask
brew tap homebrew/cask-drivers
brew tap homebrew/cask-fonts

# Browsers
casks=(
firefox
google-chrome
opera
)

# Utils
casks+=(
avira-antivirus
azure-data-studio
burp-suite
caffeine
db-browser-for-sqlite
dotnet-sdk
dropbox
gimp
google-backup-and-sync
google-cloud-sdk
haskell-platform
iterm2
java
karabiner-elements
kitematic
lastpass
little-snitch
microsoft-azure-storage-explorer
microsoft-office
minikube
mono-mdk
ngrok
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

# Fonts
casks+=(
font-hack-nerd-font
font-meslo-nerd-font
font-droidsansmono-nerd-font
)

# Editors
casks+=(
sublime-text
visual-studio-code
)

# IM
casks+=(
microsoft-teams
signal
skype
skype-for-business
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
