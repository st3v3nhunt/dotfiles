#!/usr/bin/env bash
# shellcheck disable=2059
GREEN='\033[0;32m'
NC='\033[0m'

REPO_DIR="$(cd "$(dirname "$(dirname "${BASH_SOURCE[0]}")")" && pwd)"

printf "${GREEN}Installing Claude configuration...${NC}\\n"
mkdir -p ~/.claude
ln -nfsv "$REPO_DIR/.config/claude/CLAUDE.md" ~/.claude/CLAUDE.md
printf "${GREEN}Finished installing Claude configuration...${NC}\\n"
