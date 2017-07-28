#!/usr/bin/env bash

tmux new-session -s 'c2s-repos' -d
tmux send-keys 'cd ~/code/bunyan-logger' enter
tmux split-window ; tmux send-keys 'cd ~/code/connecting-to-services' enter
tmux split-window ; tmux send-keys 'cd ~/code/elasticsearch-updater' enter
tmux split-window ; tmux send-keys 'cd ~/code/eslint-config-nhsuk' enter
tmux select-layout tiled
tmux split-window ; tmux send-keys 'cd ~/code/frontend-library' enter
tmux split-window ; tmux send-keys 'cd ~/code/gp-data-etl' enter
tmux split-window ; tmux send-keys 'cd ~/code/gp-finder' enter
tmux select-layout tiled
tmux split-window ; tmux send-keys 'cd ~/code/gp-redirect' enter
tmux split-window ; tmux send-keys 'cd ~/code/moment-opening-times' enter
tmux split-window ; tmux send-keys 'cd ~/code/mongodb-updater' enter
tmux select-layout tiled
tmux split-window ; tmux send-keys 'cd ~/code/nearby-services-api' enter
tmux split-window ; tmux send-keys 'cd ~/code/pharmacy-data-etl' enter
tmux select-layout tiled
tmux split-window ; tmux send-keys 'cd ~/code/pharmacy-db' enter
tmux split-window ; tmux send-keys 'cd ~/code/pomi-data-etl' enter
tmux select-layout tiled
tmux split-window ; tmux send-keys 'cd ~/code/profiles' enter
tmux split-window ; tmux send-keys 'cd ~/code/profiles-db' enter
tmux select-layout tiled
tmux split-window ; tmux send-keys 'cd ~/code/profiles-etl-combiner' enter
tmux select-layout tiled

tmux attach
