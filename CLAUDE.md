# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a dotfiles repository for macOS and Linux WSL environments. It manages configuration files, shell setup, editor configurations (Vim/Neovim), and automated installation scripts for development tools and applications.

## Installation

The main installation entry point is `./install.sh`, which orchestrates platform-specific setup:
- WSL: Runs `scripts/install-wsl-stuff.sh` first
- macOS: Runs `scripts/defaults.sh`, `install-mac-stuff.sh`, and `install-casks.sh`
- Both: Executes language-specific installers (Go, Node, Python, Rust, etc.)

### Dotfile Symlinking

`scripts/install-dotfiles.sh` creates symlinks from `dotfiles/` and `git/` directories to the home directory. All dotfiles are versioned in this repo and symlinked into place rather than copied.

## Key Directories

- **`dotfiles/`**: Shell configurations (`.zshrc`, `.bashrc`, `.aliases`, `.functions`, `.vimrc`, `.tmux.conf`)
- **`git/`**: Git configuration (`.gitconfig`, git prompt, completion scripts)
- **`.config/nvim/`**: Neovim Lua configuration (LSP, plugins, keymaps)
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
  - `lsp.lua`: LSP configuration for multiple languages
  - `completion.lua`: nvim-cmp and sources
  - `telescope.lua`, `treesitter.lua`, `hop.lua`, etc.
  - `theme.lua`, `editor.lua`, `ui.lua`, `git.lua`, `languages.lua`, `tools.lua`
- **`lua/user/`**: User settings, keymaps, autocmds, abbreviations
- **`ftplugin/*.lua`**: Filetype-specific settings (auto-loaded by Neovim)
- **`vscode/settings.lua`**: VS Code Neovim integration (loaded when `vim.g.vscode` is true)

### Modern Plugin Stack
- **Plugin manager**: lazy.nvim (Lua-native, lazy-loading)
- **File tree**: nvim-tree (replaces NERDTree)
- **Statusline**: lualine (replaces vim-airline)
- **Git signs**: gitsigns.nvim (replaces vim-gitgutter)
- **LSP**: nvim-lspconfig (native LSP support)
- **Formatting**: conform.nvim (replaces null-ls formatting)
- **Linting**: nvim-lint (replaces null-ls diagnostics)
- **Tool installer**: mason.nvim + mason-tool-installer (auto-installs formatters/linters/LSP)
- **Completion**: nvim-cmp with multiple sources
- **Fuzzy finder**: telescope.nvim
- **Treesitter**: nvim-treesitter for syntax highlighting
- **Diagnostics**: trouble.nvim for pretty lists
- **Vimscript plugins**: Copilot, vim-go, fugitive, vim-surround, vim-commentary (work with Lua config)

### LSP Servers Configured
- JavaScript/TypeScript: `ts_ls` with nvim-lsp-ts-utils
- Go: `gopls`
- Rust: `rust_analyzer`
- Ruby: `rubocop`, `ruby_lsp`
- Elixir: `elixirls`
- C#: `omnisharp` (path: `~/.cache/omnisharp-vim/omnisharp-roslyn/OmniSharp`)
- Deno: `denols` (single file support disabled)
- Others: `bashls`, `dockerls`, `eslint`, `lua_ls`, `jsonls`, `svelte`, `vuels`, `yamlls`, `tailwindcss`

### Formatters Configured (conform.nvim)
- **Lua**: stylua
- **Python**: black
- **JavaScript/TypeScript/JSON/YAML/HTML/CSS**: prettierd (with prettier fallback)
- **Markdown**: markdownlint-cli2, prettier (120 char line width), injected (formats code blocks)
- **Elixir**: mix
- **Rust**: rustfmt
- **Go**: goimports, gofmt
- **Shell**: shfmt (2-space indent)
- Format on save enabled (3s timeout for markdown, 1s for others)

### Linters Configured (nvim-lint)
- **Lua**: selene
- **Markdown**: markdownlint
- **Fish**: fish

