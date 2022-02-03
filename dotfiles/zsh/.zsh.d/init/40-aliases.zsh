alias ls="ls --color=auto"
alias l="ls"
alias ll="ls -lAF"
alias c="cd"
alias chx="chmod a+x"
alias gdb="gdb -q"
alias t="tmux"

if $nvim ; then
    alias n="nvim"
fi

alias nvimconfig="nvim ~/.config/nvim"
alias zshconfig="nvim ~/.zsh.d/init; source ~/.zshrc"
alias tmuxconfig="nvim ~/.tmux.conf; tmux source-file ~/.tmux.conf"
