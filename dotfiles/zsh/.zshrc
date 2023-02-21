if [ -z "${DOTPATH:-}" ]; then
    DOTPATH=~/.dotfiles; export DOTPATH
fi

for file in "${HOME}"/.shell.d/zsh/init/*.zsh; do
    . "$file"
done
