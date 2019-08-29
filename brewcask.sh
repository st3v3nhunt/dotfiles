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
db-browser-for-sqlite
docker-machine-driver-hyperkit
dotnet-sdk
dropbox
flux
gimp
google-backup-and-sync
haskell-platform
hyperkit
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

# The update does all pkgs so just do it once
echo "Updating..."
brew update

# Upgrade if already home brew installed else install
for pkg in "${casks[@]}"; do
  update_pkg="$(brew cask list -1 | grep "${pkg}")"
  if [[ ! "$update_pkg" ]]; then
    echo "Installing '$pkg'..."
    brew cask install "$pkg"
  else
    echo "'$update_pkg' already installed"
  fi
done

# Enable the driver to access the hypervisor
sudo chown root:wheel /usr/local/opt/docker-machine-driver-hyperkit/bin/docker-machine-driver-hyperkit
sudo chmod u+s /usr/local/opt/docker-machine-driver-hyperkit/bin/docker-machine-driver-hyperkit
# Complete
echo "Brew cask updating and installing completed."
