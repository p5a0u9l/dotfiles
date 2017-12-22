#!/bin/zsh

# a script for installing links to activate dotfiles/modules
source $HOME/dotfiles/dots/export.zsh

# inputs:
# 1 --> src
# 2 --> dst
link() {
    echo "linking $1 --> $2..."
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
    link $DOTDOTS/cmus_autosave          $XDG/cmus_autosave
    link $DOTDOTS/shairport-sync.conf    $XDG/shairport-sync/shairport-sync.conf
    link $DOTDOTS/gitconfig              $HOME/.gitconfig
    link $DOTDOTS/gitignore              $HOME/.gitignore
    link $DOTDOTS/gpg-agent.conf         $HOME/.gnupg/gpg-agent.conf
    link $DOTDOTS/gpg.conf               $HOME/.gnupg/gpg.conf
    link $DOTDOTS/pylintrc               $HOME/.pylintrc
    link $DOTDOTS/ssh_config             $HOME/.ssh/config
    link $DOTDOTS/tmux.conf              $HOME/.tmux.conf
    link $DOTDOTS/vimrc                  $HOME/.vimrc
    link $DOTDOTS/filetypes.vim          $VIMHOME/filetypes.vim
    link $DOTDOTS/zshrc                  $HOME/.zshrc
    link $DOTDOTS/zsh_history            $HOME/.zsh_history
}

# modules
link_modules() {
    # tmux
    # ---
    link $DOTMODS/tmux/plugins $HOME/.tmux/plugins

    # vim
    # ---
    link $DOTMODS/vim $VIMHOME
    link $DOTMODS/vim/bundle/vim-pathogen/autoload $VIMHOME/autoload
}

# main
if [[ $1 = "dots" ]]; then
    echo "installing dots..."
    link_dots
elif [[ $1 = "module" ]]; then
    echo "installing modules..."
    link_modules
elif [[ $1 = "all" ]]; then
    echo "installing all..."
    link_dots
    link_modules
else
    echo "unrecognized option $1..."
fi

