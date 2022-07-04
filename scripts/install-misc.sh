#!/usr/bin/env bash
# Script to run 'simple' commands that aren't worthy of their own named script

echo "Install flyctl shell completion for zsh and bash"
fly completion zsh > ~/.zfunc/_flyctl
fly completion bash > "$(brew --prefix)/etc/bash_completion.d/flyctl.bash"
