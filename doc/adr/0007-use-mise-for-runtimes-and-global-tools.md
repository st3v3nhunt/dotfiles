# 7. Use mise for runtimes and global tools

Date: 2026-10-26

## Status

Accepted

## Context

Language runtimes were installed by a different tool each: nvm for Node.js, pyenv and pyenv-virtualenv for Python,
tfenv for Terraform, Homebrew for Go, and Homebrew or a curl installer for Deno depending on the OS. Global tools were
installed by lists of `npm install -g`, `cargo install`, `go install` and `uv tool install` commands spread across
several install scripts. This meant:

1. Several version managers, each with its own shell initialisation
2. No single place listing the installed tools
3. Removing a tool from a script did not uninstall it, and upgrading meant re-running each script

## Decision

Use [mise](https://mise.jdx.dev) to install the runtimes and the global npm, cargo, go and PyPI tools, declared in
`.config/mise/config.toml`. mise itself is installed from the Brewfile. Rust toolchains stay with rustup, and system
packages and apps stay in the Brewfile.

## Consequences

- One declarative file lists the runtimes and tools, and `mise upgrade` upgrades them all on macOS, Linux and WSL
- `mise activate` replaces the nvm, pyenv and Deno shell setup
- Projects can pin versions with `mise.toml`, and `.python-version` and `.terraform-version` files keep working
- Machines set up before this change keep their old copies until `scripts/uninstall-pre-mise-tools.sh` is run
- Neovim's Python provider moves from a pyenv virtualenv to a venv created by the `mise` step
