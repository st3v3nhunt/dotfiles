#!/usr/bin/env bash
# Install the Brewfile. Homebrew refuses to load formulae from third-party
# taps until they are trusted, so trust each fully qualified
# <user>/<tap>/<name> formula listed in the Brewfile first.

# shellcheck source=lib.sh
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

BREWFILE="$REPO_DIR/Brewfile"

tap_formulae=()
while IFS= read -r formula; do
  tap_formulae+=("$formula")
done < <(sed -n 's/^brew "\([^"/]*\/[^"/]*\/[^"]*\)".*/\1/p' "$BREWFILE")

if [[ ${#tap_formulae[@]} -gt 0 ]]; then
  info "Trusting third-party tap formulae..."
  brew trust --formula "${tap_formulae[@]}" || exit 1
fi

brew bundle --file="$BREWFILE"
