function git-root(){
    cd $(git rev-parse --show-toplevel)
}
alias root=git-root
alias gw="git worktree"

# cd to the worktree of a branch; no arg -> pick interactively if fzf exists
function gwcd() {
  local branch=$1 dir
  if [[ -z $branch ]]; then
    if (( $+commands[fzf] )); then
      branch=$(git worktree list --porcelain | awk '/^branch /{sub("refs/heads/",""); print $2}' | fzf) || return
    else
      echo "usage: gwcd <branch>" >&2; return 1
    fi
  fi
  dir=$(git worktree list --porcelain | awk -v b="refs/heads/$branch" \
    '/^worktree /{d=$2} /^branch /{if ($2==b) print d}')
  [[ -n $dir ]] && cd "$dir" || { echo "gwcd: no worktree for branch '$branch'" >&2; return 1; }
}

function _gwcd() {
  local -a branches
  branches=(${(f)"$(git worktree list --porcelain 2>/dev/null | awk '/^branch /{sub("refs/heads/",""); print $2}')"})
  compadd -- $branches
}
compdef _gwcd gwcd

# Auto-set GH_TOKEN per repo based on remote owner (shell-local, doesn't affect other terminals)
autoload -Uz add-zsh-hook
function _auto_gh_token() {
  local remote
  remote=$(git remote get-url origin 2>/dev/null) || { unset GH_TOKEN; return; }
  case "$remote" in
    *kui8shi*) export GH_TOKEN=$(gh auth token --user kui8shi 2>/dev/null) ;;
    *)         unset GH_TOKEN ;;
  esac
}
add-zsh-hook chpwd _auto_gh_token
_auto_gh_token  # run on shell start too
