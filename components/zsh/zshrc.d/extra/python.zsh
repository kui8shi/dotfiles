if [ -e ~/.python/startup.py ];then
    export PYTHONSTARTUP=~/.python/startup.py
fi

if (( $+commands[uv] )); then
    alias python='uv run python'
    alias python3='uv run python3'
fi
