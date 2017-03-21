" -------
" PLUGINS
" -------
    call pathogen#infect('~/.config/nvim/bundle/{}')
    call pathogen#helptags()
    source ~/.config/nvim/filetypes.vim

    " CRITICAL neovim python locations
    let g:python3_host_prog="/Users/paul/.pyenv/versions/neovim3/bin/python"
    let g:python_host_prog="/Users/paul/.pyenv/versions/neovim2/bin/python"

    " deoplete
    let g:deoplete#enable_at_startup=1
    let g:deoplete#sources#jedi#python_path="/Users/paul/.pyenv/versions/neovim3/bin/python"

    " neomake
    autocmd! BufWritePost * Neomake

    " fugitive
    noremap <leader>gs :Gstatus<cr>

    " CTRL-P
    let g:ctrlp_working_path_mode=0
    map <c-b> :CtrlPBuffer<cr>
    let g:ctrlp_max_height=20
    let g:ctrlp_custom_ignore='node_modules\|^\.DS_Store\|^\.git\|^\.coffee'
    " airline
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    " unicode symbols
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.crypt = '🔒'
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.maxlinenr = '☰'
    let g:airline_symbols.maxlinenr = ''
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.spell = 'Ꞩ'
    let g:airline_symbols.notexists = '∄'
    let g:airline_symbols.whitespace = 'Ξ'

" --------
" SETTINGS
" --------
    filetype plugin on        " Enable filetype plugins
    filetype indent on
    set colorcolumn=80
    set number
    set noshowmode            " don't show the mode
    set so=15                 " when moving vertically using j/k
    set showcmd               " show the command
    let base16colorspace=256  " Access colors present in 256 colorspace
    let mapleader = "\<Space>"
    set foldcolumn=0  " Folding settings
    set wildignore=*.o,*~,*.pyc  " Ignore compiled files
    set wildignore+=.git\*,.hg\*,.svn\*
    set ruler
    set noswapfile
    set cmdheight=1  " Height of the command bar
    set whichwrap+=<,>,h,l
    set magic  " For regular expressions turn magic on
    set showmatch  " Show matching brackets
    set noerrorbells  " No annoying sound on errors
    set novisualbell
    set fdm=indent
    syntax enable  " Enable syntax highlighting
    set background=dark
    set ffs=unix,dos,mac
    set expandtab  " Use spaces instead of tabs
    set shiftwidth=4
    set tabstop=4
    set linespace=10                   " prefer a slight higher line height
    set tw=500
    set viminfo^=%  " Remember info about open buffers on close
    set wrap "Wrap lines
    " Let 'tl' toggle between this and the last accessed tab
    let g:lasttab=1
    nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
    au TabLeave * let g:lasttab = tabpagenr()


    let g:mapleader = "\<Space>"
    colorscheme dracula

" ----
" MAPS
" ----
    " Whwn you press <leader>r you can search and replace the selected text
    vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>
    " Pressing ,ss will toggle and untoggle spell checking
    map <leader>ss :setlocal spell!<cr>
    " Shortcuts using <leader>
    map <leader>sn ]s
    map <leader>sp [s
    map <leader>sa zg
    map <leader>s? z=
    " move between windows
    noremap <c-k> gt
    noremap <c-j> gT
    " move lines +-
    noremap - ddp
    noremap _ ddkP
    " change in quotes (easier to type)
    noremap ciq ci"
    noremap diq di"
    " yank everything from the cursor to the end of the line. 
    noremap Y y$
    " cmd-like navigation
    inoremap <C-e> <C-o>$
    inoremap <C-a> <C-o>0
    inoremap <C-f> <C-o><Right>
    inoremap <C-b> <C-o><Left>
    " Fast saving
    nmap <leader>w :w!<cr>
    " inset line below cursor
    nmap <CR> o<esc>
    " replace the current word and all its occurrences.
    nnoremap <Leader>rc :%s/\<<C-r><C-w>\>/
    vnoremap <Leader>rc y:%s/<C-r>"/
    " Visual mode pressing * or # searches for the current selection
    vnoremap <silent> * :call VisualSelection('f', '')<CR>
    vnoremap <silent> # :call VisualSelection('b', '')<CR>
    " Disable highlight when <leader><cr> is pressed
    map <silent> <leader><cr> :noh<cr>
    " managing tabs
    noremap <C-w>h :tabmove -1<cr>
    noremap <C-w>l :tabmove +1<cr>
    " Open a new tab with the current buffer's path
    map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
    " Switch CWD to the directory of the open buffer
    map <leader>cd :cd %:p:h<cr>:pwd<cr>

    " Return to last edit position when opening files (You want this!)
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
    " Toggle paste mode on and off
    map <leader>pp :setlocal paste!<cr>

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ag \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" => Vim grep
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/usr/local/bin/ag
