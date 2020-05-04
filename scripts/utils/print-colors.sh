#!/usr/bin/env bash

for i in {0..255}; do
  # shellcheck disable=2059
  printf "\\x1b[38;5;${i}m ${i} "
done
