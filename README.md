# Dotfiles

This is my personal collection of [dotfiles](http://dotfiles.github.io/).

## Usage

Pull the repository, and then create the symbolic links with [GNU
stow](https://www.gnu.org/software/stow/).

```bash
$ git clone https://github.com/blalop/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ stow bash tmux # and all the things you'd like
```

Note that stow will not override your configuration, so you have to remove your current files manually.
