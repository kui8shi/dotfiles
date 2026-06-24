if type kitty >/dev/null 2>&1; then
  # This variable need to be set to "ibus" no matter what the IME you are using (?)
  # c.f. https://fcitx-im.org/wiki/Setup_Fcitx_5#Other_less_common_setup
  export GLFW_IM_MODULE="ibus"
  # alias for clipboard function
  alias clip="kitty +kitten clipboard"
fi
