#zsh script
# it's like a memo of what i did while my setup for manjaro i3.

# npm setup
sudo pacman -S nodejs npm \
  && mkdir -p ~/.npm-global \
  && npm config set prefix=$HOME/.npm-global \
  && npm install npm@latest -g \
  && sudo pacman -R npm \
  && export PATH=$PATH:${HOME}/.npm-global/bin # this line need to be fixed.
