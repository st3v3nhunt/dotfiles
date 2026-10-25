#!/usr/bin/env bash

if ! command -v rustup &>/dev/null; then
  echo "Installing rust..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
else
  echo "Rust already installed, skipping..."
fi

# Make cargo available to the rest of this script on a fresh install
# shellcheck source=/dev/null
source "$HOME/.cargo/env"

echo "Installing Rustlings..."
cargo install rustlings

echo "Installing some useful cargo based utils..."
cargo install cargo-watch
cargo install cargo-generate
cargo install cargo-benchcmp

echo "Install additional toolchain versions..."
rustup toolchain install beta
rustup toolchain install nightly

echo "Install rustup and cargo shell completion for bash..."
mkdir -p "$(brew --prefix)/etc/bash_completion.d"
rustup completions bash >"$(brew --prefix)/etc/bash_completion.d/rustup.bash-completion"
rustup completions bash cargo >"$(brew --prefix)/etc/bash_completion.d/cargo.bash-completion"

echo "Install rustup and cargo shell completion for zsh..."
mkdir -p ~/.zfunc
rustup completions zsh >~/.zfunc/_rustup
rustup completions zsh cargo >~/.zfunc/_cargo
