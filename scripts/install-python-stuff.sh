#!/usr/bin/env bash

# Python and the Python CLI tools, including pre-commit, are installed by mise
# (.config/mise/config.toml)

# Install pre-commit hook script
pre-commit init-templatedir ~/.git-template

# Install this repo's hooks (.pre-commit-config.yaml)
pre-commit install
