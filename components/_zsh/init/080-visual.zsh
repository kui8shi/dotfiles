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

# set options for less
export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'
# or the short version
# export LESS='-F -i -J -M -R -W -x4 -X -z-4'
# Set colors for less. Borrowed from https://wiki.archlinux.org/index.php/Color_output_in_console#less .
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[02;47;36m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
