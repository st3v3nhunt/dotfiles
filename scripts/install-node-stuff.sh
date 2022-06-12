#!/usr/bin/env bash

echo "Installing zsh-nvm (https://github.com/lukechilds/zsh-nvm.git)..."
ZSH_NVM_DIR=~/.zsh-nvm
if [[ ! -d $ZSH_NVM_DIR ]]; then
  git clone https://github.com/lukechilds/zsh-nvm.git ~/.zsh-nvm
elif [[ -d $ZSH_NVM_DIR ]]; then
  pushd $ZSH_NVM_DIR && git pull
  popd || exit
fi

echo "Install latest Node LTS version..."
nmv install --lts

echo "Installing global npm packages (serverless, snyk, yarn)..."
npm install -g @commitlint/cli
npm install -g @commitlint/config-conventional
npm install -g @vue/cli
npm install -g eslint_d
npm install -g firebase-tools
npm install -g neovim
npm install -g pnpm
npm install -g prettier
npm install -g serve
npm install -g serverless
npm install -g standard
npm install -g snyk
npm install -g ts-standard
npm install -g typescript
npm install -g typescript-languge-server
npm install -g yarn

echo "Installing Deno autocompletion. Reload shell once complete..."
mkdir -pm~/.oh-my-zsh/custom/plugins/deno
deno completions zsh > ~/.oh-my-zsh/custom/plugins/deno/_deno

deno completions bash > "$HOMEBREW_PREFIX/etc/bash_completion.d/deno.bash"
