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

alias pingg='ping -c 3 www.google.co.jp'
alias less='less -R'

alias ssh-add='ssh-add -t 1h'

alias sozsh='source ~/.zshrc'
alias :q='exit'
alias :Q='exit'
alias vi='vim'

alias wifi='nmtui'
alias pm-suspend='sudo pm-suspend'

alias t='tmux'
alias pdb='python /usr/lib/python3.10/pdb.py'

alias chx="chmod a+x"

alias unzip-cp932='unzip -O cp932'

if (type nvim &> /dev/null);then
    alias vim='nvim'
    alias n='nvim'
    alias nvimconfig="nvim ~/.config/nvim"
    export EDITOR='nvim'
elif (type vim &> /dev/null);then
    export EDITOR='vim'
fi

alias zshconfig="${EDITOR} ~/.zshrc.d; source ~/.zshrc"
if (type tmux &> /dev/null); then
  alias tmuxconfig="${EDITOR} ~/.tmux.conf; tmux source-file ~/.tmux.conf"
fi

if (type i3 &> /dev/null); then
  alias i3config="${EDITOR} ~/.config/i3/config"
fi

if (type nvim &>/dev/null)
refresh(){
  echo c
}
alias globalip='curl http://ipecho.net/plain'

if (type pacman &>/dev/null && type pip &> /dev/null);then
  function pip_check(){
    if read -q "choice?Are you sure to install it without pacman? [yN]"; then
      return 0
    else
      return 1
    fi
  }
fi
alias pip="pip_check&&pip"
