#!/usr/bin/env bash

printf "Installing alacritty\n"
cd ~/code/ || return
git clone https://github.com/jwilm/alacritty.git
cd alacritty || return

printf "Configuring rustup\n"
rustup override set stable
rustup update stable

printf "Building alacritty\n"
cargo build --release

printf "Creating application shortcut\n"
make app
cp -Rv target/release/osx/Alacritty.app /Applications/Alacritty.app

printf "Copying config into install directory\n"
cp -v ./.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
