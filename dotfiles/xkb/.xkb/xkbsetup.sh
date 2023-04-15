#!/bin/sh
test -f $HOME/.xkb/keymap/mykbd && \
  xkbcomp -I$HOME/.xkb $HOME/.xkb/keymap/mykbd $DISPLAY #2> /dev/null
