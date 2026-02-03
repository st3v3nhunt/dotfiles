#!/usr/bin/env bash

# Install oh-my-zsh
if [[ ! -d ~/.oh-my-zsh ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
else
  echo "oh-my-zsh already installed, skipping..."
fi

[[ ! -d ~/.zsh/zsh-autosuggestions ]] && git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
[[ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

# Install spaceship theme (https://github.com/spaceship-prompt/spaceship-prompt)
SPACESHIP_INSTALL_PATH=$ZSH_CUSTOM/themes/spaceship-prompt
if [[ -n $ZSH && ! -d $SPACESHIP_INSTALL_PATH ]]; then
  echo "spaceship theme will be downloaded..."
  git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$SPACESHIP_INSTALL_PATH" --depth=1
  ln -s "$SPACESHIP_INSTALL_PATH/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
fi
# Install powerlevel10k theme (https://github.com/romkatv/powerlevel10k#installation)
POWERLEVEL_INSTALL_PATH=$ZSH/custom/themes/powerlevel10k
if [[ -n $ZSH && ! -d $POWERLEVEL_INSTALL_PATH ]]; then
  echo "powerlevel10k theme will be downloaded..."
  git clone https://github.com/romkatv/powerlevel10k.git "$POWERLEVEL_INSTALL_PATH" --depth=1
fi
