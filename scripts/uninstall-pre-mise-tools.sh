#!/usr/bin/env bash
# Remove the copies of runtimes and tools that were installed before mise took
# them over: nvm, pyenv, tfenv, the Homebrew node/go/deno/terraform formulae,
# the curl-installed Deno, and the global npm, cargo, go and uv tool installs
# of everything in .config/mise/config.toml.
#
# Run it once on a machine after `./install.sh mise` has succeeded. It refuses
# to run while any mise tool is still missing, so nothing is removed before
# its replacement is in place.
#
# Usage: ./scripts/uninstall-pre-mise-tools.sh [--dry-run] [--yes]

# shellcheck source=lib.sh
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

MISE_CONFIG="$REPO_DIR/.config/mise/config.toml"
DRY_RUN=false
ASSUME_YES=false

for arg in "$@"; do
  case "$arg" in
  --dry-run) DRY_RUN=true ;;
  --yes) ASSUME_YES=true ;;
  *)
    error "Unknown option: $arg"
    error "Usage: $0 [--dry-run] [--yes]"
    exit 1
    ;;
  esac
done

load_brew_env

if ! command -v mise &>/dev/null; then
  error "mise not found, run ./install.sh brew-bundle mise first"
  exit 1
fi

if [[ "$(readlink "$HOME/.config/mise/config.toml")" != "$MISE_CONFIG" ]]; then
  error "$HOME/.config/mise/config.toml is not linked to this repo, run ./install.sh links mise first"
  exit 1
fi

if ! missing="$(mise ls --global --missing --no-header)"; then
  error "mise ls failed, fix the mise config before removing anything"
  exit 1
fi
if [[ -n "$missing" ]]; then
  error "These mise tools are not installed yet, run ./install.sh mise first:"
  error "$missing"
  exit 1
fi

if ! $DRY_RUN && ! $ASSUME_YES; then
  warn "This removes nvm, pyenv (including every Python it installed), tfenv and"
  warn "the pre-mise installs of the tools in $MISE_CONFIG."
  read -r -p "Continue? [y/N] " answer
  [[ "$answer" =~ ^[Yy]$ ]] || exit 1
fi

failed=0

# Print a command, then run it unless this is a dry run
run() {
  info "+ $*"
  $DRY_RUN && return 0
  if ! "$@"; then
    warn "Failed: $*"
    failed=1
  fi
}

# Tool names in config.toml for a backend, e.g. `config_tools npm`
config_tools() {
  sed -n "s/^\"$1:\([^\"]*\)\".*/\1/p" "$MISE_CONFIG"
}

remove_dir() {
  [[ -e "$1" ]] && run rm -rf "$1"
}

# Global npm packages installed into Homebrew's node rather than nvm's.
# nvm's own globals go with ~/.nvm below
if [[ -n "$HOMEBREW_PREFIX" && -x "$HOMEBREW_PREFIX/bin/npm" ]]; then
  while IFS= read -r pkg; do
    if [[ -d "$HOMEBREW_PREFIX/lib/node_modules/$pkg" ]]; then
      run "$HOMEBREW_PREFIX/bin/npm" uninstall -g "$pkg"
    fi
  done < <(config_tools npm)
fi

remove_dir "${NVM_DIR:-$HOME/.nvm}"

# uv tools. mise keeps its own pypi tools outside uv's tool directory, so
# `uv tool list` only shows the old installs
if command -v uv &>/dev/null; then
  uv_tools="$(uv tool list 2>/dev/null)"
  while IFS= read -r pkg; do
    if grep -q "^$pkg " <<<"$uv_tools"; then
      run uv tool uninstall "$pkg"
    fi
  done < <(config_tools pypi)
fi

# Crates from `cargo install`. wasm-pack came from its own installer, which
# copies the binary into ~/.cargo/bin without registering it with cargo
if [[ -x "$HOME/.cargo/bin/cargo" ]]; then
  cargo_tools="$("$HOME/.cargo/bin/cargo" install --list)"
  while IFS= read -r crate; do
    if grep -q "^$crate v" <<<"$cargo_tools"; then
      run "$HOME/.cargo/bin/cargo" uninstall "$crate"
    elif [[ "$crate" == wasm-pack && -e "$HOME/.cargo/bin/wasm-pack" ]]; then
      run rm -f "$HOME/.cargo/bin/wasm-pack"
    fi
  done < <(config_tools cargo)
fi

# Binaries from `go install`, named after the last element of the module path.
# air is installed from the mise registry rather than a go: entry
go_bin="${GOPATH:-$HOME/go}/bin"
while IFS= read -r bin; do
  [[ -e "$go_bin/$bin" ]] && run rm -f "$go_bin/$bin"
done < <(
  config_tools go | sed 's|.*/||'
  echo air
)

remove_dir "${PYENV_ROOT:-$HOME/.pyenv}"
# Deno's curl installer, used on WSL
remove_dir "$HOME/.deno"

# Homebrew formulae now provided by mise. One that another installed formula
# depends on is kept; mise's copy comes first on PATH in interactive shells.
# Dependents in this list are ignored, as they are removed first
if command -v brew &>/dev/null; then
  formulae=(node go deno hashicorp/tap/terraform tfenv pyenv-virtualenv pyenv)
  for formula in "${formulae[@]}"; do
    brew list --formula "$formula" &>/dev/null || continue
    dependents="$(brew uses --installed "$formula" |
      grep -vxF -f <(printf '%s\n' "${formulae[@]##*/}") | tr '\n' ' ')"
    if [[ -n "$dependents" ]]; then
      warn "Keeping $formula, needed by: $dependents"
    else
      run brew uninstall --formula "$formula"
    fi
  done
fi

# Lines outside this repo that still load the old tools
for file in ~/.zshrc.local ~/.bashrc.local ~/.profile ~/.zshenv; do
  if [[ -f "$file" ]] && grep -nE 'nvm|pyenv|tfenv|\.deno' "$file"; then
    warn "$file still references a removed tool, see the lines above"
  fi
done

if [[ $failed -ne 0 ]]; then
  error "Some removals failed, see the warnings above"
  exit 1
fi
info "Done. Open a new shell so PATH picks up the mise-managed tools."
