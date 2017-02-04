#!/bin/zsh
#
#

DOT_HOME=$HOME/dotfiles
DOT_DOTS=$DOT_HOME/dots
DOT_MODS=$DOT_HOME/modules
XDG=$HOME/.config

link_me() {
    # inputs:
    # 1 --> src
    # 2 --> dst
    if [[ -h $2 ]]; then
	echo "removing link $2..."
        rm -f $2;
    fi
    echo "creating new link $1 --> $2..."
    ln -s $1 $2
}

# dot file names should follow convention
# SUBFOLDERNAME_DOTFILENAME
link_me $DOT_DOTS/beets_config.yaml $XDG/beets/config.yaml
link_me $DOT_DOTS/bpython_config $XDG/bpython/config
link_me $DOT_DOTS/cmus_autosave $XDG/cmus_autosave
link_me $DOT_DOTS/gitconfig $HOME/.gitconfig
link_me $DOT_DOTS/gpg-agent.conf $HOME/.gnupg/gpg
link_me $DOT_DOTS/gpg.cong $HOME/.gnupg/gpg
link_me $DOT_DOTS/nvim_init.vim $XDG/nvim/init.vim
link_me $DOT_DOTS/ipython_config.py $HOME/.ipython_config
link_me $DOT_DOTS/pandoc_default.latex $HOME/.pandoc/default.latex
link_me $DOT_DOTS/pyrc $HOME/.pyrc
link_me $DOT_DOTS/shairport-sync.conf $XDG/shairport-sync/shairport-sync.conf
link_me $DOT_DOTS/ssh_config $HOME/.ssh/config
link_me $DOT_DOTS/tmux.conf $HOME/.tmux.conf
link_me $DOT_DOTS/vifmrc $HOME/.vifmrc
link_me $DOT_DOTS/vimrc $HOME/.vimrc
link_me $DOT_DOTS/zshrc $HOME/.zshrc

# modules
link_me $DOT_MODS/zsh/oh-my-zsh.git $HOME/.oh-my-zsh.git
link_me $DOT_MODS/vim/bundle $XDG/nvim/bundle
link_me $DOT_MODS/vim/bundle/vim-pathogen/autoload $XDG/nvim/autoload
link_me $DOT_MODS/vim/filetypes.vim $HOME/.config/nvim/filetypes.vim
