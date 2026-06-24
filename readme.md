dotfiles
==============

## Usage

```
$ cd ~/dotfiles
$ ./install.py [PROFILE]
$ ./regenzshrc.py
```

`install.py` creates symbolic links defined in `install.conf`.
`regenzshrc.py` generates `.zshrc` from `zshrc.d/**/*.zsh`. After the first generation, `.zshrc` auto-regenerates when files under `.zshrc.d/` change.

## Profiles

| Profile | Description |
|---------|-------------|
| `all`   | Full desktop setup |
| `server`| Minimal server setup |

## Components

| Component | Description |
|-----------|-------------|
| `zsh`     | zsh config, modular `zshrc.d/` |
| `bash`    | bash config |
| `nvim`    | Neovim config (Lua) |
| `tmux`    | tmux config |
| `git`     | gitconfig, gitignore |
| `kitty`   | Kitty terminal config |
| `python`  | Python startup, ipython |
| `claude`  | Claude Code settings |
| `env`     | Environment variables (`environment.d`) |
| `xkb`     | Custom keyboard layout |
| `i3`      | i3wm config |
| `bin`     | Utility scripts |
