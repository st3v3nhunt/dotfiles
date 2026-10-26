#!/usr/bin/env bash
# Create the symlinks listed in links.txt.
#
# Usage: install-links.sh [--prune] [--dry-run]
#   --prune    remove links into this repo that are dangling or no longer listed
#   --dry-run  only print what would be linked or removed

# shellcheck source=lib.sh
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

MANIFEST="$REPO_DIR/links.txt"
PRUNE=false
DRY_RUN=false

for arg in "$@"; do
  case "$arg" in
  --prune) PRUNE=true ;;
  --dry-run) DRY_RUN=true ;;
  *)
    error "Unknown argument: $arg"
    exit 1
    ;;
  esac
done

os_matches() {
  case "$1" in
  all) return 0 ;;
  mac) is_macos ;;
  wsl) is_wsl ;;
  *)
    warn "Unknown os '$1' in $MANIFEST"
    return 1
    ;;
  esac
}

# Print "<os>|<src>|<dest>" for every entry in the manifest
manifest_entries() {
  local os src dest
  while read -r os src dest; do
    [[ -z "$os" || "$os" == \#* ]] && continue
    printf '%s|%s|%s\n' "$os" "$src" "$dest"
  done <"$MANIFEST"
}

create_links() {
  local failed=0 os src dest
  info "Creating symlinks from links.txt..."
  while IFS='|' read -r os src dest; do
    os_matches "$os" || continue
    if $DRY_RUN; then
      [[ "$(readlink "$HOME/$dest")" == "$REPO_DIR/$src" ]] || echo "Would link: $HOME/$dest -> $REPO_DIR/$src"
      continue
    fi
    link "$src" "$dest" || failed=1
  done < <(manifest_entries)
  info "Finished creating symlinks"
  return $failed
}

prune_links() {
  local managed dirs dir path target os src dest
  managed=""
  dirs="$HOME"
  while IFS='|' read -r os src dest; do
    dirs="$dirs"$'\n'"$(dirname "$HOME/$dest")"
    os_matches "$os" && managed="$managed"$'\n'"$HOME/$dest"
  done < <(manifest_entries)

  info "Pruning stale symlinks into $REPO_DIR..."
  while read -r dir; do
    [[ -d "$dir" ]] || continue
    for path in "$dir"/.[!.]* "$dir"/*; do
      [[ -L "$path" ]] || continue
      target="$(readlink "$path")"
      [[ "$target" == "$REPO_DIR"/* ]] || continue
      if [[ -e "$path" ]] && grep -Fxq "$path" <<<"$managed"; then
        continue
      fi
      if $DRY_RUN; then
        echo "Would remove: $path -> $target"
      else
        rm -v "$path"
      fi
    done
  done < <(sort -u <<<"$dirs")
  info "Finished pruning symlinks"
}

create_links
status=$?

if $PRUNE; then
  prune_links
fi

exit $status
