#!/bin/zsh

# zsh modules
git submodule add https://github.com/dracula/zsh.git modules/zsh/dracula-theme
git submodule add https://github.com/zsh-users/zsh-autosuggestions modules/zsh/zsh-autosuggestions 
git submodule add https://github.com/robbyrussell/oh-my-zsh.git modules/zsh/oh-my-zsh.git

# vim modules
git submodule add https://github.com/ctrlpvim/ctrlp.vim modules/vim/bundle/ctrlp.vim
git submodule add https://github.com/tpope/vim-surround modules/vim/bundle/vim-surround
git submodule add https://github.com/tpope/vim-fugitive modules/vim/bundle/vim-fugitive
git submodule add https://github.com/flazz/vim-colorschemes modules/vim/bundle/vim-colorschemes
git submodule add https://github.com/tpope/vim-pathogen modules/vim/bundle/vim-pathogen
git submodule add https://github.com/tpope/vim-commentary modules/vim/bundle/vim-commentary
git submodule add https://github.com/lazywei/vim-matlab modules/vim/bundle/vim-matlab
git submodule add https://github.com/xolox/vim-easytags modules/vim/bundle/vim-easytags
git submodule add https://github.com/xolox/vim-misc modules/vim/bundle/vim-misc
git submodule add https://github.com/Shougo/neocomplcache modules/vim/bundle/neocomplcache
git submodule add https://github.com/Shougo/deoplete.nvim modules/vim/bundle/deoplete.nvim
git submodule add https://github.com/Shougo/neosnippet modules/vim/bundle/neosnippet
git submodule add https://github.com/Shougo/neosnippet-snippets modules/vim/bundle/neosnippet-snippets
git submodule add https://github.com/zchee/deoplete-jedi modules/vim/bundle/deoplete-jedi
git submodule add https://github.com/vim-airline/vim-airline modules/vim/bundle/vim-airline
git submodule add https://github.com/vim-airline/vim-airline-themes modules/vim/bundle/vim-airline-themes
git submodule add https://github.com/neomake/neomake modules/vim/bundle/neomake

# and demodularize
# git submodule foreach 'cd ../../../ && git submodule deinit -f '
