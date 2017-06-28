#!/usr/bin/env bash

bash -c 'shopt -s nullglob globstar; shellcheck **/*.{sh,bash}'
