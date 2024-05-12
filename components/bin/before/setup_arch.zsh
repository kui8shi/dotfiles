#zsh script
# it's like a memo of what i did
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /tmp/nvim-linux64
sudo tar -C /tmp -xzf nvim-linux64.tar.gz
install_diff.sh /tmp/nvim-linux64 ~/.local

function install_diff(path) {
  for p in $(ls -1 $1); do
    if [ -e $p ]; then
      install_diff($p)
    else
      src = $1/$p
      dest = $2/$(dirname $p)
      install $src $dest
    fi
  done
}

# npm setup
sudo pacman -S nodejs npm \
  && mkdir -p ~/.npm-global \
  && npm config set prefix=$HOME/.npm-global \
  && npm install npm@latest -g \
  && sudo pacman -R npm \
  && export PATH=$PATH:${HOME}/.npm-global/bin # this line need to be fixed.
