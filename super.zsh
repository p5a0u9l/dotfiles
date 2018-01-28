#!/bin/zsh


# super-duper shell script
#

source $HOME/dotfiles/dots/export.zsh

function mk_quad() {
    tmux split-window -h
    tmux split-window -v
    tmux select-pane -t1
    tmux split-window -v
}

function init_tmux() {
    tmux new-window -n dots -c ~/dotfiles
    sleep 0.5
    tmux split-window -v -c ~/dotfiles -p 20
    tmux select-pane -t:1.1
    tmux split-window -h -c ~/dotfiles
}

# inputs:
# 1 --> src
# 2 --> dst
link() {
    echo $blue"linking$default: $1 --> $2..."
    if ! [[ -d `dirname $2` ]]; then
        mkdir `dirname $2`
    fi
    if [[ -a $2 ]]; then
        rm -r $2
    fi
    ln -sf $1 $2
}

# SUBFOLDERNAME_DOTFILENAME
link_dots() {
    if which cmus > $DEVNULL; then
        link $DOTDOTS/cmus_autosave          $XDG/cmus_autosave
    fi
    if which shairport-sync > $DEVNULL; then
        link $DOTDOTS/shairport-sync.conf    $XDG/shairport-sync/shairport-sync.conf
    fi

    if which git > $DEVNULL; then
        link $DOTDOTS/gitconfig              $HOME/.gitconfig
        link $DOTDOTS/gitignore              $HOME/.gitignore
    fi
    if which gpg2 > $DEVNULL; then
        link $DOTDOTS/gpg-agent.conf         $HOME/.gnupg/gpg-agent.conf
        link $DOTDOTS/gpg.conf               $HOME/.gnupg/gpg.conf
    fi
    link $DOTDOTS/pylintrc               $HOME/.pylintrc
    link $DOTDOTS/ssh_config             $HOME/.ssh/config
    if which tmux > $DEVNULL; then
        link $DOTDOTS/tmux.conf              $HOME/.tmux.conf
    fi
    if which vim > $DEVNULL; then
        link $DOTDOTS/vimrc                  $HOME/.vimrc
        link $DOTDOTS/filetypes.vim          $VIMHOME/filetypes.vim
    fi
    if which ag > $DEVNULL; then
        # see alias ag in .zshrc
        link $DOTDOTS/ignore                 $HOME/.ignore
    fi
    if which zsh > $DEVNULL; then
        link $DOTDOTS/zshrc                  $HOME/.zshrc
        link $DOTDOTS/zsh_history            $HOME/.zsh_history
    fi
}

# modules
link_modules() {
    # tmux
    # ---
    link $DOTMODS/tmux $HOME/.tmux

    # vim
    # ---
    link $DOTMODS/vim $VIMHOME
    link $DOTMODS/vim/bundle/vim-pathogen/autoload $VIMHOME/autoload
}

# main
if [[ $1 = "link-dots" ]]; then
    echo "installing dots..."
    link_dots
elif [[ $1 = "link-modules" ]]; then
    echo "installing modules..."
    link_modules
elif [[ $1 = "link-all" ]]; then
    echo "installing all..."
    link_dots
    link_modules
elif [[ $1 = "quad-pane" ]]; then
    mk_quad
elif [[ $1 = "init-tmux" ]]; then
    echo "init'ing tmux session..."
    init_tmux
elif [[ $1 = "quad-pane" ]]; then
    quad
elif [[ $1 = "self-install" ]]; then
    link $PWD/super.zsh $HOME/.local/bin/super
else
    echo "unrecognized option $1..."
fi
