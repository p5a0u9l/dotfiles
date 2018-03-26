# Aliases
# -------
#
alias H="history"
alias trew="tmux rename-window $1"
alias tres="tmux rename-session $1"
alias cdd="cd $DOTHOME"
alias cddf="cd $DOTDOTS"
alias cddm="cd $DOTMODS"
alias l="ls -alh"
alias gst="git status"
alias gca="git commit -a"

set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish
#
# cute little welcome banner
echo ""
echo (date)
echo "      running "(uname -a)
echo ""


set -U fish_user_paths $fish_user_paths /usr/local/cuda-9.1/bin
set -gx LD_LIBRARY_PATH \$LD_LIBRARY_PATH /usr/local/cuda-9.1/lib64:/usr/local/cuda/extras/CUPTI/lib64
set -gx CUDA_HOME /usr/local/cuda

# -------
# EXPORTS
# -------

# dotfiles
set -gx VIMHOME $HOME/.vim
set -gx XDG $HOME/.config
set -gx DOTHOME $HOME/dotfiles
set -gx DOTDOTS $DOTHOME/dots
set -gx DOTMODS $DOTHOME/modules
set -gx DEVNULL "/dev/null"

# environment
set -gx LANG en_US.UTF-8
set -gx PAGER less
set -gx HISTSIZE 100000000
set -gx SAVEHIST $HISTSIZE
set -gx HIST_STAMPS "mm/dd/yyyy"
set -gx EDITOR vim

# FZF
set -gx FZF_DEFAULT_COMMAND "fd --type file --color=always --exclude .git"
set -gx FZF_DEFAULT_OPTS "--ansi"
