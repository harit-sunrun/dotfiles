" general
set number 				    " set line numbers in terminal
set nohlsearch 				" un-highlight the search in the text
set ai					    " set auto-indent							
set showmatch				" matches parenthesis/braces
set tabstop=4				" how many columns a tab counts for
set shiftwidth=4			" how many columns text is indented with the reindent operations (<< and >>)
set expandtab				" hitting Tab in insert mode will produce the appropriate number of spaces
set smartindent				" automatically inserts one extra level of indentation in some cases, and works for C-like files
syntax on				    " set color syntax highlighting
set ignorecase              " case in-senitive search
set smartcase               " When 'ignorecase' and 'smartcase' are both on, if a pattern contains an uppercase letter, it is case sensitive, otherwise, it is not. For example, /The would find only "The", while /the would find "the" or "The" etc
filetype on                 " file detection
filetype plugin on


" look and feel
set nocompatible            " effect of making Vim either more Vi-compatible, or make Vim behave in a more useful way
colorscheme lucius
set bg=dark				    " sets dark background

" Python specific
" au - autocomand, setlocal - prevent these options from stomping on other buffers' options, cinwords - to get rid of indentation of specifically after keywords
au BufEnter, BufRead *.py setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
let g:neocomplcache_enable_at_startup = 1
autocmd FileType python set omnifunc=pythoncomplete#Complete

" mapping keys
nnoremap <C-c><C-c> :!/opt/local/bin/ctags -R --python-kinds=-i *.py<CR>
nnoremap <C-t><C-t> :TlistToggle<CR>
inoremap <C-space> <C-x><C-o> " autocomplete key map
nnoremap <C-f><C-f> :FufFile<CR>
nnoremap <C-n><C-n> :NERDTreeToggle<CR>
