#!/usr/bin/env bash

# Run this file to get the latest changes. It might not contain the 'latest'
# changes as that very much depends on the last time the machine this is run on
# was updated. However, given I tend to keep machines reasonably up to date with
# one another this script should suffice.
# Get the last commit via `git rev-parse HEAD | pbcopy`
# Changes applied since 4ecbea9ced22b0c688cc75b0ff4709ab98ea891c
./scripts/install-or-upgrade-aws-cli.sh
brew install aws-iam-authenticator

# Apply changes
# shellcheck source=/dev/null
source ~/.zshrc
