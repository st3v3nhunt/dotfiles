#!/usr/bin/env bash
# NOTE: This needs to be called once all the tooling has been installed for the
# package management duties

echo "Install Language Servers"
# https://github.com/mads-hartmann/bash-language-server
npm install -g bash-language-server

# https://github.com/rcjsuen/dockerfile-language-server-nodejs
npm install -g dockerfile-language-server-nodejs

# https://github.com/hrsh7th/vscode-langservers-extracted
npm install -g vscode-langservers-extracted

# https://github.com/sumneko/lua-language-server
brew install lua-language-server

# https://github.com/rust-analyzer/lsp-server
brew install rust-analyzer

# https://github.com/sveltejs/language-tools/tree/master/packages/language-server
npm install -g svelte-language-server

# https://github.com/tailwindlabs/tailwindcss-intellisense
npm install -g @tailwindcss/language-server

# https://github.com/rust-analyzer/lsp-server
cargo install --features lsp --locked taplo-cli

# https://github.com/typescript-language-server/typescript-language-server
npm install -g typescript typescript-language-server

# https://github.com/redhat-developer/yaml-language-server
npm install -g yaml-language-server

echo "Install other tools used by Neovim"
# https://github.com/igorshubovych/markdownlint-cli
npm i -g markdownlint-cli
