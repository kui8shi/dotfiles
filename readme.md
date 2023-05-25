dotfiles
==============
this was originated from cocuh's dotfiles.

usage
-----

Run `python install.py`. it makes symbolic link to dotfiles.
This script required python. (but compatible for python2/3)

```
$ cd ~/dotfiles
$ ./install.py [PROFILE]
$ ./regenzshrc.py
```

### warning
This install script doesn't generate `.zshrc`.
You must run `regenzshrc.py` to generate `.zshrc` after calling install script.
After first zsh script generation, `.zshrc` watches `.zshrc.d/*/*.zsh` files to re-generate itself.

profile
-------
 desktop

component
-------
Components define how to make symbolic links on each dotfiles.

* zsh
* bin
* vim
* tmux
* i3
* ipython
* xdefaults
* xresources
* python
  * virtualenvwrapper
