#!/usr/bin/env bash
# Install zsh with apt if it is missing and make it the login shell

# shellcheck source=lib.sh
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

if ! command -v zsh &>/dev/null; then
  if ! command -v apt-get &>/dev/null; then
    error "zsh is not installed and apt-get is not available, install zsh another way"
    exit 1
  fi
  info "Installing zsh. Password will be required..."
  sudo apt-get update
  sudo apt-get install -y zsh
fi

if ! zsh_path="$(command -v zsh)"; then
  error "zsh install failed"
  exit 1
fi

# chsh only accepts shells listed in /etc/shells
if ! grep -Fxq "$zsh_path" /etc/shells; then
  info "Adding $zsh_path to /etc/shells. Password will be required..."
  echo "$zsh_path" | sudo tee -a /etc/shells >/dev/null
fi

login_shell="$(getent passwd "$(id -un)" | cut -d: -f7)"
if [[ "$login_shell" == "$zsh_path" ]]; then
  info "zsh is already the login shell, skipping..."
  exit 0
fi

info "Changing login shell from ${login_shell:-unknown} to $zsh_path. Password will be required..."
if ! chsh -s "$zsh_path"; then
  error "chsh failed. If accounts on this machine are managed centrally (LDAP, SSSD), ask IT to change the shell"
  exit 1
fi
info "Login shell changed, log out and back in for it to take effect"
