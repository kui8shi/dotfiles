backward-delete-word() {
    local WORDCHARS="${WORDCHARS:s#/#}"
    zle backward-delete-word
}

zle -N backward-delete-word
bindkey "^W" backward-delete-word
