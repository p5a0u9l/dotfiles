#!/bin/zsh
# a script for installing links to activate dotfiles/modules

# inputs:
# 1 --> src
# 2 --> dst
link_me() {
    if [[ -h $2 ]]; then
        echo "removing link $2..."
        rm -f $2;
    fi
    echo "creating new link $1 --> $2..."
    ln -s $1 $2
}

# SUBFOLDERNAME_DOTFILENAME
link_dots() {
    link_me $DOTDOTS/beets_config.yaml      $XDG/beets/config.yaml
    link_me $DOTDOTS/bpython_config         $XDG/bpython/config
    link_me $DOTDOTS/cmus_autosave          $XDG/cmus_autosave
    link_me $DOTDOTS/shairport-sync.conf    $XDG/shairport-sync/shairport-sync.conf
    link_me $DOTDOTS/nvim_init.vim          $XDG/nvim/init.vim
    link_me $DOTDOTS/vifmrc                 $XDG/vifm/vifmrc
    link_me $DOTDOTS/gitconfig              $HOME/.gitconfig
    link_me $DOTDOTS/gpg-agent.conf         $HOME/.gnupg/gpg
    link_me $DOTDOTS/gpg.conf               $HOME/.gnupg/gpg
    link_me $DOTDOTS/ipython_config.py      $HOME/.ipython_config
    link_me $DOTDOTS/pandoc_default.latex   $HOME/.pandoc/default.latex
    link_me $DOTDOTS/pyrc                   $HOME/.pyrc
    link_me $DOTDOTS/ssh_config             $HOME/.ssh/config
    link_me $DOTDOTS/tmux.conf              $HOME/.tmux.conf
    link_me $DOTDOTS/vimrc                  $HOME/.vimrc
    link_me $DOTDOTS/zshrc                  $HOME/.zshrc
}

# modules
link_modules() {
    # git submodules
    link_me $DOTMODS/zsh/oh-my-zsh $HOME/.oh-my-zsh
    link_me $DOTMODS/vim $XDG/nvim
    link_me $DOTMODS/vim $HOME/.vim
}

# main
link_dots
link_modules
