#!/usr/bin/env bash

# Create dir for global swap, backup and undo files
if [[ ! -d ~/.vim/tmp/ ]]; then
  mkdir -p ~/.vim/tmp/{backup,swap,undo}
fi

REPO_DIR="$( cd "$( dirname "$(dirname "${BASH_SOURCE[0]}" )" )" && pwd )"

# Link ftplugin and spell dirs
ln -fsv "$REPO_DIR/vim/ftplugin" ~/.vim/
ln -fsv "$REPO_DIR/vim/spell" ~/.vim/
ln -nfsv "$REPO_DIR/vim/coc-settings.json" ~/.vim/coc-settings.json
