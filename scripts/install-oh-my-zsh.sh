#!/usr/bin/env bash

# Install on-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" --unattended

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting

# Install powerlevel10k theme (https://github.com/romkatv/powerlevel10k#installation)
POWERLEVEL_INSTALL_PATH=$ZSH/custom/themes/powerlevel10k
if [[ -n $ZSH && ! -d $POWERLEVEL_INSTALL_PATH ]]; then
  echo "powerlevel10k theme will be downloaded..."
  git clone https://github.com/romkatv/powerlevel10k.git "$POWERLEVEL_INSTALL_PATH"
fi
