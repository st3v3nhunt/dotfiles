#!/usr/bin/env bash

pushd ~/code || exit
# COUNT=0
# find . -maxdepth 1 -type d -name 'ffc-*' -print0 | xargs -i -0 -- sh -c "if [[ $COUNT % 6 == 0 ]]; then tmux new-window; fi; COUNT=+1 tmux split-window -c ~/code/{} ; tmux select-layout tiled"
# find . -maxdepth 1 -type d -name 'ffc-*' -print0 | xargs -i -0 -- sh -c "if (( $COUNT % 6 == 0 )); then echo 'mod 6'; fi; $COUNT++; echo $COUNT"
# tmux select-layout tiled
# tmux rename-window 'ffc-apps-all'
# tmux setw synchronize-panes; tmux send-keys 'clear' enter
# tmux setw synchronize-panes
