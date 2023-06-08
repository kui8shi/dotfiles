# set emacs keybinding
bindkey -e
test -z $XKB_SET && \
  test -f $HOME/.xkb/xkbsetup.sh && \
    $HOME/.xkb/xkbsetup.sh && \
    export XKB_SET=1
