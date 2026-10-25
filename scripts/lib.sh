#!/usr/bin/env bash
# Shared helpers for the install scripts - source this file to use
# shellcheck disable=2059

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export REPO_DIR

GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m'

# shellcheck source=utils/detect-os.sh
source "$REPO_DIR/scripts/utils/detect-os.sh"

info() { printf "${GREEN}%s${NC}\\n" "$*"; }
warn() { printf "${YELLOW}%s${NC}\\n" "$*" >&2; }
error() { printf "${RED}%s${NC}\\n" "$*" >&2; }

# Put Homebrew on PATH for the current process, wherever it is installed
load_brew_env() {
  local brew_path
  for brew_path in /opt/homebrew/bin/brew /usr/local/bin/brew /home/linuxbrew/.linuxbrew/bin/brew; do
    if [[ -x "$brew_path" ]]; then
      eval "$("$brew_path" shellenv)"
      return 0
    fi
  done
  return 1
}

# Symlink a repo file to a path relative to $HOME.
# Existing links are replaced; a real file or directory in the way is moved
# aside to <dest>.backup.<timestamp> rather than deleted.
link() {
  local src="$REPO_DIR/$1"
  local dest="$HOME/$2"

  if [[ ! -e "$src" ]]; then
    warn "Skipping missing source: $1"
    return 1
  fi

  mkdir -p "$(dirname "$dest")"

  if [[ -L "$dest" ]]; then
    if [[ "$(readlink "$dest")" == "$src" ]]; then
      return 0
    fi
  elif [[ -e "$dest" ]]; then
    local backup
    backup="$dest.backup.$(date +%Y%m%d%H%M%S)"
    warn "Moving existing $dest to $backup"
    mv "$dest" "$backup"
  fi

  ln -nfsv "$src" "$dest"
}
