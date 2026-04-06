#!/usr/bin/env bash
# shellcheck disable=2059
GREEN='\033[0;32m'
NC='\033[0m'

REPO_DIR="$(cd "$(dirname "$(dirname "${BASH_SOURCE[0]}")")" && pwd)"

printf "${GREEN}Installing Claude configuration...${NC}\\n"
mkdir -p ~/.claude
ln -nfsv "$REPO_DIR/.config/claude/CLAUDE.md" ~/.claude/CLAUDE.md
ln -nfsv "$REPO_DIR/.config/claude/keybindings.json" ~/.claude/keybindings.json
ln -nfsv "$REPO_DIR/.config/claude/statusline-command.sh" ~/.claude/statusline-command.sh
ln -nfsv "$REPO_DIR/.config/claude/settings.json" ~/.claude/settings.json
printf "${GREEN}Finished installing Claude configuration...${NC}\\n"
