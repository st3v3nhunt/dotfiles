#!/usr/bin/env bash
# shellcheck disable=2059
GREEN='\033[0;32m'
NC='\033[0m'

REPO_DIR="$(cd "$(dirname "$(dirname "${BASH_SOURCE[0]}")")" && pwd)"

printf "${GREEN}Installing Codex configuration...${NC}\\n"
mkdir -p ~/.codex
ln -nfsv "$REPO_DIR/.config/codex/AGENTS.md" ~/.codex/AGENTS.md
printf "${GREEN}Finished installing Codex configuration...${NC}\\n"
