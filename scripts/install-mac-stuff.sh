#!/usr/bin/env bash
# shellcheck disable=2059
echo "Installing rosetta..."
softwareupdate --install-rosetta

GREEN='\033[0;32m'
NC='\033[0m'

REPO_DIR="$( cd "$( dirname "$(dirname "${BASH_SOURCE[0]}" )" )" && pwd )"
GIT_DIR="$REPO_DIR/git"

ln -nfsv "$GIT_DIR/.mac.gitconfig" ~

printf "${GREEN}Installing GnuPG configuration...${NC}\\n"
mkdir -p ~/.gnupg
ln -nfsv "$REPO_DIR/.config/gpg-agent.conf" ~/.gnupg/gpg-agent.conf
printf "${GREEN}Finished installing GnuPG configuration...${NC}\\n"

printf "${GREEN}Installing Karabiner-Elements configuration...${NC}\\n"
KARABINER_CONFIG_DIR=".config/karabiner"
KARABINER_CONFIG="$KARABINER_CONFIG_DIR/karabiner.json"
mkdir -p ~/"$KARABINER_CONFIG_DIR"
ln -nfsv "$REPO_DIR/$KARABINER_CONFIG" ~/"$KARABINER_CONFIG_DIR"
printf "${GREEN}Finished installing Karabiner-Elements configuration...${NC}\\n"
echo "If there are problems with karabiner settings not being loaded try turning on the setting for 'system default configuration'"

printf "${GREEN}k9s configuration...${NC}\\n"
K9S_CONFIG_DIR=~/"Library/Application Support/k9s"
K9S_CONFIG=".config/k9s/config.yml"
mkdir -p "$K9S_CONFIG_DIR"
ln -nfsv "$REPO_DIR/$K9S_CONFIG" "$K9S_CONFIG_DIR"
printf "${GREEN}Finished installing k9s configuration...${NC}\\n"

printf "${GREEN}yabai configuration...${NC}\\n"
YABAI_CONFIG_DIR=".config/yabai"
YABAI_CONFIG="$YABAI_CONFIG_DIR/yabairc"
mkdir -p ~/"$YABAI_CONFIG_DIR"
ln -nfsv "$REPO_DIR/$YABAI_CONFIG" ~/"$YABAI_CONFIG_DIR"
printf "${GREEN}Finished installing yabai configuration...${NC}\\n"

brews=(
deno
koekeishiya/formulae/yabai
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

# start brew services
brew services start yabai

echo "Clean up..."
brew cleanup
