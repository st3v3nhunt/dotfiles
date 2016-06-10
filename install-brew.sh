#!/usr/bin/env bash
PURPLE='\033[0;35m'
GREEN='\033[0;32m'
NC='\033[0m'

printf "Install Homebrew and packages\n"
./brew.sh

printf "Install Caskroom and applications\n"
./brewcask.sh

printf "Cleaning up...\n"
brew cleanup
brew cask cleanup
