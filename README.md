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

## iTerm2 preferences

iTerm2 perferences are stored @ `/plists/com.googlecode.iterm2.plist`. Within iTerm2
this setting will need to be enetred before these will be used.
Go to `Preferences->General` and enter `~/code/dotfiles/plists` into the option
for `Load preferences from a custom folder or URL:`.

## Locking the screen

Locking the screen with the internal keyboard is `command + shift + power`.
This isn't possible from an external keyboard. The best option I've found is to
have the keychain status be displayed in the menu bar and use the shortcut
to `Lock Screen`.

## FAQ

* No linting in Vim and no lint warning or error symbols in the margin?
  * Try restarting the eslint server. At the terminal run `eslint_d restart`
* No completion in VIM?
  * Try restarting the YouCompleteMe server within Vim `:YcmRestartServer`

