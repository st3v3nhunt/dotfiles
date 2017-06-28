#!/usr/bin/env bash

# Get [Homebrew-Cask](https://caskroom.github.io/), an extension to Homebrew
brew tap caskroom/cask
# Tap the cask of [drivers](https://github.com/caskroom/homebrew-drivers)
brew tap caskroom/drivers

# Browsers
casks=(google-chrome firefox)

# Utils
casks+=(
spectacle
iterm2
google-drive
dropbox
caffeine
vmware-horizon-client
royal-tsx
microsoft-azure-storage-explorer
java
robomongo
wireshark
kitematic
tableau-public
skype-for-business
flux
gimp
)

# Editors
casks+=(sublime-text)

# IM
casks+=(slack skype)

# Misc
casks+=(sonos garmin-express)

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
