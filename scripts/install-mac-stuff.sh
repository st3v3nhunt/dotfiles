#!/usr/bin/env bash
if [ "$(
  /usr/bin/pgrep oahd >/dev/null 2>&1
  echo $?
)" -ne 0 ]; then
  echo "Installing Rosetta..."
  softwareupdate --install-rosetta --agree-to-license
fi

brews=(
  deno
  ghostty
  python
  reattach-to-user-namespace
  wifi-password
)

# Upgrade if already installed via Homebrew otherwise install it
for pkg in "${brews[@]}"; do
  if brew list -1 | grep -q "^${pkg}\$"; then
    echo "Upgrading '$pkg'"
    brew upgrade "$pkg"
  else
    echo "Installing '$pkg'"
    brew install "$pkg"
  fi
done

echo "Clean up..."
brew cleanup
