#!/usr/bin/env bash
bash -c "shopt -s nullglob globstar extglob; GLOBIGNORE=node_modules*:.git*:git*; shellcheck **/*.{sh,bash}"
