if type kitty >/dev/null 2>&1; then
  # for japanese input
  export GLFW_IM_MODULE="ibus kitty"
  # alias for clipboard function
  alias clip="kitty +kitten clipboard"
fi
export XMODIFIERS=@im=fcitx
