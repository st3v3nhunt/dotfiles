# Dot files

Clone the repo somewhere on the local disk and run `./install.sh`. This will:

* Symlink all dotfiles into the user's home directory
* Install [Homebrew](http://brew.sh/) and some packages
* Install [Caskroom](https://caskroom.github.io/) and some applications
* Install [Karabiner-Elements](https://github.com/tekezo/Karabiner-Elements)

During the install of Homebrew you will be prompted for your password.

## Setup user gitconfig info

Git user config is held in an ignored file @ `~/.gitconfig.local`. This should
contain user.name and user.email

## Locking the screen

Locking the screen with the internal keyboard is `command + shift + power`.
This doesn't work on an external keyboard as there is no power key and even with
the key remapped to another (pause) it still doesn't work. Which leaves two
reasonable alternatives for locking the machine (both of which require having
the password immediately be required once the screen saver starts):
* Set a hot corner to start the screen saver
* Have the keychain status show in the menu bar
