#!/usr/bin/env bash

echo "Installing zsh-nvm (https://github.com/lukechilds/zsh-nvm.git)..."
git clone https://github.com/lukechilds/zsh-nvm.git ~/.zsh-nvm

echo "Installing global npm packages (serverless, snyk, yarn)..."
npm install -g @commitlint/cli
npm install -g @commitlint/config-conventional
npm install -g @vue/cli
npm install -g eslint_d
npm install -g prettier
npm install -g serve
npm install -g serverless
npm install -g standard
npm install -g snyk
npm install -g ts-standard
npm install -g typescript
npm install -g yarn

echo "Installing Deno autocompletion. Reload shell once complete..."
mkdir ~/.oh-my-zsh/custom/plugins/deno
deno completions zsh > ~/.oh-my-zsh/custom/plugins/deno/_deno

if [[ -n "$WSL_DISTRO_NAME" ]]; then
  deno completions bash > /home/linuxbrew/.linuxbrew/etc/bash_completion.d/deno.bash
else
  deno completions bash > /usr/local/etc/bash_completion.d/deno.bash
fi
