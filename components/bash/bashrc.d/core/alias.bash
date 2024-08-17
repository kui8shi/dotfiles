#alias
case $(uname) in
  Darwin*)
    alias ls='ls -FG'
    ;;
  Linux*)
    alias ls='ls -FH --color'
    alias ll='ls -lAF'
    alias l='ls'
    ;;
esac

alias la='ls -a'
alias sl='ls'

alias g='git'
alias gst='git status;'

alias tree='tree -N'
alias du='du -h'
alias df='df -h'

alias cd..='cd ..'
alias dc='cd'
alias c='cd'
mkcd() {
  mkdir -p "$1"
  [ $? -eq 0 ] && cd "$1"
}

alias less='less -R'

alias ssh-add='ssh-add -t 1h'

alias sobash='source ~/.bashrc'
alias :q='exit'
alias vi='vim'

alias t='tmux'
alias chx="chmod a+x"

alias bashconfig="${EDITOR} ~/.bashrc.d; source ~/.bashrc"

if (type bat &> /dev/null);then
  alias cat=bat
fi
