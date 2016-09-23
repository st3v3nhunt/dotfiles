#!/usr/bin/env bash

# Get cask https://caskroom.github.io/
brew tap caskroom/cask

# Browsers
casks=(google-chrome firefox)

# Utils
casks+=(spectacle
iterm2
google-drive
dropbox
evernote
caffeine
vmware-horizon-client
royal-tsx
wireshark)

# Editors
casks+=(atom sublime-text)

# IM
casks+=(slack skype)

# Misc
casks+=(sonos garmin-express garmin-virb-edit)

# The update does all pkgs so just do it once
echo "Updating..."
brew cask update

# Upgrade if already home brew installed else install
for pkg in "${casks[@]}"; do
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
