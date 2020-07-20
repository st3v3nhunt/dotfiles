#!/usr/bin/env bash

tmux send-keys 'cd ~/code/ffc-demo-web' enter
tmux split-window ; tmux send-keys 'cd ~/code/ffc-demo-calculation-service' enter
tmux split-window ; tmux send-keys 'cd ~/code/ffc-demo-claim-service' enter
tmux split-window ; tmux send-keys 'cd ~/code/ffc-demo-payment-service' enter
tmux split-window ; tmux send-keys 'cd ~/code/ffc-demo-payment-web' enter
tmux select-layout tiled
tmux rename-window 'ffc-node-apps'
tmux setw synchronize-panes; tmux send-keys 'clear' enter
tmux setw synchronize-panes
# tmux send-keys C-a C-a
