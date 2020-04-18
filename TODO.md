# To do:

## Vim

- [ ] Bindings for resize of splits
- [ ] Split [.vimrc](./dotfiles/.vimrc) into multiple files

## tmux

- [ ] tmuxinator
- [ ] tmate

## Bash

- [ ] Install bash version 4 automatically. [Reference](https://gist.github.com/Rican7/44081a9806595704fa7b289c32fcd62c)


## Ubuntu / WSL 2 changes

- [ ] Use `$OSTYPE` to vary actions based on OS
- [ ] Install zsh on `linux-gnu` - `apt install zsh`
- [ ] Only run `defaults.sh` on darwin
- [ ] Install powerline fonts and icons for Ubuntu
- [ ] Possibly this should be done as brew can work on Linux --> Do not install brew on Ubuntu & create brew-install equivalent for Ubuntu
- [ ] Need to run `sudo apt-get update` followed by `sudo apt-get install build-essential curl file git` to get everything install for brew to be installed
- [ ] Update `brew.sh` to have this `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`
- [ ] Run `echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> /home/shunt/.zprofile` and `eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)`. Look at what has been added to `.zprofile` and see if this can be added to dotfiles
- [ ] Add `gcc` to list of brews to be installed
- [ ] Go through the list of brews and split them into darwin and linux appropriate
- [ ] Do no install and casks for linux
- [ ] Install Chocolatey from https://chocolatey.org/docs/installation
- [ ] Create choco install script with all of the packages
