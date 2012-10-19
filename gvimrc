" Example Vim graphical configuration.
" Copy to ~/.gvimrc or ~/_gvimrc.

set guifont=Ubuntu\ Mono\ 12            " Font family and font size.
set antialias                     " MacVim: smooth fonts.
set encoding=utf-8                " Use UTF-8 everywhere.
set guioptions-=T                 " Hide toolbar.
set background=dark              " Background.
set lines=25 columns=100          " Window dimensions.
colorscheme aldmeris
set t_vb=
set autowrite
au FocusLost * silent! wa

" Uncomment to use.
" set guioptions-=r                 " Don't show right scrollbar


