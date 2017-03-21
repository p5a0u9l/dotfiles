"""""""""""""""""""
" => Python 
"""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self
au FileType python map <buffer> F :set foldmethod=indent<cr>
au FileType python map <buffer> <leader>1 /\<class\><cr>
au FileType python map <buffer> <leader>2 /\<def\><cr>
autocmd BufWrite *.py :call DeleteTrailingWS()
nnoremap <leader>db iimport bpdb; bpdb.set_trace()<esc>

""""""""""""""""""
" => Julia 
""""""""""""""""""
autocmd BufWrite *.jl :call DeleteTrailingWS()

"""""""""""""""""""
" => Matlab 
"""""""""""""""""""
autocmd BufWrite *.m :call DeleteTrailingWS()

