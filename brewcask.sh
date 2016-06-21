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
karabiner)

# Editors
casks+=(atom sublime-text)

# IM
casks+=(slack skype)

# Miss
casks+=(sonos garmin-express)

# Upgrade if already home brew installed else install
for pkg in "${casks[@]}"; do
  if brew cask list -1 | grep -q "^${pkg}\$"; then
    # The update command seems like a global update rather than package specific
    echo "Updating '$pkg'"
    brew cask update "{$pkg}"
  else
    echo "Installing '$pkg'"
    brew cask install "{$pkg}"
  fi
done
