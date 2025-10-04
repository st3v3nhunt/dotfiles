#!/usr/bin/env bash
# NOTE: This needs to be called once all the tooling has been installed for the
# package management duties

echo "Install Language Servers"
# https://github.com/mads-hartmann/bash-language-server
npm i -g bash-language-server

# https://github.com/rcjsuen/dockerfile-language-server-nodejs
npm i -g dockerfile-language-server-nodejs

# https://github.com/elixir-lsp/elixir-ls
brew install elixir-ls

# https://github.com/golang/tools/tree/master/gopls
go install golang.org/x/tools/gopls@latest

# JSON
# https://github.com/hrsh7th/vscode-langservers-extracted
npm i -g vscode-langservers-extracted

# https://github.com/sumneko/lua-language-server
brew install lua-language-server
# luarock should be installed during install-brews.sh, but just in case
brew install luarocks
luarocks install luacheck

# https://github.com/fsouza/prettierd
npm install -g @fsouza/prettierd

# https://github.com/rust-analyzer/lsp-server
brew install rust-analyzer

# https://kampfkarren.github.io/selene/
cargo install selene

# https://github.com/sveltejs/language-tools/tree/master/packages/language-server
npm i -g svelte-language-server

# https://github.com/tailwindlabs/tailwindcss-intellisense
npm i -g @tailwindcss/language-server

# https://github.com/rust-analyzer/lsp-server
cargo install --features lsp --locked taplo-cli

# https://github.com/typescript-language-server/typescript-language-server
npm i -g typescript typescript-language-server

# https://github.com/vuejs/vetur/tree/master/server
npm i -g vls

# https://github.com/redhat-developer/yaml-language-server
npm i -g yaml-language-server

echo "Install other tools used by Neovim"
# https://github.com/igorshubovych/markdownlint-cli
npm i -g markdownlint-cli
npm i -g markdownlint-cli2
# https://github.com/mantoni/eslint_d.js
npm i -g eslint_d
# https://github.com/Riverside-Healthcare/djLint
pip3 install djlint
