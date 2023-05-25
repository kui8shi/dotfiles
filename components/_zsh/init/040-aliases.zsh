alias ls="ls -v --color=auto"
alias l="ls"
alias ll="ls -lAF"
alias c="cd"
alias chx="chmod a+x"
alias gdb="gdb -q"
alias t="tmux"
alias date="date -R"

if command -v nvim &> /dev/null ; then
    alias n="nvim"
    local editor="nvim"
elif command -v vim &> /dev/null ; then
    alias v="vim"
    local editor="vim"
else
    exit
fi

local shell=$(basename ${SHELL})
alias ${editor}config="${editor} ~/.config/${editor}"
alias ${shell}config="${editor} ~/.shell.d/${shell}/init; source ~/.${shell}rc"
alias tmuxconfig="${editor} ~/.tmux.conf; tmux source-file ~/.tmux.conf"

if type trash-put &> /dev/null
then
    alias tp=trash-put
fi
