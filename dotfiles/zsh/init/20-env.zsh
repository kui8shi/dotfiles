export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"
export SHELL=`which zsh`
export GHIDRA_INSTALL_DIR="${HOME}/ghidra"

virtualenvwrapper_path=~/.local/bin/virtualenvwrapper.sh
if [ -f $virtualenvwrapper_path ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    source $virtualenvwrapper_path
fi
