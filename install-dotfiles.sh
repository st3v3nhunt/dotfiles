#!/usr/bin/env bash
# shellcheck disable=2059
GREEN='\033[0;32m'
NC='\033[0m'

REPO_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES_DIR="$REPO_DIR/dotfiles"

printf "${GREEN}Starting to symlink...${NC}\\n"

ln -nfsv "$DOTFILES_DIR/.aliases" ~
ln -nfsv "$DOTFILES_DIR/.azure-cli" ~
ln -nfsv "$DOTFILES_DIR/.bash_profile" ~
ln -nfsv "$DOTFILES_DIR/.bashrc" ~
ln -nfsv "$DOTFILES_DIR/.gitconfig" ~
ln -nfsv "$DOTFILES_DIR/.gitconfig.local" ~
ln -nfsv "$DOTFILES_DIR/.prompt" ~
ln -nfsv "$DOTFILES_DIR/.tern-project" ~
ln -nfsv "$DOTFILES_DIR/.tmux.conf" ~
ln -nfsv "$DOTFILES_DIR/.vimrc" ~
ln -nfsv "$REPO_DIR/.git-prompt.sh" ~
ln -nfsv "$REPO_DIR/.git-completion.bash" ~

printf "${GREEN}Finished creating symlinks...${NC}\\n"

printf "${GREEN}Installing Karabiner-Elements configuration...${NC}\\n"

KARABINER_DIR=".config/karabiner"

mkdir -p ~/"$KARABINER_DIR" && cp "$REPO_DIR/$KARABINER_DIR/karabiner.json" ~/"$KARABINER_DIR"

printf "${GREEN}Finished installing Karabiner-Elements configuration...${NC}\\n"

# Reload environment
# shellcheck source=/dev/null
. ~/.bashrc
