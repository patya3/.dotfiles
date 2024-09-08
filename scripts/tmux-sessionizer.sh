#!/usr/bin/env bash
if [[ $# -eq 1 ]]; then
  selected=$1
else
  # add folders here
  selected=$(find ~/ ~/personal -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $selected ]]; then
  exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

tmux new-window -n $selected_name -c $selected
