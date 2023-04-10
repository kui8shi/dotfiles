# Memo for setup a new environment.

# zsh & tmux
sudo apt install -y zsh tmux

# Nodejs and npm
if ! command -v nodejs &> /dev/null
then
  curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash  - \
    && sudo apt install -y nodejs
fi

# Neovim
if ! command -v neovim &> /dev/null
then
  wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -P /tmp \
    && chmod a+x /tmp/nvim.appimage \
    && mv /tmp/nvim.appimage $HOME/.local/bin/nvim \
    && $HOME/.local/bin/nvim --headless +UpdateRemotePlugins +qa
fi

# gitignore
if command -v git &> /dev/null
then
  git config --global core.excludesfile $HOME/.gitignore.global
fi
