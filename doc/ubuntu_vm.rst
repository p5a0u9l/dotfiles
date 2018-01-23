Configuring Ubuntu VM
=====================


* install basic stuff

* Set up an ssh key from this machine to internal git server::

    $ ssh-keygen -C padams@echodyne.int.tortoise
    $ cat ~/.ssh/id_rsa.pub
    $ git clone ssh://git@git.echodyne.int:7999/rs/cm_sllm.git

* Set Up Python pyenv::

    $ sudo apt install libreadline6-dev
    $ sudo apt install libssl-dev
    $ sudo apt install zlib1g-dev
    $ sudo apt install libbz2-dev
    $ git clone https://github.com/pyenv/pyenv ~/.pyenv
    $ git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
    $ pyenv install 3.6.0

# Install/configure vim 8::

    $ sudo apt install ctags    # vim
    $ sudo add-apt-repository ppa:jonathonf/vim
    $ sudo apt update
    $ sudo apt upgrade
    $ sudo ln -sf /usr/local/MATLAB/R2017b/bin/glnxa64/mlint /usr/local/bin/mlint
