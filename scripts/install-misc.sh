#!/usr/bin/env bash
# Script to run 'simple' commands that aren't worthy of their own named script

# shellcheck source=lib.sh
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

if command -v fly &>/dev/null; then
  info "Install flyctl shell completion for zsh and bash"
  fly_bash_completion="$(bash_completion_file flyctl flyctl.bash)"
  mkdir -p ~/.zfunc "$(dirname "$fly_bash_completion")"
  fly completion zsh >~/.zfunc/_flyctl
  fly completion bash >"$fly_bash_completion"
else
  warn "flyctl not found, skipping its shell completion"
fi
