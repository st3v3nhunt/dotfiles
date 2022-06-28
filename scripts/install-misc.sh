#!/usr/bin/env bash
# Script to run 'simple' commands that aren't worthy of their own named script

echo "Installing Heroku CLI - password will be required..."
curl https://cli-assets.heroku.com/install.sh | sh

echo "Install flyctl shell completion for zsh and bash"
fly completion zsh > ~/.zfunc/_flyctl
fly completion bash > "$(brew --prefix)/etc/bash_completion.d/flyctl.bash"
