#!/usr/bin/env bash

echo "Installing rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "Installing cargo watch..."
cargo install cargo-watch

echo "Install rustup and cargo shell completion for bash..."
rustup completions bash > "$(brew --prefix)/etc/bash_completion.d/rustup.bash-completion"
rustup completions bash cagro > "$(brew --prefix)/etc/bash_completion.d/cargo.bash-completion"

echo "Install rustup and cargo shell completion for zsh..."
mkdir ~/.zfunc
rustup completions zsh > ~/.zfunc/_rustup
rustup completions zsh cargo > ~/.zfunc/_cargo