" general
set number 				    " set line numbers in terminal
set nohlsearch 				" un-highlight the search in the text
set ai					    " set auto-indent							
set bg=dark				    " sets dark background
set showmatch				" matches parenthesis/braces
set tabstop=4				" how many columns a tab counts for
set shiftwidth=4			" how many columns text is indented with the reindent operations (<< and >>)
set expandtab				" hitting Tab in insert mode will produce the appropriate number of spaces
set smartindent				" automatically inserts one extra level of indentation in some cases, and works for C-like files
syntax on				    " set color syntax highlighting
set ignorecase              " case in-senitive search
set smartcase               " When 'ignorecase' and 'smartcase' are both on, if a pattern contains an uppercase letter, it is case sensitive, otherwise, it is not. For example, /The would find only "The", while /the would find "the" or "The" etc


" Python specific
" au - autocomand, setlocal - prevent these options from stomping on other buffers' options, cinwords - to get rid of indentation of specifically after keywords
au BufEnter, BufRead *.py setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
