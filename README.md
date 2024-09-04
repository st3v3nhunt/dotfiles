# Dot files

[![Release Build Status](https://github.com/st3v3nhunt/dotfiles/workflows/Release/badge.svg)](https://github.com/st3v3nhunt/dotfiles/actions?workflow=Release)
[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)
[![Known Vulnerabilities](https://snyk.io/test/github/st3v3nhunt/dotfiles/badge.svg)](https://snyk.io/test/github/st3v3nhunt/dotfiles)

> Dotfiles repository for macOS and Linux WSL distros

Clone the repository somewhere on the local disk and run `./install.sh`. This
will do most of the following but some installation steps are OS dependent. The
details can be seen in [install.sh](install.sh).:

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
* Install and setup [Vim](https://www.vim.org/) and
  [neovim](https://neovim.io/) and other related stuff
* Install .Net tooling
* Install [Nerd Fonts](https://www.nerdfonts.com/)
* Install [Rust](https://www.rust-lang.org/)

At several stages during the running of the installation scripts your password will be prompted for.

## Git Config

### Machine specific Git signing key

In order to
[sign commits](https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits)
(a good idea) a signing key needs to be associated to your Git profile.

The easiest way to manage this is to use the same key on each machine where the
signing needs to happen. Once a key has been generated it can be exported and
imported
([details](https://makandracards.com/makandra-orga/37763-gpg-extract-private-key-and-import-on-different-machine)).

```sh
# List the keys and get id of the one of interest (in braces in the output)
gpg --list-secret-keys [--keyid-format=long]
# Export the key of interest to a file called `private.key`
gpg --export-secret-keys <key-id> > private.key
# Move the file to the machine where it is to be imported
gpg --import private.key
```

If this isn't possible (or desirable) there are other ways around this, most
notably using Git's
[`includeIf`](https://git-scm.com/docs/git-config#_includes). However, this
would likely introduce additional complexity and worse ergonomics (e.g. using a
specifically named directory to determine which key to use).

## WSL/Windows

[Windows Terminal](https://github.com/microsoft/terminal/blob/master/doc/user-docs/index.md)
is used, settings are available in [WSL/profiles.json](WSL/profiles.json). See
[install-wsl-stuff](./scripts/install-wsl-stuff.sh) for details.

## macOS

### Manual steps

* Set Resolution of display (System Preferences -> Displays -> Display Settings...)
* Set Text shortcuts (System Preferences -> Keyboard -> Text). Useful shortcuts:

| Replace | With                   |
| ------- | ----                   |
| @p      | personal email address |
| @w      | work email address     |
| mob     | mobile phone number    |

### iTerm2

#### Preferences

iTerm2 preferences are stored @ `/plists/com.googlecode.iterm2.plist`. Within
iTerm2 this setting will need to be entered before these will be used.
Go to `Preferences->General->Preferences` and enter `~/code/dotfiles/plists`
into the option for `Load preferences from a custom folder or URL:`.

#### Themes

The iterm preference file uses `Monokai-Dark` for the theme. This can be
downloaded from
[iterm2colorschemes](https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Molokai.itermcolors)

#### Installing Docker for Mac

At the time of writing [Docker for Mac](https://www.docker.com/docker-mac) is
not available via Homebrew. It can be downloaded from the
[Docker Store](https://store.docker.com/editions/community/docker-ce-desktop-mac).

## Language specifics

### Deno setup in Vim

Setup Vim for a Deno project by running `:CocCommand deno.initializeWorkspace`
as per
[these instructions](https://deno.land/manual/getting_started/setup_your_environment#coc).

### Go language support in Vim

Install [vim-go](https://github.com/fatih/vim-go).
The plugin will be installed when running `./install-vim-stuff`. Once the
plugin is installed `:GoInstallBinaries` needs to be run from within Vim.

### C# IDE like abilities

[OmniSharp](https://github.com/OmniSharp/omnisharp-roslyn) will provide IDE
like capabilities within (Neo)Vim in collaboration with Nvim's
[LSP](https://neovim.io/doc/user/lsp.html) using the
[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) plugin.

When a `.cs` file is opened, the plugin will check for an existing installation
of OmniSharp, if none can be found you will be prompted to install it.

OmniSharp needs to be installed as per the
[instructions](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#omnisharp).
It will need to be downloaded from the
[OmniSharp GitHub releases](https://github.com/OmniSharp/omnisharp-roslyn/releases).
Unpack the download and add it to the same directory specified in
[lsp.lua](.config/nvim/lua/plugins/lsp.lua).

#### Install gt

## Terminal

### Nerd Fonts for Powerline

In order to get the icons (glyphs) working for the Powerline theme for Oh My
Zsh follow these
[instructions](https://github.com/romkatv/powerlevel10k#manual-font-installation).
It involves downloading and installing your favourite Nerd Font from
[font-downloads](https://www.nerdfonts.com/font-downloads).
Use [JetBrains Mono](https://www.jetbrains.com/lp/mono/), it is a very good
choice and the configuration within this repository has been setup expecting it
to be installed. Once installed the terminal(s) will need to be restarted.

### [Tmux plugin manager](https://github.com/tmux-plugins/tpm)

Tmux plugin manager is installed along with the following plugins:

* [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) - enables
  session saving and restoration via `prefix + Ctrl-s` and `prefix + Ctrl-r`
* [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum) - automates
  session the actions of `tmux-resurrect`

In order to have the plugins installed, reload the config with `prefix + I`.
This can also fix problems with the plugins not working.

## FAQ

* No linting in Vim and no lint warning or error symbols in the margin?
  * Check the repository's packages have been installed
  * Try restarting the ESLint server. At the terminal run `eslint_d restart`
* No completion in VIM?
* Command failed and error reported `...can't decompress data; zlib not available`
  * Run `sudo installer -pkg
    /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg
    -target /`
* If an error like this occurs - `Warning: Unexpected method 'license' called
  on Cask <cask_name>.` it might be because the cask is old and out of date, try:
  * Removing the cask via `rm -rf $(brew --prefix)/Caskroom/<cask_name>`
* Want to fetch all PRs from GitHub or MRs from GitLab locally?
  * Add the following to the repository's `.git/config`:

  ```ini
  [remote "origin"]
  fetch = +refs/pull/*:refs/remotes/origin/pull/*
  fetch = +refs/merge-requests/*/head:refs/remotes/origin/merge-requests/*
  ```

* Reload `.vimrc` within Vim without restarting Vim - `:so $MYVIMRC` or just
  `<leader>sv`
* Sort Vim's dictionary in place (`-o`) and case insensitively (`-f`) -
  `sort -f -o vim/en.utf-8.add vim/en-utf-8.add`
* Errors like `nvm is not compatible with the npm config "prefix" option`
  * Try running `nvm unalias default`
* No `deno` shell autocompletion?
  * They probably failed to be created after `deno` had been installed. Re-run
    the commands as shown in the
    [docs](https://deno.land/manual/getting_started/setup_your_environment#shell-autocomplete)
    and re-source the shell
* Problems with Vim plugins? Try updating them with `:PlugUpdate`
* Toggle Windows Terminal focus mode with `Ctrl+Shift+Enter`
* Open Windows Terminal settings with `Ctrl+,`

## Architecture Decision Records

This repository uses
[Architecture Decision Records](http://thinkrelevance.com/blog/2011/11/15/documenting-architecture-decisions)
to record architectural decisions for this project.
They are stored in [doc/architecture/decisions](doc/architecture/decisions).
