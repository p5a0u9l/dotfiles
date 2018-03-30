#!/bin/zsh


# super-duper shell script
#

source $HOME/dotfiles/dots/export.zsh

function install_new_environment() {
    ! [ -d $DOTHOME/build ] && mkdir $DOTHOME/build

    sudo apt update && sudo apt -y upgrade
    sudo apt install tig silversearcher-ag zsh tmux git ctags python3-dev openssh-server libgmp3-dev libturbojpeg libpng-dev npm nodejs-legacy curl libmpich-dev
    sudo apt install libreadline6-dev libssl-dev zlib1g-dev libbz2-dev libsqlite3-dev python-dev python3 python3-dev python3-venv

    which fzf > $DEVNULL
    if [ $? -eq 1 ]; then
        git clone https://github.com/junegunn/fzf $DOTHOME/build/fzf
        cd $DOTHOME/build/fzf
        ./install -y
        cd $OLDPWD
    fi
    which fd > $DEVNULL
    if [ $? -eq 1 ]; then
        cd $DOTHOME/build
        wget https://github.com/sharkdp/fd/releases/download/v6.3.0/fd-musl_6.3.0_amd64.deb
        sudo dpkg -i fd-musl_6.3.0_amd64.deb
        cd $OLDPWD
    fi
    vim --version | grep 'Paul Adams'>$DEVNULL
    if [ $? -eq 1 ]; then
        git clone https://github.com/vim/vim $DOTHOME/build/vim
        source $DOTHOME/scripts/build_vim8.zsh
    fi
    ! [ -d ~/.local/share/fonts/adobe-fonts/source-code-pro/ ] && sh $DOTHOME/scripts/install_font_adobe_source_code_pro.sh
}

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
    link $DOTDOTS/config.fish               $HOME/.config/fish/config.fish
    link $DOTDOTS/pylintrc                  $HOME/.pylintrc
    link $DOTDOTS/ssh_config                $HOME/.ssh/config
    if which tmux > $DEVNULL; then
        link $DOTDOTS/tmux.conf              $HOME/.tmux.conf
    fi
    if which vim > $DEVNULL; then
        link $DOTDOTS/vimrc                  $HOME/.vimrc
        link $DOTDOTS/filetypes.vim          $VIMHOME/filetypes.vim
    fi
    if which ag > $DEVNULL; then
        # see alias ag in .zshrc
        link $DOTDOTS/agignore                 $HOME/.agignore
        link $DOTDOTS/ignore                 $HOME/.ignore
    fi
    if which zsh > $DEVNULL; then
        link $DOTDOTS/zshrc                  $HOME/.zshrc
    fi
}

# modules
link_modules() {
    # tmux
    # ---
    link $DOTMODS/tmux $HOME/.tmux
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
elif [[ $1 = "bootstrap" ]]; then
    install_new_environment
elif [[ $1 = "self-install" ]]; then
    link $PWD/super.zsh $HOME/.local/bin/super
else
    echo "unrecognized option $1..."
fi
