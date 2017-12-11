# -------
# EXPORTS
# -------
export MACBOOKHOSTNAME="amalthea"

# dotfiles
export VIMHOME=$HOME/.vim
export XDG=$HOME/.config
export DOTHOME=$HOME/dotfiles
export DOTDOTS=$DOTHOME/dots
export DOTMODS=$DOTHOME/modules
export DEVNULL="/dev/null"

# environment
export LANG=en_US.UTF-8
export PAGER=less
export HISTSIZE=100000000
export SAVEHIST=$HISTSIZE
export HIST_STAMPS="mm/dd/yyyy"
export EDITOR='vim'
export PYENV_ROOT="$HOME/.pyenv"

# PATH APPENDAGES

# stick anaconda on front
export PATH=$PATH:$HOME/.local/bin:$PYENV_ROOT/bin

# GPG
export GPG_TTY=$TTY
export PINENTRY_USER_DATA="USE_CURSES=1"

# PYTHON
export PYTHONPATH=$PYENV_ROOT/versions/anaconda3-4.4.0

# ZSH
export ZSH=$DOTMODS/zsh/oh-my-zsh
export ZSH_AUTOSUGGEST_STRATEGY=histdb_top_here


