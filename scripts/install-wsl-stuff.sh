#!/usr/bin/env bash
# Install stuff for linux home brew - https://docs.brew.sh/Homebrew-on-Linux
sudo apt-get update
sudo apt-get install build-essential curl file git zsh vim.gtk
sudo apt-get install apt-transport-https
sudo apt-get install dotnet-sdk-3.1

echo "Installing Deno..."
curl -fsSL https://deno.land/x/install/install.sh | sh

REPO_DIR="$( cd "$( dirname "$(dirname "${BASH_SOURCE[0]}" )" )" && pwd )"

echo "Copying 'wsl.conf' into /etc/. Password will be required"
sudo ln -nfsv "$REPO_DIR/wsl/wsl.conf" /etc/

echo "If there are problems with installing, checkout the troubleshooting on this page"
echo "https://docs.microsoft.com/en-us/dotnet/core/install/linux-package-manager-ubuntu-2004#install-the-net-core-sdk"
