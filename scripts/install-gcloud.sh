#!/usr/bin/env bash

printf "Installing gcloud sdk\\n"
curl https://sdk.cloud.google.com > gcloud-installer.sh
bash gcloud-installer.sh --disable-prompts
rm gcloud-installer.sh
