#!/usr/bin/env bash

# shellcheck source=lib.sh
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

if ! command -v rustup &>/dev/null; then
  echo "Installing rust..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
else
  echo "Rust already installed, skipping..."
fi

# Make cargo available to the rest of this script on a fresh install
# shellcheck source=/dev/null
source "$HOME/.cargo/env"

# Cargo tools are installed by mise (.config/mise/config.toml)

echo "Install additional toolchain versions..."
rustup toolchain install beta
rustup toolchain install nightly

echo "Install rustup and cargo shell completion for bash..."
rustup_bash_completion="$(bash_completion_file rustup rustup.bash-completion)"
cargo_bash_completion="$(bash_completion_file cargo cargo.bash-completion)"
mkdir -p "$(dirname "$rustup_bash_completion")"
rustup completions bash >"$rustup_bash_completion"
rustup completions bash cargo >"$cargo_bash_completion"

echo "Install rustup and cargo shell completion for zsh..."
mkdir -p ~/.zfunc
rustup completions zsh >~/.zfunc/_rustup
rustup completions zsh cargo >~/.zfunc/_cargo
