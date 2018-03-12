#!/usr/bin/env bash

# Only need to start a new session when not already in a session
# tmux new-session -s 'c2s-repos' -d
tmux split-window ; tmux send-keys 'cd ~/code/connecting-to-services' enter
tmux split-window ; tmux send-keys 'cd ~/code/nearby-services-api' enter
tmux split-window ; tmux send-keys 'cd ~/code/profiles' enter
tmux select-layout tiled
tmux split-window ; tmux send-keys 'cd ~/code/gp-redirect' enter
tmux split-window ; tmux send-keys 'cd ~/code/gp-finder' enter
tmux split-window ; tmux send-keys 'cd ~/code/elasticsearch-updater' enter
tmux select-layout tiled
tmux split-window ; tmux send-keys 'cd ~/code/gp-data-etl' enter
tmux split-window ; tmux send-keys 'cd ~/code/pharmacy-data-etl' enter
tmux select-layout tiled
tmux split-window ; tmux send-keys 'cd ~/code/pomi-data-etl' enter
tmux split-window ; tmux send-keys 'cd ~/code/profiles-etl-combiner' enter
tmux select-layout tiled

tmux attach