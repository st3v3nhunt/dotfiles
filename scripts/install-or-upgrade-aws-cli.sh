#!/usr/bin/env bash

if [[ "$OSTYPE" == "darwin"* ]]; then
  curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
  echo "The next step will require your password to be entered..."

  if sudo installer -pkg ./AWSCLIV2.pkg -target /
  then
    echo "Install was successful, removing downloaded package"
    rm "AWSCLIV2.pkg"
  else
    echo "Install was NOT successful. Please check output. Downloaded package has not been removed"
  fi
fi

if [[ -n "$WSL_DISTRO_NAME" && "$OSTYPE" == "linux-gnu" ]]; then
  CLI_ZIP="awscliv2.zip"
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o $CLI_ZIP
  unzip $CLI_ZIP
  sudo ./aws/install
  rm -rf aws/
  rm $CLI_ZIP
fi
