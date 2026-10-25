#!/usr/bin/env bash
# Install stuff for linux home brew - https://docs.brew.sh/Homebrew-on-Linux
sudo apt-get update
sudo apt-get install -y build-essential curl file git zsh
sudo apt-get install -y apt-transport-https
sudo apt-get install -y dotnet-sdk-8.0
sudo apt-get install -y inotify-tools
sudo apt-get install -y python3

echo "If there are problems with installing, checkout the troubleshooting on this page"
echo "https://docs.microsoft.com/en-us/dotnet/core/install/linux-package-manager-ubuntu-2004#install-the-net-core-sdk"

echo "Installing Deno..."
curl -fsSL https://deno.land/x/install/install.sh | sh

REPO_DIR="$(cd "$(dirname "$(dirname "${BASH_SOURCE[0]}")")" && pwd)"
echo "Copying 'wsl.conf' into /etc/. Password will be required"
sudo ln -nfsv "$REPO_DIR/wsl/wsl.conf" /etc/

echo "Linking files in Windows to those in the dotfiles repo on the specific WSL distro"
WINDOWS_USER="${WINDOWS_USER:-$USER}"
WSL_OS="${WSL_OS:-$(lsb_release -d | cut -f2 | tr ' ' '-')}"
WSL_USER="${WSL_USER:-$USER}"

echo "Linking Windows Terminal settings.json"
cmd.exe /c mklink "C:\\Users\\$WINDOWS_USER\\AppData\\Local\\Packages\\Microsoft.WindowsTerminal_8wekyb3d8bbwe\\LocalState\\settings.json" "\\\\wsl$\\$WSL_OS\\home\\$WSL_USER\\code\\dotfiles\\wsl\\windows-terminal.settings.json"

echo "Linking Windows Terminal Preview settings.json"
cmd.exe /c mklink "C:\\Users\\$WINDOWS_USER\\AppData\\Local\\Packages\\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\\LocalState\\settings.json" "\\\\wsl$\\$WSL_OS\\home\\$WSL_USER\\code\\dotfiles\\wsl\\windows-terminal-preview.settings.json"
