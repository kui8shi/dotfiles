## dtags (https://github.com/joowani/dtags)
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

if type dtags-activate &> /dev/null
then
    source <(dtags-activate)
fi

## for external data dir
export EZ_DATA_DIR="${HOME}/data/"

if type trash-put &> /dev/null
then
    local trash_dir="--trash-dir ~/.Trash"
    alias rm="trash-put ${trash_dir}"
    alias trash-empty="trash-empty ${trash_dir}"
fi
