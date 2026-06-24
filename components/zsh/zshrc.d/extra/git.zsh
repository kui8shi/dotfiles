function git-root(){
    cd $(git rev-parse --show-toplevel)
}
alias root=git-root
alias gw="git worktree"

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
