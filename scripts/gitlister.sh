#!/bin/bash

shopt -s dotglob

update() {
    for d in "$@"; do
        test -d "$d" -a \! -L "$d" || continue
        cd "$d"
        if [ -d ".git" ]; then
            echo "$PWD"
        else
            update *
        fi
        cd ..
    done
}

update *
