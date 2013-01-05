" Example Vim graphical configuration.
" Copy to ~/.gvimrc or ~/_gvimrc.

set guifont=DejaVu\ Sans\ Mono\ 10            " Font family and font size.
set encoding=utf-8                " Use UTF-8 everywhere.
set guioptions-=T                 " Hide toolbar.
set guioptions+=c                 " Use console dialogs
set background=dark               " Background.
"set lines=25 columns=100          " Window dimensions.
colorscheme level28
set t_vb=
set autowrite
au FocusLost * silent! wa

" Uncomment to use.
" set guioptions-=r                 " Don't show right scrollbar


