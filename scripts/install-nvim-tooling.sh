#!/usr/bin/env bash
# Neovim tooling not covered elsewhere. Language servers and linters from npm,
# cargo, go and PyPI are installed by mise (.config/mise/config.toml), and the
# rest by the Brewfile.

# luarocks is installed from the Brewfile
luarocks install luacheck
