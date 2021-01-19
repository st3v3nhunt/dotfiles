# Dot files

[![Release Build Status](https://github.com/st3v3nhunt/dotfiles/workflows/Release/badge.svg)](https://github.com/st3v3nhunt/dotfiles/actions?workflow=Release)
[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)
[![Known Vulnerabilities](https://snyk.io/test/github/DEFRA/ffc-demo-web/badge.svg)](https://snyk.io/test/github/DEFRA/ffc-demo-web)

> Dotfiles repo for macOS and Linux WSL distros

Clone the repo somewhere on the local disk and run `./install.sh`. This will do
most of the following but some installation steps are OS dependent. The details
can be seen in [install.sh](install.sh).:

* Symlink all dotfiles into the user's home directory
* Install [Oh My Zsh](https://ohmyz.sh/) and some plugins
* Install [Homebrew](https://brew.sh/) and some brews
* Install [Caskroom](https://caskroom.github.io/) and some casks (GUI
  applications, mostly)
* Install some [Gems](https://rubygems.org)
* Install some [Pips](https://pypi.org/)
* Install some [Node.js](https://nodejs.org/en/) stuff including
  [nvm](https://github.com/nvm-sh/nvm) and globally installed npm packages
  including [Yarn](https://yarnpkg.com/)
* Install and setup [tmux](https://github.com/tmux/tmux) related stuff
* Install and setup [Vim](https://www.vim.org/) related stuff
* Install .Net tooling
* Install [Powerline fonts](https://github.com/powerline/fonts)
* Install [Rust](https://www.rust-lang.org/)

At several stages during the running of the installation scripts your password
will be prompted for.

## .gitconfig.local

There are several reasons why it is a good idea to have a file with git config
in that doesn't get checked into the repo. It can contain secret information
such as passwords and it can also contain differences due to the OS. The latter
is the specific use case with this repo. `credential.helper` should be added to
a file called `.gitconfig.local` that is stored in the home dir.  Add the
config as follows. For macOS -
`git config --file ~/.gitconfig.local credential.helper "osxkeychain"`
and for WSL -
`git config --file ~/.gitconfig.local credential.helper "/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-manager.exe"`.

## WSL/Windows

[Windows Terminal](https://github.com/microsoft/terminal/blob/master/doc/user-docs/index.md)
is used, settings are available in [WSL/profiles.json](WSL/profiles.json). See
[install-wsl-stuff](./scripts/install-wsl-stuff.sh) for details.

## macOS

### Manual steps

* Set Resolution of display (System Preferences -> Displays -> Display)

### iTerm2 preferences

iTerm2 preferences are stored @ `/plists/com.googlecode.iterm2.plist`. Within
iTerm2 this setting will need to be entered before these will be used.
Go to `Preferences->General` and enter `~/code/dotfiles/plists` into the option
for `Load preferences from a custom folder or URL:`.

### Installing Docker for Mac

At the time of writing [Docker for Mac](https://www.docker.com/docker-mac) is
not available via Homebrew. It can be downloaded from the
[Docker Store](https://store.docker.com/editions/community/docker-ce-desktop-mac).

## Language specifics

### Go language support in Vim

Install [vim-go](https://github.com/fatih/vim-go).
The plugin will be installed when running `./install-vim-stuff`. Once the
plugin is installed `:GoInstallBinaries` needs to be run from within Vim.

### C# IDE like abilities

[OmniSharp](https://github.com/OmniSharp/omnisharp-roslyn) will provide IDE
like capabilities within Vim. The easiest way to do that is to install the
[OmniSharp-vim](https://github.com/OmniSharp/omnisharp-vim) plugin which will
happen using the [.vimrc](./dotfiles/.vimrc) in this repo.
Once installed, autocomplete is available in insert mode using `<C-x><C-o>`.
There are a number of shortcuts available for frequently used commands,
available for review in [cs.vim](./vim/ftplugin/cs.vim).

## Terminal

### Powerline Fonts

In order to get the icons working for the Powerline theme for Oh My Zsh follow
these
[instructions](https://github.com/romkatv/powerlevel10k#manual-font-installation)
which involves downloading and installing the MesloLGS font files.

### [Tmux plugin manager](https://github.com/tmux-plugins/tpm)

Tmux plugin manager is installed along with the following plugins:

* [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) - enables
  session saving and restoration via `prefix + Ctrl-s` and `prefix + Ctrl-r`
* [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum) - automates
  session the actions of `tmux-resurrect`

If either plugin isn't working try reloading tmux config with `prefix + I`.

## FAQ

* No linting in Vim and no lint warning or error symbols in the margin?
  * Check the repo's packages have been installed
  * Try restarting the eslint server. At the terminal run `eslint_d restart`
* No completion in VIM?
* Command failed and error reported `...can't decompress data; zlib not available`
  * Run `sudo installer -pkg
    /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg
    -target /`
* If an error like this occurs - `Warning: Unexpected method 'license' called
  on Cask <cask_name>.` it might be because the cask is old and out of date, try:
  * Removing the cask via `rm -rf $(brew --prefix)/Caskroom/<cask_name>`
* Want to fetch all PRs from GitHub or MRs from GitLab locally?
  * Add the following to the repo's `.git/config`:

  ```ini
  [remote "origin"]
  fetch = +refs/pull/*:refs/remotes/origin/pull/*
  fetch = +refs/merge-requests/*/head:refs/remotes/origin/merge-requests/*
  ```

* Reload `.vimrc` within Vim without restarting Vim - `:so $MYVIMRC`
* Sort Vim's dictionary in place (`-o`) and case insensitively (`-f`) -
  `sort -f -o vim/en.utf-8.add vim/en-utf-8.add`
* Errors like `nvm is not compatible with the npm config "prefix" option`
  * Try running `nvm unalias default`
* No `deno` autocompletion?
  * They probably failed to be created after `deno` had been installed. Re-run
    the commands as shown in the
    [docs](https://deno.land/manual/getting_started/setup_your_environment#shell-autocomplete)
    and re-source the shell

## Architecture Decision Records

This repo uses
[Architecture Decision Records](http://thinkrelevance.com/blog/2011/11/15/documenting-architecture-decisions)
to record architectural decisions for this project.
They are stored in [doc/architecture/decisions](doc/architecture/decisions).
