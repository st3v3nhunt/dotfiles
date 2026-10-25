#!/usr/bin/env bash

# These are only set inside zsh, so default them for this script
ZSH="${ZSH:-$HOME/.oh-my-zsh}"
ZSH_CUSTOM="${ZSH_CUSTOM:-$ZSH/custom}"

# Install oh-my-zsh
if [[ ! -d "$ZSH" ]]; then
  # KEEP_ZSHRC stops the installer replacing the repo-managed ~/.zshrc link
  KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "oh-my-zsh already installed, skipping..."
fi

[[ ! -d ~/.zsh/zsh-autosuggestions ]] && git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
[[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

# Install powerlevel10k theme (https://github.com/romkatv/powerlevel10k#installation)
POWERLEVEL_INSTALL_PATH="$ZSH_CUSTOM/themes/powerlevel10k"
if [[ ! -d "$POWERLEVEL_INSTALL_PATH" ]]; then
  echo "powerlevel10k theme will be downloaded..."
  git clone https://github.com/romkatv/powerlevel10k.git "$POWERLEVEL_INSTALL_PATH" --depth=1
fi

exit 0
