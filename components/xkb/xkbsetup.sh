#!/bin/sh
test -f $HOME/.xkb/keymap/mykbd && \
  xkbcomp -I$HOME/.xkb $HOME/.xkb/keymap/mykbd $DISPLAY 2> /dev/null

# When this doesn't work in your terminal sessions but X11 applications,
# xkb may be overwritten by other input engines. In my case, it was wayland.
# I disabled wayland editing /etc/gdm3/custom.conf to uncomment the line of WaylandEnable=false.
