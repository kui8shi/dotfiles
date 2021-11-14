#!/bin/sh

# load shell functions
dotfiles_root=$(cd $(dirname $0)/.. && pwd)
. ${dotfiles_root}/scripts/common.sh

# make symbolic links
cd ${dotfiles_root}/dotfiles
for linklist in "linklist.Unix.txt" "linklist.$(uname).txt"; do
    [ ! -r "${linklist}" ] && continue

    __remove_linklist_comment "$linklist" | while read target link; do

        target=$(eval echo "${PWD}/${target}")
        link=$(eval echo "${link}")

        __mkdir $(dirname ${link})
        __ln ${target} ${link}
    done
done
