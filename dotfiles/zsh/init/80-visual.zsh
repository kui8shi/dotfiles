case ${UID} in
    # root
    0)
        PROMPT_USER="%F{cyan}%n$%f"
        ;;

    # other
    *)
        PROMPT_USER="%F{green}%n%f"
        ;;

esac

if [ -n "${REMOTEHOST}${SSH_CONNECTION}" ]; then
    # remote connection
    PROMPT_PATH_COLOR="%F{magenta}"
else
    # local
    PROMPT_PATH_COLOR="%F{blue}"
fi

PROMPT_PATH="%(5~,.../%3~,%~)"

PROMPT_STRING="${PROMPT_USER}@${PROMPT_PATH_COLOR}%M:${PROMPT_PATH}%f"

function zle-line-init zle-keymap-select {
    case $KEYMAP in
        vicmd|visual)
            SUFFIX="|"
            ;;
        *)
            SUFFIX=">"
            ;;
    esac
    PROMPT=$'\n'"${PROMPT_STRING} ${SUFFIX} "
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
