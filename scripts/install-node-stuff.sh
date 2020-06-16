#!/usr/bin/env bash

echo "Installing zsh-nvm (https://github.com/lukechilds/zsh-nvm.git)..."
git clone https://github.com/lukechilds/zsh-nvm.git ~/.zsh-nvm

echo "Installing global npm packages..."
npm install serverless -g
npm install snyk -g

echo "Installing Yarn..."
curl -o- -L https://yarnpkg.com/install.sh | bash
