#!/usr/bin/env bash

echo "Installing zsh-nvm (https://github.com/lukechilds/zsh-nvm.git)..."
git clone https://github.com/lukechilds/zsh-nvm.git ~/.zsh-nvm

echo "Installing global npm packages (serverless, snyk, yarn)..."
npm install -g serverless
npm install -g snyk
npm install -g yarn
