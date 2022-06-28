#!/usr/bin/env bash

echo "Install Bash Language Server"
# https://github.com/mads-hartmann/bash-language-server
npm install -g bash-language-server

echo "Install Docker Language Server"
# https://github.com/rcjsuen/dockerfile-language-server-nodejs
npm install -g dockerfile-language-server-nodejs

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
