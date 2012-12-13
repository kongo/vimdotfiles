" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

call pathogen#infect()

set nocompatible                  " Must come first because it changes other options.

let g:ackprg="ack-grep -H --nocolor --nogroup --column --smart-case"
let Grep_Default_Options='-i'
let Grep_Skip_Dirs='tmp log'

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = ''

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
set directory=$HOME/.vim/tmp//,.    " Keep swap files in one location

set history=1000

set updatetime=100

" allow folding but don't fold everything by default
set foldlevel=99
set foldenable
set foldmethod=syntax

set t_Co=256
colorscheme aldmeris
set background=dark

" UNCOMMENT TO USE
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c,%L\ %)%P

set cursorline

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-s> :w<cr>

noremap <C-down> :bprev<CR> 
noremap <C-up> :bnext<CR> 
noremap <C-S-Tab> :bprev<CR> 
noremap <C-Tab> :bnext<CR> 

noremap <F8> :TagbarToggle<CR>

nmap <silent> <F5> <Esc>:BufExplorer<cr>
nmap <silent> <C-b> :LustyJuggler<CR>
nmap <silent> <C-n> :noh<CR>

nnoremap <F2> :w<CR><Esc>
nnoremap <silent> <F6> :NERDTreeFind<cr>
nnoremap <silent> <F7> :NERDTreeToggle<cr>

nmap <C-A> za

map <silent> <C-\> :TComment<cr>
nmap <C-S-f> :Rgrep<Space>

" autocomplete on C-Space
imap <C-Space> <C-n>

" in visual mode d deletes without putting to a buffer
vmap d "_x

" in visual mode don't remove selection after indenting lines
vmap > >gv
vmap < <gv

" map <F3> and <S-F3> to jump between locations in a quickfix list, or
" " differences if in window in diff mode
nnoremap <expr> <silent> <F3>   (&diff ? "]c" : ":cnext\<CR>")
nnoremap <expr> <silent> <S-F3> (&diff ? "[c" : ":cprev\<CR>")

" Space is easier way to get to the command line
nnoremap <Space> :

" in insert mode ctrl+backspace deletes previous word
imap <C-BS> <C-W>

" in normal mode Enter inserts a blank line under cursor
nnoremap <CR> m`o<Esc>``

" in normal mode S-Enter inserts a blank line above cursor
nnoremap <S-Enter> m`O<Esc>``

" in insert mode C-Enter inserts a new line (emulating Enter keypress) and
" goes to that line
imap <C-CR> <Esc>A<CR>

autocmd BufLeave * silent! wall
au BufRead,BufNewFile *.hamlc set ft=haml
