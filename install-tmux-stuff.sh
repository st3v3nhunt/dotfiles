#!/usr/bin/env bash

if [[ ! -d ~/.tmux/plugins/tpm/ ]]; then
  printf "Cloning Tmux Plugin Manager\\n"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  printf "Tmux Plugin Manager already installed\\n"
fi
