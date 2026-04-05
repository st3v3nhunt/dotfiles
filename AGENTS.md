# AGENTS.md

Repo-specific guidance for agents working in this repository.

Keep this file short and operational. If information is obvious from the tree, readable from the target files, or already documented for humans in `README.md`, it usually does not belong here.

## What To Keep In Mind

- This repo is install-script driven. When adding or moving managed config, make sure the relevant script under `scripts/` installs or symlinks it.
- Most shell and git dotfiles are linked by `scripts/install-dotfiles.sh`. macOS-only app and `.config` setup is mostly handled in `scripts/install-mac-stuff.sh`. Codex's global agent config is linked by `scripts/install-codex-stuff.sh`.
- Prefer editing an existing config file over creating a new one. New top-level config should follow the existing repo-managed symlink pattern rather than assuming the file will be discovered automatically.
- Neovim config is split by responsibility: plugin specs in `.config/nvim/lua/plugins/`, shared user config in `.config/nvim/lua/user/`, and filetype-specific settings in `.config/nvim/ftplugin/`.
- Keep Neovim plugin configuration minimal. Prefer lazy-loading and override defaults only when the repo needs a non-default behavior.
- Shell scripts should follow the local conventions already used in the surrounding file: `#!/usr/bin/env bash`, 2-space indentation, and `REPO_DIR` for repo-relative paths when needed.
- When changing install behavior, setup steps, or user-facing keybindings, update `README.md` if the change would matter to someone using these dotfiles.
- Prefer validating shell changes with `shellcheck` when it is available.

## What Not To Put Here

- Directory listings, plugin inventories, keybinding catalogs, or platform summaries that an agent can learn by reading the repo.
- High-level project overview material that belongs in `README.md`.
- Stale implementation details that are likely to drift away from the code.
