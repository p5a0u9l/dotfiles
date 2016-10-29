#!/bin/bash


unamestr=`uname`
if [ "$unamestr" -ne 'Darwin' && "$unamestr" -ne 'Linux']; then
    echo "Nope. Much sad"
    exit 1
fi

cd $HOME

# clones
git clone https://github.com/p5a0u9l/dotfiles
git clone https://github.com/robbyrussel/oh-my-zsh.git

# prepare to start building stuff
mkdir buildrepos

# reminder of stuff to install --> install command dependant on platform (i.e., brew/pacman/make)
# 1. Basic Utils
#       - zsh --> github.com/git/git
#       - git --> github.com/git/git
#       - gpg2 --> github.com/mtigas/gnupg
#       - neovim/vim --> github.com/neovim/neovim
#       - source-code pro adobe-fonts/source-code-pro
#       - pass --> peff/pass
#       - ncdu -->
#
# 2. Programming
#       - tmux --> tmux.github.io
#       - neovim/vim --> github.com/neovim/neovim
#       - source-code pro adobe-fonts/source-code-pro
#       - jedi --> davidhalter/jedi
#       - python3
#           o numpy
#           o python-jedi
#           o pandas
#           o scipy
#           o nltk
#           o PyYAML

#       - python2
#       - pip
#       - bpython --> bpython/bpython
#       - pyenv --> yyuu/pyenv
#       - julia JuliaLang/julia
#       - pandoc jgm/pandoc
#
# 3. Audio
#       - shairport-sync --> mikebrady/shairport-sync
#       - cmus--> cmus.github.io
#       - pulseaudio --> pulseaudio/pulseaudio



