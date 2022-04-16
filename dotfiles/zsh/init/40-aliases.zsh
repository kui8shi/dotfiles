alias ls="ls --color=auto"
alias l="ls"
alias ll="ls -lAF"
alias c="cd"
alias chx="chmod a+x"
alias gdb="gdb -q"
alias t="tmux"

if command -v nvim &> /dev/null ; then
    alias n="nvim"
    editor="nvim"
elif command -v vim &> /dev/null ; then
    alias v="vim"
    editor="vim"
else
    exit
fi

alias vimconfig="${editor} ~/.config/${editor}"
alias shellconfig="${editor} ~/.shell.d/$(basename ${SHELL}); source ~/.zshrc"
alias tmuxconfig="${editor} ~/.tmux.conf; tmux source-file ~/.tmux.conf"
