#!/usr/bin/env bash

curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
echo "The next step will require your password to be entered..."

if sudo installer -pkg ./AWSCLIV2.pkg -target /
then
  echo "Install was successful, removing downloaded package"
  rm "AWSCLIV2.pkg"
else
  echo "Install was NOT successful. Please check output. Downloaded package has not been removed"
fi
