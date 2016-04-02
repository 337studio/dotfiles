" Begin .vimrc

" --------------------------------
" BOOLEANS - Turn on the following
" --------------------------------

" Syntax highlighting
syntax on

" Auto indent
set autoindent

" Highlight search results
set hlsearch

" Search look-ahead while typing pattern
set incsearch

" Case-insensitive searches, but only when pattern is all-lowercase
set ignorecase smartcase

" Line numbers
set number

set smarttab

" Spaces instead of tabs
set expandtab

" Command display in lower right corner
set showcmd

" Cursor position display in lower right corner
set ruler

" # of columns occupied by tab character
set tabstop=8

"
set softtabstop=0

" Size of indent
set shiftwidth=4

" Automatic word wrapping
set textwidth=79

" Make % match angle brackets as well
set matchpairs+=<:>

" Make backspace work properly in Insert mode
set backspace=indent,eol,start

" Show all white space characters except for space
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<

" Enable listchars above
set list

" The following is thanks to Mastering Vim video
" Only apply to .txt files...
augroup HelpInTabs
    autocmd!
    autocmd BufEnter  *.txt   call HelpInNewTab()
augroup END

" Only apply to help files...
function! HelpInNewTab ()
    if &buftype == 'help'
        "Convert the help window to a tab...
        execute "normal \<C-W>T"
    endif
endfunction

" The following is thanks to Mastering Vim video
" Make delete key in Normal mode remove highlighted searches
nmap <silent>  <BS>  :nohlsearch<CR>

" End .vimrc
