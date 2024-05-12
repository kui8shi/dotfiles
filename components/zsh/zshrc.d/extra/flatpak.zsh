typeset -U XDG_DATA_DIRS xdg_data_dirs
xdg_data_dirs+=("$HOME/.local/share/flatpak/exports/share")
xdg_data_dirs+=('/var/lib/flatpak/exports/share')
typeset -U xdg_data_dirs XDG_DATA_DIRS
