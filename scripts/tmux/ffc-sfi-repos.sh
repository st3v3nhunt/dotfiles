#!/usr/bin/env bash

code_dir=~/code
script_name=$(basename "$0")

ShowHelp()
{
  echo "Open a new tmux window and split it into as many panes as there are FFC-SFI
repos, starting in the repo's root dir. Choose the option to select the
predetermined command to run in each pane or supply your own with the '-c'
option.

USAGE:
  $script_name [OPTIONS] [ARGS]

OPTIONS:
  -h  Display this help text.

  -c  Run [ARG] in repo root dir.
  -l  Follow Docker Compose logs.
  -n  Do not run any command, just open the repo root dir.
  -s  Run './scripts/start -d' in all repos.
"
}

SetupPanes()
{
  tmux new-window -n ffc-sfi-apps
  tmux send-keys "cd $code_dir/ffc-sfi-apply-web" enter
  tmux split-window ; tmux send-keys "cd $code_dir/ffc-sfi-agreement-api" enter
  tmux split-window ; tmux send-keys "cd $code_dir/ffc-sfi-agreement-calculator" enter
  tmux split-window ; tmux send-keys "cd $code_dir/ffc-sfi-processing-web" enter
  tmux split-window ; tmux send-keys "cd $code_dir/ffc-sfi-payment-batch-processor" enter
  tmux split-window ; tmux send-keys "cd $code_dir/ffc-sfi-payment-enrichment" enter
  tmux select-layout tiled
  tmux split-window ; tmux send-keys "cd $code_dir/ffc-sfi-payments" enter
  tmux split-window ; tmux send-keys "cd $code_dir/ffc-sfi-payment-submission" enter
  tmux split-window ; tmux send-keys "cd $code_dir/ffc-sfi-payment-responses" enter
  tmux select-layout tiled
  tmux split-window ; tmux send-keys "cd $code_dir/ffc-sfi-payment-web" enter
  # tmux split-window ; tmux send-keys "cd $code_dir/ffc-sfi-agreement-viewer" enter
  tmux select-layout even-vertical
  tmux setw synchronize-panes; tmux send-keys 'clear' enter
}

FollowLogs()
{
  # Follow logs and show timestamps.
  tmux send-keys 'dclf ffc-sfi' C-i ' -t' enter
  tmux setw synchronize-panes
}

RunCommand()
{
  # Run whatever was supplied in the ARG to the script.
  tmux send-keys "$1" enter
  tmux setw synchronize-panes
}

RunStartScript()
{
  # Start all apps and detach, assumes ./scripts/start exists!
  tmux send-keys './scripts/start -d' enter
  tmux setw synchronize-panes
}

while getopts "c:hlos" option; do
  case $option in
    c) SetupPanes
      RunCommand "$OPTARG"
      exit;;
    h) ShowHelp
      exit;;
    l) SetupPanes
      FollowLogs
      exit;;
    o) SetupPanes
      exit;;
    s) SetupPanes
      RunStartScript
      exit;;
    \?) echo "Error: Invalid option"
      echo
      ShowHelp
      exit 1;;
  esac
done

ShowHelp
