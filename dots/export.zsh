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

# PATH APPENDAGES
export PATH=/usr/local/bin:$PATH
if [[ -d /opt/python3 ]]; then
    export PYTHON=/opt/python3
    export PATH=$PYTHON/bin:$PATH
    export LD_LIBRARY_PATH=$PYTHON/lib
fi

# GPG
export GPG_TTY=$TTY
export PINENTRY_USER_DATA="USE_CURSES=1"

# ZSH
export ZSH=$DOTMODS/zsh/oh-my-zsh
export ZSH_AUTOSUGGEST_STRATEGY=histdb_top_here
