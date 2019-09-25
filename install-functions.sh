#!/usr/bin/env bash

# Git rebase function
grh() { git rebase -i head~"$1"; }
