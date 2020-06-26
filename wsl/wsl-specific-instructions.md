# Stuff to do on Windows

## Alacritty

[Alacritty](https://github.com/alacritty/alacritty) is a terminal emulator that
can be used in place of Windows Terminal. It seems to be better at handling
vertical tmux panes. Due to Alacritty being a GUI it needs to be installed on
Windows. Installing is easily achieved via chocolately - `cinst alacritty`.
Upgrades are `choco upgrade alacritty`.

Alacritty can be configured via a file. The file is stored within the dotfiles
repo. In order to link the application's file with the one in the repo a
symlink can be created between the two but requires the `mklink` cmd
application.
This will happen by default when running
[install-wsl-stuff](./scripts/install-wsl-stuff.sh). Of note, the WSL user, the
Windows user and the WSL distribution are variable and need to be correct in
order for the linking to work.

## Windows Terminal

[Windows Terminal](https://github.com/microsoft/terminal) is a terminal
emulator. It has a config file that is stored in the
dotfiles repo and needs to be linked to keep it in sync, in the same way the
Alacritty config is, this will happen when running the script listed above.
