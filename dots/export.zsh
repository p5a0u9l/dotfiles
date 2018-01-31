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

# GPG
export GPG_TTY=$TTY
export PINENTRY_USER_DATA="USE_CURSES=1"

# pyenv
export PYENV_ROOT=$HOME/.pyenv
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

PATH=$HOME/.local/bin:/usr/local/bin:$PYENV_ROOT/bin:$PATH
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# ZSH
export ZSH=$DOTMODS/zsh/oh-my-zsh
export ZSH_AUTOSUGGEST_STRATEGY=histdb_top_here
export SPACESHIP_BATTERY_SHOW=false
