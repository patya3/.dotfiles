#!/bin/bash
if [ $(i3-msg -t get_workspaces | jq '.[] | select(.name=="$1")' | wc -l) -eq 0 ]
then
  a=exec i3-msg workspace "$1"
  exec brave-browser --profile-directory="$2" &
else
  exec i3-msg workspace "$1"
fi
exit 0