### Key Neovim Keybindings
- Leader key: `,`
- LSP: `gd` (definition), `gD` (declaration), `gi` (implementation), `<space>gr` (references), `<space>rn` (rename), `<leader>.` (code action), `<space>f` (format)
- Formatting: `<leader>f` (format buffer with conform.nvim)
- Diagnostics: `]d` (next), `[d` (previous), `]D` (last), `[D` (first), `<C-w>d` (show in float)
- File tree: `<C-n>` (toggle NvimTree), `<leader>re` (reveal current file)
- Fuzzy find: `<C-p>` (files), `\` (live grep), `K` (grep word), `<leader>fb` (buffers)
- Hop: `s` (hop words), `S` (hop words in line)
- Trouble: `<leader>t` (toggle diagnostics)

## Git Configuration

`.gitconfig` includes:
- Extensive aliases (see `[alias]` section)
- GPG commit signing enabled
- git-secrets integration for AWS credential detection
- Machine-specific configs via `includeIf`: `.pc.gitconfig`, `.mac.gitconfig`
- LFS filter configuration
- Default branch: `main`

## Language & Tool Management

- **Node.js**: Managed via nvm with lazy loading (zsh-nvm plugin)
- **Ruby**: Homebrew Ruby in PATH, RVM support
- **Python**: pyenv setup (commented out in `.zshrc`, install via `install-python-stuff.sh`)
- **Rust**: cargo in PATH, installed via `install-rust-stuff.sh`
- **Go**: Installed via `install-go-stuff.sh`
- **Deno**: Deno install in PATH (non-macOS)
- **.NET**: DOTNET_ROOT configured, tools installed via `install-dotnet-tools.sh`
- **Version managers**: asdf sourced from Homebrew

## Platform Differences

### macOS
- Homebrew prefix: `/opt/homebrew` (Apple Silicon) or `/usr/local` (Intel)
- iTerm2 preferences loaded from `plists/com.googlecode.iterm2.plist`
- Cask installation to `~/Applications`
- Uses JetBrains Mono Nerd Font for terminal

### WSL
- Windows Terminal settings in `wsl/windows-terminal.settings.json`
- Alacritty config in `wsl/alacritty.toml`
- Deno installed to `~/.deno`

## Tmux

- Configuration: `dotfiles/.tmux.conf`
- Platform-specific configs: `.tmux.macos.conf`, `.tmux.wsl.conf`
- Plugins via TPM: tmux-resurrect, tmux-continuum
- Install plugins: `prefix + I`
- Session save/restore: `prefix + Ctrl-s` / `prefix + Ctrl-r`

## Common Development Commands

### Testing Configuration Changes
```bash
# Reload zsh configuration
source ~/.zshrc  # or use alias: szp

# Reload bash configuration
source ~/.bashrc  # or use alias: sbp

# Reload Vim configuration (within Vim)
:so $MYVIMRC  # or use keybind: <leader>sv
```

### Git Workflow Aliases
- `g` → `git`
- `gs` → `git status`
- `gd` → `git diff`
- `gaac 'message'` → `git add -A && git commit -m 'message'`
- `gpuo` → push current branch with upstream
- `gpuopr` → push, create PR, open in browser
- `gmpc` → checkout main, pull, delete local branches, prune

### Neovim Plugin Management (lazy.nvim)
```vim
:Lazy            " Open lazy.nvim UI
:Lazy install    " Install missing plugins
:Lazy update     " Update plugins
:Lazy clean      " Remove unused plugins
:Lazy sync       " Install, update, and clean
```

### Language-Specific Setup
- **Deno in Vim**: Run `:CocCommand deno.initializeWorkspace` (for coc.nvim projects)
- **Go in Vim**: Run `:GoInstallBinaries` after vim-go installation
- **C# OmniSharp**: Download from GitHub releases, extract to `~/.cache/omnisharp-vim/omnisharp-roslyn/`

## Semantic Release

This repository uses semantic-release with:
- Conventional commits via commitlint (`.commitlintrc.json`)
- Automated changelog generation
- Version bumping in `package.json` and `CHANGELOG.md`
- Release workflow via GitHub Actions

## Architecture Decision Records

ADRs are stored in `doc/adr/` (though the README mentions `doc/architecture/decisions`). Use ADRs to document significant architectural decisions.

## Notes

- Vim plugins are installed automatically on first run if missing
- Shell startup is optimized with lazy loading for nvm and other tools
- GPG signing is enabled for commits - ensure GPG key is configured per machine (see README)
- The configuration supports both Intel and Apple Silicon Macs via HOMEBREW_PREFIX detection
