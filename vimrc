" File: .vimrc
" Author: Hogan Lee

" Vundle settings {{{
"
" The following lines are required in order for Vundle to work properly
" See: https://github.com/VundleVim/Vundle.vim
set nocompatible
filetype off " will be turned on again after vundle stuff

"set the runtime path to include and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Fuzzy finder
Plugin 'ctrlpvim/ctrlp.vim'

" File tree to supplement vim's buffer list
Plugin 'scrooloose/nerdtree'

" Solarized colors, yay
Plugin 'altercation/vim-colors-solarized'

" Shortcuts for commenting code
Plugin 'tpope/vim-commentary'

" Tim Pope's sweet git plugin
Plugin 'tpope/vim-fugitive'

" Tim Pope's sweet surround plugin
Plugin 'tpope/vim-surround'

" Cursor fixes for iTerm
Plugin 'sjl/vitality.vim'

" Add lines to help visualize indents
Plugin 'Yggdroot/indentLine'

" Vim markdown plugin
" See: https://github.com/tpope/vim-markdown
Plugin 'tpope/vim-markdown'

" Souped-up status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Syntax checking plugin
" Plugin 'vim-syntastic/syntastic'

" Textile syntax highlighting
Plugin 'timcharper/textile.vim'

" All Plugins must be added before the following line
call vundle#end()

" }}}

" General settings {{{

" Filetype detection, use plugin & indent files
filetype plugin indent on

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

" Relative line numbers
set relativenumber

set smarttab

" Incomplete command display in lower right corner
set showcmd

" Cursor position display in lower right corner
set ruler

" Always use spaces instead of tabs
set expandtab

" Set the following 3 options to the same #
" # of columns occupied by tab character
set tabstop=4

" Spaces per tab
set softtabstop=4

" Size of indent in normal mode
set shiftwidth=4

" Automatic word wrapping
set textwidth=79

" Make % match angle brackets as well
set matchpairs+=<:>

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Show all white space characters except for space
set listchars=eol:¬,tab:\┆\ ,trail:~,extends:>,precedes:<,nbsp:+

" Enable listchars above
set list

" Disable warnings for unwritten buffers
set hidden

" Always show statusline
set laststatus=2

" }}}

" Abbreviations {{{

" Automatically fix common spelling errors; see :h abbreviations
iabbrev adn and
iabbrev waht what
iabbrev teh the
iabbrev tehn then
iabbrev tihs this
iabbrev thier their
iabbrev seperate separate
iabbrev alot a<Space>lot
iabbrev occassionally occasionally

iabbrev @@ hogan@337studio.com

" }}}

" Auto commands {{{

" The following is thanks to Mastering Vim video
" Only apply to .txt files...
augroup HelpInTabs
    autocmd!
    autocmd BufEnter  *.txt   call HelpInNewTab()
augroup END

" Only apply to help files...
function! HelpInNewTab ()
    if &buftype == 'help'
        " Convert the help window to a tab...
        execute "normal \<C-W>T"
    endif
endfunction

" Vimscript file settings {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" HTML file settings
augroup filetype_html
    autocmd!
    autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END

" Python file settings
augroup filetype_python
    autocmd!
    autocmd FileType python     :iab <buffer> iff if:<left>
augroup END

" JavaScript file settings
augroup filetype_javascript
    autocmd!
    autocmd FileType javascript :iab <buffer> iff if ()<left>
augroup END

" Markdown file settings
augroup filetype_markdown
    autocmd!
    autocmd FileType markdown :ono ih
        \ :<C-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<CR>
    autocmd FileType markdown :ono ah
        \ :<C-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<CR>
augroup END

" }}}

" Mappings {{{

" Set leader to <Space>
let mapleader = "\<Space>"

" Set local leader to backslash
let maplocalleader = "\\"

" Disable <Esc> to better train myself
inoremap <Esc> <nop>

" Easier way to exit Insert mode
inoremap jk <Esc>

" The following is thanks to Mastering Vim video
" Make delete key in Normal mode remove highlighted searches
nnoremap <silent>  <BS>  :nohlsearch<CR>

" Quickly open .vimrc in a split window
" Thanks: http://learnvimscriptthehardway.stevelosh.com/chapters/07.html
nnoremap <leader>ev :vsplit $MYVIMRC<CR>

" Quickly source an edited .vimrc file
nnoremap <leader>sv :source $MYVIMRC<CR>

" Move a line down (hyphen)
nnoremap <leader>- ddp

" Move a line up (underscore)
nnoremap <leader>_ dd2kp

" Insert a blank line
nnoremap <leader><Space> o<Esc>

" Ctrl-j/k deletes blank line below/above, and <leader>j/k inserts
" Thanks: http://vim.wikia.com/wiki/Quickly_adding_and_deleting_empty_lines
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><leader>j :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><leader>k :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Convert word to uppercase (insert mode)
inoremap <C-u> <Esc>vawUea

" Convert word to uppercase (normal mode)
nnoremap <leader><C-u> viwU

" Wrap a word in double quotes
nnoremap <leader>" viw<Esc>a"<Esc>hbi"<Esc>lel

" Wrap a word in single quotes
nnoremap <leader>' viw<Esc>a'<Esc>hbi'<Esc>lel

" Wrap a word in backticks
nnoremap <leader>` viw<Esc>a`<Esc>hbi`<Esc>lel

" Wrap visually selected text in double quotes
vnoremap <leader>" <Esc>`>a"<Esc>`<i"<Esc>

" When indenting a visual selection, keep selected text highlighted
vnoremap > >gv

" Same as above, but outdenting
vnoremap < <gv

" Map <tab> key to do same as > in visual mode
vnoremap <Tab> >gv

" Map <shift + tab> to do same as < in visual mode
vnoremap <S-Tab> <gv

" Autofix entire buffer with eslint_d:
" nnoremap <leader>f mF:%!eslint_d --stdin --fix-to-stdout<CR>`F

" Autofix visual selection with eslint_d:
" vnoremap <leader>f :!eslint_d --stdin --fix-to-stdout<CR>gv

" Expansion of active file directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Open NERDTree sidebar
nnoremap <leader>[ :NERDTree<CR>

" Close NERDTree sidebar
nnoremap <leader>] :NERDTreeClose<CR>

" }}}

" Plugins, etc {{{

" Set tabstop, softtabstop and shiftwidth to the same value
" Thanks: http://vimcasts.org/episodes/tabs-and-spaces/
command! -nargs=* Stab call Stab()
function! Stab()
    let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
    if l:tabstop > 0
        let &l:sts = l:tabstop
        let &l:ts = l:tabstop
        let &l:sw = l:tabstop
    endif
    call SummarizeTabs()
endfunction

function! SummarizeTabs()
    try
        echohl ModeMsg
        echon 'tabstop='.&l:ts
        echon ' shiftwidth='.&l:sw
        echon ' softtabstop='.&l:sts
        if &l:et
            echon ' expandtab'
        else
            echon ' noexpandtab'
        endif
    finally
        echohl None
    endtry
endfunction

" Load matchit.vim, but only if the user hasn't installed a newer version.
" Thanks: https://github.com/tpope/vim-sensible
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" Use solarized (dark) colorscheme
set background=dark
colorscheme solarized

" Tell CtrlP plugin to exclude files in gitignore file
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Enable powerline fonts in airline
let g:airline_powerline_fonts = 1

" Defaults for syntastic plugin
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0

" }}}
