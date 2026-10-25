# AGENTS.md

Repository-specific guidance for agents working in this repository.

Keep this file short and operational. If information is obvious from the tree, readable from the target files, or already documented for humans in `README.md`, it usually does not belong here.

## What To Keep In Mind

- This repository is install-script driven. Every repo-managed symlink is
  listed in `links.txt` and created by `scripts/install-links.sh`; when adding
  or moving managed config, update `links.txt` rather than adding `ln` calls.
- `install.sh` runs named steps from its `STEPS` list; a new install script needs an entry there. Scripts that need `REPO_DIR`, OS checks, or output helpers should source `scripts/lib.sh`.
- Prefer editing an existing config file over creating a new one. New config is not discovered automatically; it needs a `links.txt` entry.
- Neovim config is split by responsibility: plugin specs in `.config/nvim/lua/plugins/`, shared user config in `.config/nvim/lua/user/`, and filetype-specific settings in `.config/nvim/ftplugin/`.
- Keep Neovim plugin configuration minimal. Prefer lazy-loading and override
  defaults only when the repository needs a non-default behavior.
- Shell scripts should follow the local conventions already used in the surrounding file: `#!/usr/bin/env bash`, 2-space indentation, and `REPO_DIR` for repo-relative paths when needed.
- When changing install behavior, setup steps, or user-facing keybindings, update `README.md` if the change would matter to someone using these dotfiles.
- Prefer validating shell changes with `shellcheck -x` when it is available.
- Test link changes against a throwaway home, e.g. `HOME=$(mktemp -d) ./install.sh links`.

## What Not To Put Here

- Directory listings, plugin inventories, keybinding catalogs, or platform
  summaries that an agent can learn by reading the repository.
- High-level project overview material that belongs in `README.md`.
- Stale implementation details that are likely to drift away from the code.
