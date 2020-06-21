#!/usr/bin/env bash

echo "Installing zsh-nvm (https://github.com/lukechilds/zsh-nvm.git)..."
git clone https://github.com/lukechilds/zsh-nvm.git ~/.zsh-nvm

echo "Installing global npm packages (serverless, snyk, yarn)..."
npm install -g serverless
npm install -g snyk
npm install -g yarn

echo "Installing deno and autocompletion..."
curl -fsSL https://deno.land/x/install/install.sh | sh

if [[ -n "$ZSH" ]]; then
  # shellcheck disable=1090
  . ~/.zshrc
  mkdir ~/.oh-my-zsh/custom/plugins/deno
  deno completions zsh > ~/.oh-my-zsh/custom/plugins/deno/_deno
  # shellcheck disable=1090
  . ~/.zshrc
else
  # shellcheck disable=1090
  . ~/.bashrc
  if [[ -n "$WSL_DISTRO_NAME" ]]; then
    deno completions bash > /home/linuxbrew/.linuxbrew/etc/bash_completion.d/deno.bash
  else
    deno completions bash > /usr/local/etc/bash_completion.d/deno.bash
  fi
  # shellcheck disable=1090
  . ~/.bashrc
fi
