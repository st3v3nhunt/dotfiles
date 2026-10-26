#!/usr/bin/env bash
# Install and upgrade the runtimes and tools in .config/mise/config.toml.
# mise itself comes from the Brewfile. The cargo tools need rustup's cargo, so
# this runs after the rust step.

# shellcheck source=lib.sh
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

if ! command -v mise &>/dev/null; then
  error "mise not found, run ./install.sh brew-bundle first"
  exit 1
fi

info "Installing mise tools..."
mise install || exit 1
info "Upgrading mise tools..."
mise upgrade --global || exit 1

# Neovim's python3_host_prog points at this venv, so pynvim survives Python
# upgrades by re-running this step
NVIM_VENV="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/venv"
info "Creating Neovim Python venv with pynvim..."
uv venv --clear --python "$(mise which python)" "$NVIM_VENV" || exit 1
uv pip install --python "$NVIM_VENV/bin/python" --upgrade pynvim || exit 1

info "Installing Deno shell completion..."
mkdir -p ~/.zfunc "$(brew --prefix)/etc/bash_completion.d"
mise exec -- deno completions zsh >~/.zfunc/_deno
mise exec -- deno completions bash >"$(brew --prefix)/etc/bash_completion.d/deno.bash"
