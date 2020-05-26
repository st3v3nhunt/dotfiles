#!/usr/bin/env bash
# shellcheck disable=2059
GREEN='\033[0;32m'
NC='\033[0m'

REPO_DIR="$( cd "$( dirname "$(dirname "${BASH_SOURCE[0]}" )" )" && pwd )"

if [[ "$OSTYPE" == "darwin"* ]]; then
  printf "${GREEN}Installing Karabiner-Elements configuration...${NC}\\n"
  KARABINER_DIR=".config/karabiner"
  mkdir -p ~/"$KARABINER_DIR" && cp "$REPO_DIR/$KARABINER_DIR/karabiner.json" ~/"$KARABINER_DIR"
  printf "${GREEN}Finished installing Karabiner-Elements configuration...${NC}\\n"
fi

brews=(
docker-machine-driver-hyperkit
hyperkit
reattach-to-user-namespace
wifi-password
)

# Upgrade if already installed via Homebrew otherwise install it
for pkg in "${brews[@]}"; do
  if brew list -1 | grep -q "^${pkg}\$"; then
    echo "Upgrading '$pkg'"
    brew upgrade "$pkg"
  else
    echo "Installing '$pkg'"
    brew install "$pkg"
  fi
done

# Enable docker-machine-driver to access the hypervisor (hyperkit)
echo "Update permissions for '/usr/local/opt/docker-machine-driver-hyperkit/bin/docker-machine-driver-hyperkit'..."
echo "Password will be required..."
sudo chown root:wheel /usr/local/opt/docker-machine-driver-hyperkit/bin/docker-machine-driver-hyperkit
sudo chmod u+s /usr/local/opt/docker-machine-driver-hyperkit/bin/docker-machine-driver-hyperkit

echo "Clean up..."
brew cleanup
