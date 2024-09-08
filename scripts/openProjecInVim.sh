#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/ ~/personal ~/.config -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $selected ]]; then
    return 0
fi

selected_name=$(basename "$selected" | tr . _)

cd $selected
clear
tmux rename-window $selected_name
