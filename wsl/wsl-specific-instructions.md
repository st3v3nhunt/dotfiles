# Stuff to do on Windows

## Windows Terminal

[Windows Terminal](https://github.com/microsoft/terminal) is a terminal
emulator. It has a config file that is stored within the dotfiles repository.
In order to link the application's file with the one in the repository a
symlink can be created between the two but requires the `mklink` cmd
application. This will happen by default when running
[install-wsl-stuff](../scripts/install-wsl-stuff.sh). Of note, the WSL user, the
Windows user and the WSL distribution are variable and need to be correct in
order for the linking to work.
