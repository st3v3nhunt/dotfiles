#!/usr/bin/env bash
# Install stuff for linux home brew - https://docs.brew.sh/Homebrew-on-Linux
sudo apt-get update
sudo apt-get install build-essential curl file git zsh
sudo apt-get install apt-transport-https
sudo apt-get install dotnet-sdk-3.1

echo "If there are problems with installing, checkout the troubleshooting on this page"
echo "https://docs.microsoft.com/en-us/dotnet/core/install/linux-package-manager-ubuntu-2004#install-the-net-core-sdk"

echo "Installing Deno..."
curl -fsSL https://deno.land/x/install/install.sh | sh

REPO_DIR="$( cd "$( dirname "$(dirname "${BASH_SOURCE[0]}" )" )" && pwd )"

echo "Copying 'wsl.conf' into /etc/. Password will be required"
sudo ln -nfsv "$REPO_DIR/wsl/wsl.conf" /etc/

echo "Linking files in Windows to those in the dotfiles repo on the specific WSL distro"
WINDOWS_USER=st3v3
WSL_OS="Ubuntu-20.04"
WSL_USER=shunt

echo "Linking alacritty.yml"
cmd.exe /c mklink "C:\\Users\\$WINDOWS_USER\\AppData\\Roaming\\alacritty\\alacritty.yml" "\\\\wsl$\\$WSL_OS\\home\\$WSL_USER\\code\\dotfiles\\wsl\\alacritty.yml"

echo "Linking Windows Terminal settings.json"
cmd.exe /c mklink "C:\\Users\\$WINDOWS_USER\\AppData\\Local\\Packages\\Microsoft.WindowsTerminal_8wekyb3d8bbwe\\LocalState\\settings.json" "\\\\wsl$\\$WSL_OS\\home\\$WSL_USER\\code\\dotfiles\\wsl\\windows-terminal.settings.json"

echo "Linking Windows Terminal Preview settings.json"
cmd.exe /c mklink "C:\\Users\\$WINDOWS_USER\\AppData\\Local\\Packages\\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\\LocalState\\settings.json" "\\\\wsl$\\$WSL_OS\\home\\$WSL_USER\\code\\dotfiles\\wsl\\windows-terminal-preview.settings.json"
