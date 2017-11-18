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

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# stick anaconda on front
export PATH=$HOME/anaconda3/bin:$PATH
export PATH=$PATH:$PYENV_ROOT/bin

# GPG
export GPG_TTY=$TTY
export PINENTRY_USER_DATA="USE_CURSES=1"
export TARGPGKEY=834E117E       # key ID for encryption
export PASSGPGKEY=EB47B5CA      # alt key ID for encryption

# PYTHON
export PYTHONSTARTUP="$HOME/.pyrc"
export PYTHONPATH="$HOME/anaconda3:$HOME/.local/lib/python/"

# ZSH
export ZSH=$DOTMODS/zsh/oh-my-zsh
export ZSH_AUTOSUGGEST_STRATEGY=histdb_top_here


