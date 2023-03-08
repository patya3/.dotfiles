#!/bin/sh
workspace=$1
shift
pgrep -f "^$*" && i3-msg "workspace ${workspace}" || (i3-msg "exec $*; workspace ${workspace}")
