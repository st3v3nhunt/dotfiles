#!/usr/bin/env bash
# Install the gcloud CLI into ~/google-cloud-sdk, or update it if already
# installed. The installer refuses to run over an existing install.

GCLOUD_DIR="$HOME/google-cloud-sdk"

if [[ -x "$GCLOUD_DIR/bin/gcloud" ]]; then
  printf "gcloud already installed, updating components\\n"
  "$GCLOUD_DIR/bin/gcloud" components update --quiet
  exit
fi

printf "Installing gcloud sdk\\n"
installer="$(mktemp)"
trap 'rm -f "$installer"' EXIT
curl -fsSL https://sdk.cloud.google.com -o "$installer" || exit 1
# With prompts disabled the installer leaves shell rc files alone; .zshrc
# already sources the path and completion files from $GCLOUD_DIR
bash "$installer" --disable-prompts --install-dir="$HOME"
