# Stuff to do on Windows


## Alacritty

[Alacritty](https://github.com/alacritty/alacritty) is a terminal emulator that
can be used in place of Windows Terminal. It seems to be much better at
handling many tmux panes. Due to it being a GUI it needs to be installed in
Windows. There is some configuration that can be done to it and this file is
stored within the dotfiles repo. Ideally this would be linked. It is possible
to do this but it needs to be done from Windows. This is how to do that.

Create symbolic link between alacritty config in Windows and the file in the
dotfiles repoo. Run this command on Windows in `cmd`:

`mklink C:\Users\st3v3\AppData\Roaming\alacritty\alacritty.yml \\wsl$\Ubuntu-18.04\home\shunt\code\dotfiles\wsl\alacritty.yml`

Note both the name of the Windows user and the WSL user are required, `st3v3`
and `shunt` in this case.

## Windows Terminal

[Windows Terminal](https://github.com/microsoft/terminal) is a terminal
emulator that generally works well. It has a config file that is stored in the
dotfiles repo and needs to be linked to keep it in sync, in the same way the
Alacritty config is.
