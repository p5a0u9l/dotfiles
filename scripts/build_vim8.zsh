sudo apt-get remove --purge vim vim-runtime vim-gnome vim-tiny vim-gui-common

sudo rm -rf /usr/local/share/vim /usr/bin/vim

cd $HOME/dotfiles/build/vim/

./configure \
--enable-multibyte \
--enable-perlinterp=dynamic \
--enable-pythoninterp=dynamic \
--with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
--enable-python3interp \
--with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
--enable-cscope \
--enable-gui=auto \
--with-features=huge \
--with-x \
--enable-fontset \
--enable-largefile \
--disable-netbeans \
--with-compiledby="Paul Adams" \
--enable-fail-if-missing

make -j4 && sudo make install
