#!/usr/bin/env bash

echo "Install Bash Language Server"
# https://github.com/mads-hartmann/bash-language-server
npm install -g bash-language-server

echo "Install Docker Language Server"
# https://github.com/rcjsuen/dockerfile-language-server-nodejs
npm install -g dockerfile-language-server-nodejs

echo "Install JSON Language Server"
# https://github.com/hrsh7th/vscode-langservers-extracted
npm install -g vscode-langservers-extracted

echo "Install Lua Language Server"
# https://github.com/sumneko/lua-language-server
brew install lua-language-server

# Remark doesn't work unless copy is available in project -
# https://github.com/remarkjs/remark-language-server/issues/6
# echo "Install Markdown Language Server"
# # https://github.com/remarkjs/remark-language-server
# npm install -g remark-language-server

echo "Install rust-analyzer"
# https://github.com/rust-analyzer/lsp-server
brew install rust-analyzer

echo "Install TOML LSP"
# https://github.com/rust-analyzer/lsp-server
cargo install --features lsp --locked taplo-cli

echo "Install TypeScript Language Server"
# https://github.com/typescript-language-server/typescript-language-server
npm install -g typescript-languge-server

echo "Install YAML Language Server"
# https://github.com/redhat-developer/yaml-language-server
npm install -g yaml-language-server
