echo "Linking alacritty.yml"
echo "Running `mklink C:\Users\st3v3\AppData\Roaming\alacritty\alacritty.yml \\wsl$\Ubuntu-18.04\home\shunt\code\dotfiles\wsl\alacritty.yml`"
mklink C:\Users\st3v3\AppData\Roaming\alacritty\alacritty.yml \\wsl$\Ubuntu-18.04\home\shunt\code\dotfiles\wsl\alacritty.yml

echo "Linking Windows Terminal settings.json"
echo "Running `mklink C:\Users\st3v3\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json \\wsl$\Ubuntu-18.04\home\shunt\code\dotfiles\wsl\settings.json`"
mklink C:\Users\st3v3\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json \\wsl$\Ubuntu-18.04\home\shunt\code\dotfiles\wsl\settings.json
