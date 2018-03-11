README
======

This repo is intended to contain all the files I need to quickly and securely replicate my environment on a new machine. The actual dotfiles are free for comment and usage, Please comment, contribute, or borrow at will.

Configuring Ubuntu
------------------

* install basic stuff::

    $ sh $DOTHOME/scripts/install_font_adobe_source_code_pro.sh
    $ mkdir $DOTHOME/build
    $ git clone https://github.com/sharkdp/fd $DOTHOME/build/fd
    $ git clone https://github.com/junegunn/fzf $DOTHOME/build/fzf
    $ git clone https://github.com/git/git $DOTHOME/build/git
    $ git clone https://github.com/jonas/tig $DOTHOME/build/tig
    $ git clone https://github.com/vim/vim $DOTHOME/build/vim
    $ sudo apt update && sudo apt -y upgrade
    $ sudo apt install zsh tmux git openssh-server libgmp3-dev libturbojpeg libpng-dev npm nodejs-legacy curl libmpich-dev

* Set up an ssh key from this machine to internal git server::

    $ ssh-keygen -C padams@echodyne.int.tortoise
    $ cat ~/.ssh/id_rsa.pub
    $ git clone ssh://git@git.echodyne.int:7999/rs/cm_sllm.git

* Set Up Python for virtual environments::

    $ sudo apt install libreadline6-dev libssl-dev zlib1g-dev libbz2-dev libsqlite3-dev python-dev python3 python3-dev python3-venv

Install/configure vim 8::
~~~~~~~~~~~~~~~~~~~~~~~~~

    $ sudo apt install ctags    # vim
    $ sudo add-apt-repository ppa:jonathonf/vim
    $ sudo apt update
    $ sudo apt upgrade
    $ sudo ln -sf /usr/local/MATLAB/R2017b/bin/glnxa64/mlint /usr/local/bin/mlint

Create a local file share
~~~~~~~~~~~~~~~~~~~~~~~~~

Requires samba

`sudo apt install samba`

Follow [these instructions](https://help.ubuntu.com/community/How%20to%20Create%20a%20Network%20Share%20Via%20Samba%20Via%20CLI%20%28Command-line%20interface/Linux%20Terminal%29%20-%20Uncomplicated%2C%20Simple%20and%20Brief%20Way%21) to setup.

From Windows, navigate to `\\<IP_ADDR>\<share-name>` and enter credentials created above.

Create new ssh key pair
~~~~~~~~~~~~~~~~~~~~~~~

- `new_hostname` is the name of the target machine

        $ export fqdn=domainname/new_hostname

- Generate a new ssh key and save to an appropriate location

        $ ssh-keygen -b 4096 -C "$USER@$fqdn" -f ~/.ssh/$fqdn-id_rsa

- Copy the new key to the target machine (obviously must already have some existing authentication method)

        $ ssh-copy-id -i ~/.ssh/$fqdn-id_rsa $fqdn

- Update `sshconfig` file to contain specify which `IdentityFile` to use for each host.
