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

### Useful links

* [nicknisi/dotfiles](https://github.com/nicknisi/dotfiles)
* [Boost vim productivity (blog)](https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/)
* [vim + tmux - OMG!Code (video)](https://www.youtube.com/watch?v=5r6yzFEXajQ)
* [Seamlessly Navigate Vim and tmux Splits (blog)](https://robots.thoughtbot.com/seamlessly-navigate-vim-and-tmux-splits)
* [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
* [A tmux Crash Course (blog)](https://robots.thoughtbot.com/a-tmux-crash-course)
* [Making the clipboard work between iTerm2, tmux, vim and OS X. (blog)](https://evertpot.com/osx-tmux-vim-copy-paste-clipboard/)
* [Basic tmux Tutorial - Windows, Panes, and Sessions over SSH (video)](https://www.youtube.com/watch?v=BHhA_ZKjyxo)
* [tmux Quick Start (video)](https://www.youtube.com/watch?v=wKEGA8oEWXw)

