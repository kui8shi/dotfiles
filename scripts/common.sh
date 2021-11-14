#!/bin/sh


__ln() {(
    [ -L "$2" ] && unlink "$2"

    ln -s "$1" "$2" && echo "ln: $1 -> $2" >&2
)}


__unlink() {(
    unlink "$1" && echo "unlink: \"$1\""
)}


__mkdir() {(
    [ ! -e "$1" ] && mkdir -p "$1" && echo "mkdir: \"$1\"" >&2
)}


__remove_linklist_comment() {(
    sed -e 's/\s*#.*//' \
        -e '/^\s*$/d' \
        $1
)}
