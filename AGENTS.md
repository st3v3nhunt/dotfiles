# AGENTS.md

This file provides guidance to AI coding assistants when working with code in this repository.

## Overview

This is a dotfiles repository for macOS and Linux WSL environments. It manages configuration files, shell setup, editor configurations (Neovim), and automated installation scripts for development tools and applications.

## Installation

The main entry point is `./install.sh`, which orchestrates platform-specific setup:

- WSL: Runs `scripts/install-wsl-stuff.sh` first
- macOS: Runs `scripts/defaults.sh`, `install-mac-stuff.sh`, and `install-casks.sh`
- Both: Executes language-specific installers (Go, Node, Python, Rust, etc.)

### Dotfile Symlinking

`scripts/install-dotfiles.sh` creates symlinks from `dotfiles/` and `git/` directories to the home directory. All dotfiles are versioned in this repository and symlinked into place rather than copied.

## Key Directories

- **`dotfiles/`**: Shell configurations (`.zshrc`, `.bashrc`, `.aliases`, `.functions`, `.tmux.conf`)
- **`git/`**: Git configuration (`.gitconfig`, git prompt, completion scripts)
- **`.config/nvim/`**: Neovim Lua configuration (LSP, plugins, keymaps)
- **`.config/ghostty/`**: Ghostty terminal configuration
- **`scripts/`**: Installation scripts for various tools and languages
- **`scripts/utils/`**: Utility scripts for common operations
- **`wsl/`**: WSL-specific configurations (Windows Terminal, Alacritty)
- **`plists/`**: macOS iTerm2 preferences
- **`omnisharp/`**: C# OmniSharp configuration

## Shell Configuration Architecture

Shell setup is modular and shared between bash and zsh:

- **`.shared-shell-setup`**: Common environment variables (PATH, EDITOR, HOMEBREW_PREFIX)
- **`.aliases`**: Command aliases (git shortcuts, tool shortcuts)
- **`.functions`**: Custom shell functions
- **`.zshrc`**: Zsh-specific configuration using Oh-My-Zsh with Powerlevel10k theme
- **`.bashrc`**: Bash-specific configuration

Both shells source `.aliases`, `.functions`, and `.shared-shell-setup` for consistency.

## Neovim Configuration (Pure Lua)

The configuration is entirely in Lua using lazy.nvim for plugin management:

### Structure

- **`init.lua`**: Entry point, bootstraps lazy.nvim, loads plugins and user config
- **`lua/plugins/`**: Plugin specifications for lazy.nvim (auto-loaded)
- **`lua/user/`**: User settings, keymaps, autocmds, abbreviations
- **`ftplugin/*.lua`**: Filetype-specific settings (auto-loaded by Neovim)

### Key Plugins

- **Plugin manager**: lazy.nvim
- **File tree**: nvim-tree
- **Statusline**: lualine
- **Git signs**: gitsigns.nvim
- **LSP**: nvim-lspconfig
- **Formatting**: conform.nvim
- **Linting**: nvim-lint
- **Tool installer**: mason.nvim + mason-tool-installer
- **Completion**: nvim-cmp
- **Fuzzy finder**: telescope.nvim
- **Treesitter**: nvim-treesitter
- **Diagnostics**: trouble.nvim

### Key Neovim Keybindings

- Leader key: `,`
- LSP: `gd` (definition), `gi` (implementation), `<space>gr` (references), `<space>rn` (rename), `<leader>.` (code action)
- File tree: `<C-n>` (toggle), `<leader>re` (reveal file), `g?` (help)
- Fuzzy find: `<C-p>` (files), `\` (live grep), `<leader>fb` (buffers)
- Diagnostics: `]d`/`[d` (next/prev), `<leader>t` (trouble toggle)

## Git Configuration

`.gitconfig` includes:

- Extensive aliases (see `[alias]` section)
- GPG commit signing enabled
- git-secrets integration for AWS credential detection
- Machine-specific configs via `includeIf`: `.pc.gitconfig`, `.mac.gitconfig`
- Default branch: `main`

## Platform Differences

### macOS

- Homebrew prefix: `/opt/homebrew` (Apple Silicon) or `/usr/local` (Intel)
- iTerm2 preferences loaded from `plists/com.googlecode.iterm2.plist`
- Ghostty config symlinked from `.config/ghostty/`

### WSL

- Windows Terminal settings in `wsl/windows-terminal.settings.json`
- Alacritty config in `wsl/alacritty.toml`

## Common Commands

```bash
# Reload shell config
source ~/.zshrc  # or alias: szp

# Reload Neovim config (within Neovim)
:so $MYVIMRC  # or <leader>sv

# Neovim plugin management
:Lazy sync
```

## Semantic Release

This repository uses semantic-release with conventional commits via commitlint. Automated changelog generation and versioning via GitHub Actions.

## Architecture Decision Records

ADRs are stored in `doc/adr/`. Use ADRs to document significant architectural decisions.

## Guidelines for AI Assistants

### Code Style

- Follow existing patterns in the codebase
- Shell scripts use 2-space indentation
- Lua files follow the existing formatting conventions
- Keep configurations minimal - only include non-default values

### Making Changes

- Prefer modifying existing files over creating new ones when appropriate
- When adding new tool configs, follow the symlink pattern in `scripts/install-*.sh`
- Test shell script changes with `shellcheck` when possible
- Update README.md when adding new keybindings or notable features

### Neovim Plugin Changes

- Add new plugins to appropriate files in `lua/plugins/`
- Use lazy-loading where possible (`cmd`, `event`, `ft` keys)
- Keep plugin configs minimal - only override defaults when necessary

### Script Conventions

- Use `#!/usr/bin/env bash` shebang
- Include `REPO_DIR` calculation for path references
- Use colored output with GREEN/NC variables for user feedback
- Check for existing installations before installing
