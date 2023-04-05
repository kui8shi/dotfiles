# Memo for setup a new environment.

# Nodejs and npm
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash  - \
  && sudo apt install -y nodejs

# Neovim
wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -P /tmp \
  && chmod a+x /tmp/nvim.appimage \
  && mv /tmp/nvim.appimage/ $HOME/.local/bin
  && $HOME/.local/bin/nvim --headless +UpdateRemotePlugins +qa
