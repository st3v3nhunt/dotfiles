#!/usr/bin/env bash

echo "Installing nvm (https://github.com/nvm-sh/nvm)..."
export NVM_DIR="$HOME/.nvm"
if [[ ! -d "$NVM_DIR/.git" ]]; then
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
else
  git -C "$NVM_DIR" fetch --tags --quiet
fi
# Check out the latest release rather than the development branch
git -C "$NVM_DIR" checkout --quiet "$(git -C "$NVM_DIR" describe --abbrev=0 --tags --match "v[0-9]*" "$(git -C "$NVM_DIR" rev-list --tags --max-count=1)")"
# nvm is a shell function, so load it into this script
# shellcheck source=/dev/null
source "$NVM_DIR/nvm.sh"

echo "Install latest Node LTS version and set to default version..."
nvm install --lts
nvm alias default lts

echo "Installing global npm packages (serverless, snyk, yarn)..."
npm install -g @commitlint/cli
npm install -g @commitlint/config-conventional
npm install -g @google/gemini-cli
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
npm install -g yarn

echo "Installing Deno autocompletion. Reload shell once complete..."
mkdir -p ~/.zfunc "$(brew --prefix)/etc/bash_completion.d"
deno completions zsh >~/.zfunc/_deno

deno completions bash >"$(brew --prefix)/etc/bash_completion.d/deno.bash"
