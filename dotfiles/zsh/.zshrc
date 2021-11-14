if [ -z "${DOTPATH:-}" ]; then
    DOTPATH=~/.dotfiles; export DOTPATH
fi

for file in "${HOME}"/.zsh.d/init/*.zsh; do
    . "$file"
done

# only load zplug when in Tmux
if [[ -n "$TMUX" ]]; then
    . "${HOME}"/.zsh/zplug.zsh
fi

#if has tmux; then
#    tmuxx
#fi
