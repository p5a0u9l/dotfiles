#!/bin/zsh

# a script for installing links to activate dotfiles/modules
source $HOME/dotfiles/dots/zshenv

# inputs:
# 1 --> src
# 2 --> dst
link() {
    echo "linking $1 --> $2..."
    ln -sf $1 $2
}

# SUBFOLDERNAME_DOTFILENAME
link_dots() {
    link $DOTDOTS/beets_config.yaml      $XDG/beets/config.yaml
    link $DOTDOTS/bpython_config         $XDG/bpython/config
    link $DOTDOTS/cmus_autosave          $XDG/cmus_autosave
    link $DOTDOTS/shairport-sync.conf    $XDG/shairport-sync/shairport-sync.conf
    link $DOTDOTS/nvim_init.vim          $XDG/nvim/init.vim
    link $DOTDOTS/vifmrc                 $XDG/vifm/vifmrc
    link $DOTDOTS/gitconfig              $HOME/.gitconfig
    link $DOTDOTS/gitignore              $HOME/.gitignore
    link $DOTDOTS/gpg-agent.conf         $HOME/.gnupg/gpg-agent.conf
    link $DOTDOTS/gpg.conf               $HOME/.gnupg/gpg.conf
    link $DOTDOTS/ipython_config.py      $HOME/.ipython_config
    link $DOTDOTS/pandoc_default.latex   $HOME/.pandoc/default.latex
    link $DOTDOTS/juliarc                $HOME/.juliarc
    link $DOTDOTS/pyrc                   $HOME/.pyrc
    link $DOTDOTS/ssh_config             $HOME/.ssh/config
    link $DOTDOTS/tmux.conf              $HOME/.tmux.conf
    link $DOTDOTS/vimrc                  $HOME/.vimrc
    link $DOTDOTS/zshrc                  $HOME/.zshrc
    link $DOTDOTS/zshenv                 $HOME/.zshenv
}

# modules
link_modules() {
    # zsh
    # ---
    link $DOTMODS/zsh/oh-my-zsh $HOME/.oh-my-zsh
    link $DOTMODS/tmux/plugins/ $HOME/.tmux/plugins
    # vim
    # ---
    link $DOTMODS/vim $VIMHOME
    link $DOTMODS/vim/bundle/vim-pathogen/autoload $VIMHOME/autoload
    link $DOTDOTS/filetypes.vim $DOTMODS/vim/filetypes.vim
    # python
    # ------
    link $DOTMODS/python/pyenv $HOME/.pyenv
    link $DOTMODS/python/pyenv-virtualenv $HOME/.pyenv/plugins/pyenv-virtualenv
}

# main
link_dots
link_modules
