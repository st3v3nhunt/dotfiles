#!/usr/bin/env bash
# shellcheck disable=2059
GREEN='\033[0;32m'
NC='\033[0m'

REPO_DIR="$( cd "$( dirname "$(dirname "${BASH_SOURCE[0]}" )" )" && pwd )"
echo "Repo directory is $REPO_DIR"

printf "${GREEN}Installing Karabiner-Elements configuration...${NC}\\n"
KARABINER_DIR=".config/karabiner"
KARABINER_JSON="$KARABINER_DIR/karabiner.json"
mkdir -p ~/"$KARABINER_DIR" && cp "$REPO_DIR/$KARABINER_JSON" ~/"$KARABINER_DIR"
ln -nfsv "$REPO_DIR/$KARABINER_JSON" ~/"$KARABINER_JSON"
printf "${GREEN}Finished installing Karabiner-Elements configuration...${NC}\\n"
echo "If there are problems with karabiner settings not being loaded try turning on the setting for 'system default configuration'"

printf "${GREEN}Installing Neovim configuration...${NC}\\n"
NEOVIM_DIR=".config/nvim"
NEOVIM_INIT="$NEOVIM_DIR/init.vim"
mkdir -p ~/"$NEOVIM_DIR" && cp "$REPO_DIR/$NEOVIM_INIT" ~/"$NEOVIM_DIR"
ln -nfsv "$REPO_DIR/$NEOVIM_INIT" ~/"$NEOVIM_INIT"
printf "${GREEN}Finished installing Neovim configuration...${NC}\\n"

brews=(
deno
docker-machine-driver-hyperkit
hyperkit
neovim
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
