# Dot files

[![Build Status](https://github.com/st3v3nhunt/dotfiles/workflows/CI/badge.svg)](https://github.com/st3v3nhunt/dotfiles/actions?workflow=CI)

Clone the repo somewhere on the local disk and run `./install.sh`. This will:

* Symlink all dotfiles into the user's home directory
* Install [Homebrew](https://brew.sh/) and some brews
* Install [Caskroom](https://caskroom.github.io/) and some casks (applications, mostly)
* Install [Karabiner-Elements](https://github.com/tekezo/Karabiner-Elements)
* Install any useful [Gems](https://rubygems.org)
* Install any useful [Pips](https://pypi.org/)
* Install [NVM](https://github.com/nvm-sh/nvm)
* Install and setup [Vim](https://www.vim.org/) related stuff
* Install and setup [tmux](https://github.com/tmux/tmux) related stuff

During the install of Homebrew you will be prompted for your password.

## Installing Docker for Mac

At the time of writing [Docker for Mac](https://www.docker.com/docker-mac) is
not available via Homebrew. It can be downloaded from the
[Docker Store](https://store.docker.com/editions/community/docker-ce-desktop-mac).

## Go language support in Vim

Achieved via [vim-go](https://github.com/fatih/vim-go).
The plugin will be installed when running `./install-vim-stuff`. Once the
plugin is installed `:GoInstallBinaries` needs to be run from within Vim.

## C# IDE like abilities

Install OmniSharp as per the
[instructions](https://www.omnisharp.net/#portfolioModal-vim). Start by
downloading and extracting the latest version of the
[OmniSharp-Roslyn](https://github.com/OmniSharp/omnisharp-vim#server) server
into `~/`. This should result in a path to the executable being
`~/omnisharp.http-osx/omnisharp/OmniSharp.exe` (this path is specified in
[dotfiles/.vimrc](dotfiles/.vimrc).

## iTerm2 preferences

iTerm2 preferences are stored @ `/plists/com.googlecode.iterm2.plist`. Within iTerm2
this setting will need to be entered before these will be used.
Go to `Preferences->General` and enter `~/code/dotfiles/plists` into the option
for `Load preferences from a custom folder or URL:`.

## Locking the screen

Locking the screen with both internal and external keyboards is done via
`CTRL + CMD + q`.

## [Tmux plugin manager](https://github.com/tmux-plugins/tpm)

Tmux plugin manager is installed. Mainly for adding
[tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect). Usage is
simple, to save the session run `prefix + Ctrl-s` and restore the session, run
`prefix + Ctrl-r`. Sessions should be saved prior to machine restart.

If it isn't working try reloading tmux config with `prefix + I`.

## Manual steps

* Install Bomgar client
* Set Resolution of display (System Preferences -> Displays -> Display)

## FAQ

* Python crashing when starting Vim?
  * Try reinstalling Python, Vim and YCM `brew update; brew uninstall python; brew uninstall vim; brew install python; brew install vim; ~/.vim/bundle/YouCompleteMe/install.py`
* No linting in Vim and no lint warning or error symbols in the margin?
  * Check the repo's packages have been installed
  * Try restarting the eslint server. At the terminal run `eslint_d restart`
* No completion in VIM?
  * Try restarting the YouCompleteMe server within Vim `:YcmRestartServer`
* Command failed and error reported `...can't decompress data; zlib not available`
  * Run `sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /`
* If an error like this occurs - `Warning: Unexpected method 'license' called on Cask <cask_name>.` it might be because the cask is old and out of date. Try:
  * Removing the cask via `rm -rf $(brew --prefix)/Caskroom/<cask_name>`
* Want to fetch all PRs from GitHub or MRs from GitLab locally?
  * Add the following to the repo's `.git/config`:
  ```
  [remote "origin"]
  fetch = +refs/pull/*:refs/remotes/origin/pull/*
  fetch = +refs/merge-requests/*/head:refs/remotes/origin/merge-requests/*
  ```
* Reload `.vimrc` within Vim without restarting Vim - `:so $MYVIMRC`
* Sort Vim's dictionary (in place and case insensitively) -
  `sort -f -c ./vim/en.utf-8.add ./vim/en-utf-8.add`

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

## Architecture Decision Records

This repo uses
[Architecture Decision Records](http://thinkrelevance.com/blog/2011/11/15/documenting-architecture-decisions)
to record architectural decisions for this project.
They are stored in [doc/architecture/decisions](doc/architecture/decisions).
