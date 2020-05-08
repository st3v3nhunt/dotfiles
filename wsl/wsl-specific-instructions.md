# Stuff to do on Windows

## Alacritty

[Alacritty](https://github.com/alacritty/alacritty) is a terminal emulator that
can be used in place of Windows Terminal. It seems to be better at handling
vertical tmux panes. Due to Alacritty being a GUI it needs to be installed on
Windows. Installing is easily achieved via chocolately - `cinst alacritty`.
Alacritty can be configured via a file. The file is stored within the dotfiles
repo. In order to link the file used with that in the repo a symlink can be
created between the two but it needs to be done on Windows.
Running [mklink.bat](mklink.bat) in an Administrator cmd session will create
the link. Pay attention to the output message(s) as if the files already exist
the operation will not complete.

Note: both the name of the Windows user and the WSL user are required, `st3v3`
and `shunt` in this case.

## Windows Terminal

[Windows Terminal](https://github.com/microsoft/terminal) is a terminal
emulator. It has a config file that is stored in the
dotfiles repo and needs to be linked to keep it in sync, in the same way the
Alacritty config is.
Running [mklink.bat](mklink.bat) will achieve this.
