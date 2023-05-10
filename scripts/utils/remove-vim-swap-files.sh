#!/usr/bin/env bash

echo "Removing all Vim swap files..."
rm -v ~/.vim/tmp/swap/*
rm -v ~/.local/state/nvim/swap/*
