#!/usr/bin/env bash
if [ "$(
  /usr/bin/pgrep oahd >/dev/null 2>&1
  echo $?
)" -ne 0 ]; then
  echo "Installing Rosetta..."
  softwareupdate --install-rosetta --agree-to-license
fi
