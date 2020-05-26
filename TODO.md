# To do:

- [ ] Is it possible to have a base `.tmux.conf` to contain the majority of the
  settings and then have the OS specific file added to it?
- [ ] Upgrade Vim on WSL to get rid of ale error disappearing cursor bug
- [ ] Review `.tmux.conf` and remove any unnecessary config

## Vim

- [ ] Bindings for resize of splits
- [ ] Split [.vimrc](./dotfiles/.vimrc) into multiple files

## Ubuntu / WSL 2 changes

- [x] Start Alacritty in `$HOME` (using wsl)
- [x] Link Terminal settings file with one in repo
- [x] Save Alacritty settings file in repo
- [x] Link Alacritty settings file with one in repo
- [x] Make Tmux synchronize-panes work for both Terminal and Alacritty
- [x] Use `$OSTYPE` to vary actions based on OS
- [x] Install zsh on `linux-gnu` - `apt install zsh`
- [x] Only run `defaults.sh` on darwin
- [x] Possibly this should be done as brew can work on Linux --> Do not install brew on Ubuntu & create brew-install equivalent for Ubuntu
- [x] Need to run `sudo apt-get update` followed by `sudo apt-get install build-essential curl file git` to get everything install for brew to be installed
- [x] Update `brew.sh` to have this `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`
- [x] Run `echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> /home/shunt/.zprofile` and `eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)`. Look at what has been added to `.zprofile` and see if this can be added to dotfiles
- [x] Add `gcc` to list of brews to be installed
- [x] Go through the list of brews and split them into darwin and linux appropriate
- [x] Do no install and casks for linux
- [x] Figure out how to get the clipboard to work between tmux panes
- [x] Figure out how to get the clipboard to work between vim and the system - it currently works when using the mouse and isn't working with the vim keys e.g. `yy`
- [x] See if git config values can be sourced from a separate file so it can be different for different OSes
- [x] Sort out the caret to be a block rather than a line in Windows Terminal
- [x] Windows Terminal - set initial window size and font size
- [x] Add colors to ls

- [?] Install Chocolatey from https://chocolatey.org/docs/installation - done, not sure about automating it
- [?] Install powerline fonts and icons for Ubuntu - done, not sure about automating it
- [?] Create choco install script with all of the packages
