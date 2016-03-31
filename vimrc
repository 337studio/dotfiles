" Begin .vimrc

" Syntax highlighting
syntax on

" Auto indent
set autoindent

" Highlight search results
set hlsearch

" Display search match while typing search pattern
set incsearch

" Searches should ignore case
set ignorecase

" Enable line numbers
set number

" # of columns occupied by tab character
set tabstop=8

"
set softtabstop=0

" Insert spaces instead of tabs
set expandtab

" Size of indent
set shiftwidth=4

"
set smarttab

" Display command in lower right corner
set showcmd

" Display cursor position in lower right corner
set ruler

" Automatic word wrapping
set textwidth=79

" Make % match angle brackets as well
set matchpairs+=<:>

" Make backspace work properly in Insert mode
set backspace=indent,eol,start

" The following is thanks to Mastering Vim video
" Only apply to .txt files...
augroup HelpInTabs
    autocmd!
    autocmd BufEnter  *.txt   call HelpInNewTab()
augroup END

"Only apply to help files...
function! HelpInNewTab ()
    if &buftype == 'help'
        "Convert the help window to a tab...
        execute "normal \<C-W>T"
    endif
endfunction

" End .vimrc
