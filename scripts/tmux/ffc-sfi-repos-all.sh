#!/usr/bin/env bash

tmux send-keys 'cd ~/code/ffc-sfi-apply-web' enter
tmux split-window ; tmux send-keys 'cd ~/code/ffc-sfi-agreement-api' enter
tmux split-window ; tmux send-keys 'cd ~/code/ffc-sfi-agreement-calculator' enter
tmux split-window ; tmux send-keys 'cd ~/code/ffc-sfi-processing-web' enter
tmux split-window ; tmux send-keys 'cd ~/code/ffc-sfi-payment-batch-processor' enter
tmux split-window ; tmux send-keys 'cd ~/code/ffc-sfi-payment-enrichment' enter
tmux select-layout tiled
tmux split-window ; tmux send-keys 'cd ~/code/ffc-sfi-payments' enter
tmux split-window ; tmux send-keys 'cd ~/code/ffc-sfi-payment-submission' enter
tmux split-window ; tmux send-keys 'cd ~/code/ffc-sfi-payment-responses' enter
tmux select-layout tiled
tmux split-window ; tmux send-keys 'cd ~/code/ffc-sfi-payment-web' enter
tmux split-window ; tmux send-keys 'cd ~/code/ffc-sfi-agreement-viewer' enter
tmux select-layout even-vertical
tmux rename-window 'sfi-app-logs'
tmux setw synchronize-panes; tmux send-keys 'clear' enter
# Start following Docker Compose logs for service in dir
tmux send-keys 'dclf ffc-sfi' C-i enter
tmux setw synchronize-panes
