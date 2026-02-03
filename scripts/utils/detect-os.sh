#!/usr/bin/env bash
# OS detection utilities - source this file to use

is_macos() { [[ "$OSTYPE" == darwin* ]]; }
is_wsl() { [[ -n "$WSL_DISTRO_NAME" || -n "$WSLENV" ]]; }
is_linux() { [[ "$OSTYPE" == linux-gnu* ]] && ! is_wsl; }
