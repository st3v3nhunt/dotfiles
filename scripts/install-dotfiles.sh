#!/usr/bin/env bash
# shellcheck disable=2059
GREEN='\033[0;32m'
NC='\033[0m'

REPO_DIR="$( cd "$( dirname "$(dirname "${BASH_SOURCE[0]}" )" )" && pwd )"
DOTFILES_DIR="$REPO_DIR/dotfiles"
GIT_DIR="$REPO_DIR/git"

printf "${GREEN}Starting to symlink...${NC}\\n"

ln -nfsv "$DOTFILES_DIR/.aliases" ~
ln -nfsv "$DOTFILES_DIR/.bash_profile" ~
ln -nfsv "$DOTFILES_DIR/.bashrc" ~
ln -nfsv "$DOTFILES_DIR/.functions" ~
ln -nfsv "$DOTFILES_DIR/.prompt" ~
ln -nfsv "$DOTFILES_DIR/.p10k.zsh" ~
ln -nfsv "$DOTFILES_DIR/.tern-project" ~
ln -nfsv "$DOTFILES_DIR/.shared-shell-setup" ~
ln -nfsv "$DOTFILES_DIR/.vimrc" ~
ln -nfsv "$DOTFILES_DIR/.zshrc" ~
ln -nfsv "$GIT_DIR/.git-prompt.sh" ~
ln -nfsv "$GIT_DIR/.git-completion.bash" ~
ln -nfsv "$GIT_DIR/.gitconfig" ~

if [[ "$OSTYPE" == "darwin"* ]]; then
  ln -nfsv "$DOTFILES_DIR/.macos.tmux.conf" ~/.tmux.conf
fi

if [[ -n "$WSL_DISTRO_NAME" && "$OSTYPE" == "linux-gnu" ]]; then
  ln -nfsv "$DOTFILES_DIR/.wsl.tmux.conf" ~/.tmux.conf
  ln -nfsv "$DOTFILES_DIR/.zprofile" ~
fi

printf "${GREEN}Finished creating symlinks...${NC}\\n"
