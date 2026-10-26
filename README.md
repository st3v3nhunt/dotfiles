# Dotfiles

[![CI](https://github.com/st3v3nhunt/dotfiles/actions/workflows/main.yml/badge.svg)](https://github.com/st3v3nhunt/dotfiles/actions/workflows/main.yml)
[![Known Vulnerabilities](https://snyk.io/test/github/st3v3nhunt/dotfiles/badge.svg)](https://snyk.io/test/github/st3v3nhunt/dotfiles)

> Dotfiles for macOS and WSL environments

This repository keeps shell, git, editor, terminal, and tool configuration under version control and installs it by
symlinking repo-managed files into place.

## Installation

Clone the repository somewhere on the local disk and run:

```sh
./install.sh
```

The install script runs a series of named steps, defined in [install.sh](install.sh):

- On WSL, runs [scripts/install-wsl-stuff.sh](scripts/install-wsl-stuff.sh) first for distro and Windows integration
  setup
- Symlinks everything listed in [links.txt](links.txt) into the home directory
- Installs Homebrew packages from [Brewfile](Brewfile)
- Applies macOS-specific defaults and app configuration on macOS
- Installs language runtimes and tooling for Node.js, Python, Go, Rust, .NET, tmux, Neovim, AWS CLI, gcloud, and more

The script can be run from any directory and is safe to re-run. If a step fails the remaining steps still run, and the
failed steps are listed at the end. To run specific steps only:

```sh
./install.sh --list        # Show the available steps
./install.sh links node    # Run only the named steps
```

Some steps require network access and some will prompt for your password.

### Symlinks

[links.txt](links.txt) lists every symlink the repository manages, one per line, as
`<os> <source in repo> <destination relative to $HOME>`, where `<os>` is `all`, `mac` or `wsl`. To manage a new
config file, add a line there and run `./install.sh links`.

The `links` step runs [scripts/install-links.sh](scripts/install-links.sh) with `--prune`:

- An existing real file at a destination is moved to `<file>.backup.<timestamp>` rather than overwritten
- Symlinks into this repository that are dangling or no longer listed are removed

Preview the changes without making them with `./scripts/install-links.sh --prune --dry-run`.

## Repository Layout

- [dotfiles](dotfiles): shell and tmux configuration
- [git](git): git configuration and helper scripts
- [.config/nvim](.config/nvim): Neovim configuration
- [.config/ghostty](.config/ghostty): Ghostty configuration
- [.config/claude](.config/claude): Claude global agent instructions
- [.config/codex](.config/codex): Codex global agent instructions
- [scripts](scripts): installation and setup scripts
- [wsl](wsl): WSL and Windows-side terminal configuration
- [doc/adr](doc/adr): architecture decision records

## Homebrew Packages

Packages are managed declaratively via [Brewfile](Brewfile). Common commands:

```sh
brew bundle              # Install all packages from Brewfile
brew bundle check        # Check which packages are missing
brew bundle cleanup      # Remove packages not in Brewfile
brew bundle dump --force # Regenerate Brewfile from installed packages
```

Homebrew only loads formulae from third-party taps once they are [trusted](https://docs.brew.sh/Tap-Trust). Write
those formulae in the Brewfile with their full `<user>/<tap>/<name>`: the `brew-bundle` step
([scripts/install-brew-bundle.sh](scripts/install-brew-bundle.sh)) trusts each one before running `brew bundle`.

## Git

### Machine-specific signing key

To [sign commits](https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits),
associate a signing key with the local git profile.

The simplest approach is usually to reuse the same key on each machine where signing should happen:

```sh
# List secret keys and note the key id
gpg --list-secret-keys --keyid-format=long

# Export the key you want to move
gpg --export-secret-keys <key-id> > private.key

# Import it on the destination machine
gpg --import private.key
```

If sharing a key across machines is not desirable, the git config also supports machine-specific configuration via
`includeIf`.

## Neovim

The Neovim configuration lives in [.config/nvim](.config/nvim) and is linked into `~/.config/nvim` by the `links`
step.

Additional editor tooling is installed by [scripts/install-nvim-tooling.sh](scripts/install-nvim-tooling.sh), including
language servers and command-line tools such as `gopls`, `lua-language-server`, `rust-analyzer`, `eslint_d`,
`prettierd`, and Markdown linters.

If plugins or plugin-managed keybindings look out of sync, run:

```vim
:Lazy sync
```

### Go

Go support uses `vim-go` together with `gopls`. The required tooling is installed by
[scripts/install-nvim-tooling.sh](scripts/install-nvim-tooling.sh).

### C Sharp

C# support uses OmniSharp via Neovim's built-in LSP configuration. The repository expects the OmniSharp binary at:

```text
~/.cache/omnisharp-vim/omnisharp-roslyn/OmniSharp
```

If it is missing, download a release from the
[OmniSharp releases page](https://github.com/OmniSharp/omnisharp-roslyn/releases) and unpack it there.

## Tmux

[scripts/install-tmux-stuff.sh](scripts/install-tmux-stuff.sh) installs the
[Tmux Plugin Manager](https://github.com/tmux-plugins/tpm). The tmux config enables:

- `tmux-resurrect` for saving and restoring sessions
- `tmux-continuum` for automatic session persistence
- pane text search via `prefix + f` across all sessions and `prefix + F` within the current window

If tmux plugins are not installed yet, reload tmux and run `prefix + I`.

## WSL / Windows

[scripts/install-wsl-stuff.sh](scripts/install-wsl-stuff.sh) handles the WSL-specific setup. In addition to installing
distro packages, it:

- links [wsl/wsl.conf](wsl/wsl.conf) into `/etc/wsl.conf`
- links [wsl/windows-terminal.settings.json](wsl/windows-terminal.settings.json) into the Windows Terminal config
  location
- links [wsl/windows-terminal-preview.settings.json](wsl/windows-terminal-preview.settings.json) into the Windows
  Terminal Preview config location

The script uses `cmd.exe /c mklink`, so the Windows username, WSL distro name, and WSL username must resolve correctly.
If needed, override them with `WINDOWS_USER`, `WSL_OS`, and `WSL_USER`.

Additional Windows-side notes live in [wsl/wsl-specific-instructions.md](wsl/wsl-specific-instructions.md).

## macOS

[scripts/defaults.sh](scripts/defaults.sh) applies macOS system preferences and
[scripts/install-mac-stuff.sh](scripts/install-mac-stuff.sh) installs Rosetta and some macOS-only packages. App
configuration (Ghostty, GnuPG, Karabiner-Elements, k9s, lazygit) is linked by the `links` step using the `mac` entries
in [links.txt](links.txt).

Karabiner-Elements and lazygit can replace their config symlink with a real file when they save settings. If that
happens, re-run `./install.sh links`; the app's version is kept as a `.backup.<timestamp>` file. If Karabiner settings
are not being loaded, try turning on its "system default configuration" setting.

If you use iTerm2, preferences are stored in [plists/com.googlecode.iterm2.plist](plists/com.googlecode.iterm2.plist).
In iTerm2, set `Preferences -> General -> Preferences` to load preferences from the repository's `plists` directory.

For Powerlevel10k glyphs, install a Nerd Font. [JetBrains Mono](https://www.jetbrains.com/lp/mono/) is a good default.

## Architecture Decision Records

Architecture decisions for the repository are recorded in [doc/adr](doc/adr).
