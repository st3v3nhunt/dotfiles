#!/usr/bin/env bash
# Usage: ./install.sh [step...]
#   With no arguments every step runs in order. Pass step names to run only
#   those, or --list to print the available steps.
#   A failed step is reported and the remaining steps still run.

# shellcheck source=scripts/lib.sh
source "$(dirname "${BASH_SOURCE[0]}")/scripts/lib.sh"
cd "$REPO_DIR" || exit 1

# <step name>:<os>:<command>, where <os> is all, mac or wsl
STEPS=(
  "wsl:wsl:./scripts/install-wsl-stuff.sh"
  "links:all:./scripts/install-links.sh --prune"
  "oh-my-zsh:all:./scripts/install-oh-my-zsh.sh"
  "brew:all:./scripts/install-brew.sh"
  "brew-bundle:all:./scripts/install-brew-bundle.sh"
  "macos-defaults:mac:./scripts/defaults.sh"
  "mac:mac:./scripts/install-mac-stuff.sh"
  "gems:all:./scripts/install-gems.sh"
  "gcloud:all:./scripts/install-gcloud.sh"
  "go:all:./scripts/install-go-stuff.sh"
  "misc:all:./scripts/install-misc.sh"
  "node:all:./scripts/install-node-stuff.sh"
  "python:all:./scripts/install-python-stuff.sh"
  "tmux:all:./scripts/install-tmux-stuff.sh"
  "dotnet:all:./scripts/install-dotnet-tools.sh"
  "rust:all:./scripts/install-rust-stuff.sh"
  "aws:all:./scripts/install-or-upgrade-aws-cli.sh"
  "wasm:all:./scripts/install-wasm-stuff.sh"
  "nvim-tooling:all:./scripts/install-nvim-tooling.sh"
)

step_names() {
  local step
  for step in "${STEPS[@]}"; do
    echo "${step%%:*}"
  done
}

if [[ "$1" == "--list" ]]; then
  step_names
  exit 0
fi

for requested in "$@"; do
  if ! step_names | grep -Fxq "$requested"; then
    error "Unknown step: $requested (see ./install.sh --list)"
    exit 1
  fi
done

# Make tools installed by earlier steps available to later ones
load_brew_env
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

failed=()
for step in "${STEPS[@]}"; do
  name="${step%%:*}"
  rest="${step#*:}"
  os="${rest%%:*}"
  cmd="${rest#*:}"

  if [[ $# -gt 0 ]] && ! printf '%s\n' "$@" | grep -Fxq "$name"; then
    continue
  fi
  case "$os" in
    mac) is_macos || continue ;;
    wsl) is_wsl || continue ;;
  esac

  info "==> $name"
  # shellcheck disable=2086
  if ! $cmd; then
    error "Step failed: $name"
    failed+=("$name")
  fi

  [[ "$name" == "brew" ]] && load_brew_env
done

if [[ ${#failed[@]} -gt 0 ]]; then
  error "Failed steps: ${failed[*]}"
  error "Re-run them with: ./install.sh ${failed[*]}"
  exit 1
fi
info "All steps completed"
