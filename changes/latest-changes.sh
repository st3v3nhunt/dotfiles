#!/usr/bin/env bash

# Run this file to get the latest changes. It might not contain the 'latest'
# changes as that very much depends on the last time the machine this is run on
# was updated. However, given I tend to keep machines reasonably up to date with
# one another this script should suffice.
# Get the last commit via `git rev-parse HEAD | pbcopy`
# Changes applied since 4ecbea9ced22b0c688cc75b0ff4709ab98ea891c
./scripts/install-or-upgrade-aws-cli.sh
./scripts/install-dotnet-tools.sh
brew install aws-iam-authenticator

echo "Check version of dotnet, it should probably be 3.1.102"
dotnet --version

# Apply changes
# shellcheck source=/dev/null
source ~/.zshrc

echo "Install OpenVPN - https://openvpn.net/downloads/openvpn-connect-v3-macos.dmg"
echo "Install Cisco Webex Meetings - https://www.webex.com/downloads.html/downloads/downloads-thank-you-meetings.html"
