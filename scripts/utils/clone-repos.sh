#!/usr/bin/env bash

REPO_PATTERNS=(
ffc-sfi
)

CODE_DIR=~/code
LIMIT=500 # Limit should be enough to cover all repos in org
GH_ORG=defra

for PATTERN in "${REPO_PATTERNS[@]}"; do
  REPOS=$(gh repo list $GH_ORG --limit $LIMIT --json nameWithOwner --jq ".[] | select(.nameWithOwner | contains(\"$PATTERN\")) | .nameWithOwner")

  cd $CODE_DIR || exit
  for REPO in $REPOS; do
    echo "Checking repo: $REPO"
    REPO_DIR=$(echo "$REPO" | cut -d/ -f2)
    if [ ! -d "$REPO_DIR" ]; then
      echo "$REPO will be cloned"
      cd "$CODE_DIR" && gh repo clone "$REPO" && cd - > /dev/null || return
    else
      echo "$REPO already exists"
      cd "$REPO_DIR" && gh repo sync && cd - > /dev/null || return
    fi
  done
done
