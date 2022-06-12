#!/usr/bin/env bash

echo "Installing rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "Installing Rustlings..."
curl -L https://git.io/install-rustlings | bash

echo "Installing some useful cargo based utils..."
cargo install cargo-watch
cargo install cargo-generate
cargo install cargo-benchcmp

echo "Install additional toolchain versions..."
rustup toolchain install beta
rustup toolchain install nightly

echo "Install rustup and cargo shell completion for bash..."
rustup completions bash > "$(brew --prefix)/etc/bash_completion.d/rustup.bash-completion"
rustup completions bash cargo > "$(brew --prefix)/etc/bash_completion.d/cargo.bash-completion"

echo "Install rustup and cargo shell completion for zsh..."
mkdir ~/.zfunc
rustup completions zsh > ~/.zfunc/_rustup
rustup completions zsh cargo > ~/.zfunc/_cargo
