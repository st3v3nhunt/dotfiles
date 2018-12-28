#!/usr/bin/env bash

# Get [Homebrew-Cask](https://caskroom.github.io/), an extension to Homebrew
brew tap caskroom/cask
# Tap the cask of [drivers](https://github.com/caskroom/homebrew-drivers)
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
mono-mdk
owasp-zap
postman
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

# The update does all pkgs so just do it once
echo "Updating..."
brew update

# Upgrade if already home brew installed else install
for pkg in "${casks[@]}"; do
  # shellcheck disable=2086
  update_pkg="$(brew cask list -1 | grep ${pkg})"
  if [[ ! "$update_pkg" ]]; then
    echo "Installing '$pkg'..."
    brew cask install "$pkg"
  else
    echo "'$update_pkg' already installed"
  fi
done

# Cleaup
brew cask cleanup
