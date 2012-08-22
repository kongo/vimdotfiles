" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

let g:ackprg="ack-grep -H --nocolor --nogroup --column"
call pathogen#infect()
set nocompatible                  " Must come first because it changes other options.

let g:ackprg="ack-grep -H --nocolor --nogroup --column"

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

set history=1000

set t_Co=256
colorscheme darkspectrum
set background=dark

" UNCOMMENT TO USE
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c,%L\ %)%P


nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-s> :w<cr>

noremap <C-down> :bprev<CR> 
noremap <C-up> :bnext<CR> 

noremap <F8> :TagbarToggle<CR>

nmap <F5> <Esc>:BufExplorer<cr>

nnoremap <F2> :w<CR><Esc>
nnoremap <F3> :NERDTreeFind<cr>
