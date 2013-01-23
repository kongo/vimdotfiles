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
set noswapfile
set directory=$HOME/.vim/tmp//,.    " Keep swap files in one location

set history=1000
set autoread
set updatetime=100

" allow folding but don't fold everything by default
set foldlevel=99
set foldenable
set foldmethod=syntax

set t_Co=256
colorscheme level28
set background=dark

set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=\ %f%m%r%h%w\ \ \ %{fugitive#statusline()}%=\ %{v:register}\ \ %([\ Line:%l\/%L\ \ Column:%v\ ]\ \ [\ %p%%\ ]\ %)

set cursorline

set winheight=30
set winwidth=80

set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" Connect the default register with the system clipboard
set clipboard=unnamedplus

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-s> :w<cr>

noremap <C-down> :bprev<CR> 
noremap <C-up> :bnext<CR> 
noremap <C-S-Tab> :bprev<CR> 
noremap <C-Tab> :bnext<CR> 

noremap <F8> :TagbarOpenAutoClose<CR>gg/

nmap <silent> <F5> <Esc>:BufExplorer<cr>
nmap <silent> <C-b> :BufExplorer<CR>
nmap <silent> <C-n> :noh<CR>

nnoremap <F2> :w<CR><Esc>
nnoremap <silent> <F6> :NERDTreeFind<cr>
nnoremap <silent> <F7> :NERDTreeToggle<cr>

nmap <C-A> za

map <silent> <C-\> :TComment<cr>
nmap <C-S-f> :Rgrep<Space>

" autocomplete on C-Space
imap <C-Space> <C-n>

" useful to jump out of supplemented parenthesis or brackets
imap <C-L> <End>

" in visual mode d deletes without putting to a buffer
" vmap d "_x

" in visual mode don't remove selection after indenting lines
vmap > >gv
vmap < <gv

" map <F3> and <S-F3> to jump between locations in a quickfix list, or
" " differences if in window in diff mode
nnoremap <expr> <silent> <F3>   (&diff ? "]c" : ":cnext\<CR>")
nnoremap <expr> <silent> <S-F3> (&diff ? "[c" : ":cprev\<CR>")

" Space is easier way to get to the command line
nnoremap <Space> :
vnoremap <Space> :

" in insert mode ctrl+backspace deletes previous word
imap <C-BS> <C-W>

" in normal mode Enter inserts a blank line under cursor
nnoremap <C-CR> m`o<Esc>``

" in normal mode S-Enter inserts a blank line above cursor
nnoremap <S-CR> m`O<Esc>``

" in insert mode C-Enter inserts a new line (emulating Enter keypress) and
" goes to that line
imap <C-CR> <Esc>A<CR>

map <C-Z> za

nmap Y y$

autocmd BufLeave * silent! wall
au BufRead,BufNewFile *.hamlc set ft=haml

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), "file")
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>r :call RenameFile()<cr>

"visual search mappings
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

function! NERDTreeWinNum()
  if exists("t:NERDTreeBufName")
    return bufwinnr(t:NERDTreeBufName)
  else
    return -1
  endif
endfunction

function! SyncTree()
  if NERDTreeWinNum() != -1
    exec ":NERDTreeFind"
    :normal! <CR>
  endif
endfunction
" autocmd BufEnter * call SyncTree()
" map <C-c> :<C-u>call SyncTree()<CR>

" Edit vimrc
map <Leader>ev :e $MYVIMRC<CR>
" Source vimrc
map <Leader>sv :source $MYVIMRC<CR>

" Unfold all foldings
map <Leader>uf :set foldlevel=99<CR>

map <Leader>bd :bd<CR>

imap jj <Esc>

vmap <C-Insert> "+y
nmap <C-Insert> "+y
nmap <S-Insert> "+P

function! EscapeSelectionToXReg()
  let @x = escape(@*, ' .()[]^+*?\')
endfunction
vmap <C-S-f> :<C-u>call EscapeSelectionToXReg()<cr>gv:<Backspace><Backspace><Backspace><Backspace><Backspace>Rgrep<Space><C-R>x

