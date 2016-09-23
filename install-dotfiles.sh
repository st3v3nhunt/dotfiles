#!/usr/bin/env bash
PURPLE='\033[0;35m'
GREEN='\033[0;32m'
NC='\033[0m'

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

printf "${GREEN}Starting to symlink...${NC}\n"

ln -nfsv "$DOTFILES_DIR/.bashrc" ~
ln -nfsv "$DOTFILES_DIR/.bash_profile" ~
ln -nfsv "$DOTFILES_DIR/.gitconfig" ~
ln -nfsv "$DOTFILES_DIR/.gitconfig.local" ~
ln -nfsv "$DOTFILES_DIR/.aliases" ~
ln -nfsv "$DOTFILES_DIR/.colors" ~
ln -nfsv "$DOTFILES_DIR/.prompt" ~
ln -nfsv "$DOTFILES_DIR/.vimrc" ~
ln -nfsv "$DOTFILES_DIR/.git-prompt.sh" ~
ln -nfsv "$DOTFILES_DIR/.git-completion.bash" ~

printf "${GREEN}Finished creating symlinks...${NC}\n"

printf "${GREEN}Installing Karabiner-Elements configuration...${NC}\n"

KARABINER_DIR=".karabiner.d/configuration"

mkdir -p ~/$KARABINER_DIR && cp $DOTFILES_DIR/$KARABINER_DIR/karabiner.json ~/$KARABINER_DIR/

printf "${GREEN}Finished installing Karabiner-Elements configuration...${NC}\n"

# Reload environment
. ~/.bashrc
