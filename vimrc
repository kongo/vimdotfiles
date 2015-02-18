" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

call pathogen#infect()
call pathogen#helptags()

" let g:Powerline_symbols = 'fancy'

source ~/.vim/bundle/snipmate-snippets/support_functions.vim

set nocompatible                  " Must come first because it changes other options.

" let g:ackprg="ack-grep -H --nocolor --nogroup --column --smart-case"
" ag = silver searcher
let g:ackprg="ag --nocolor --nogroup --column --smart-case"
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
colorscheme smyck
set background=dark
set linespace=1

set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=\ %f%m%r%h%w\ \ \ %{fugitive#statusline()}%=\ %{v:register}\ \ %([\ Line:%l\/%L\ \ Column:%v\ ]\ \ [\ %p%%\ ]\ %)

" set cursorline

set winheight=30
set winwidth=80

set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" Connect the default register with the system clipboard
set clipboard=unnamedplus

nnoremap j gj
nnoremap k gk

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

noremap <C-S-Tab> :tabprevious<CR> 
noremap <C-Tab> :tabnext<CR> 

noremap <F8> :TagbarOpenAutoClose<CR>gg/

nmap <silent> <C-b> :BufExplorer<CR>
nmap <silent> <C-n> :NERDTreeToggle<CR>

nnoremap <F2> :w<CR><Esc>
nnoremap <silent> <F6> :NERDTreeFind<cr>
" Use <C-n> instead!
" nnoremap <silent> <F7> :NERDTreeToggle<cr>
nnoremap <silent> <Leader>n :NERDTreeToggle<cr>
nnoremap <silent> <Leader>t :TagbarToggle<cr>

nmap <C-A> za

imap <C-c> <Esc>
vmap <C-c> <Esc>
cmap <C-c> <Esc>

imap <C-x> <Esc>
vmap <C-x> <Esc>
cmap <C-x> <Esc>

map <silent> <C-\> :TComment<cr>

map <C-f> :Ack<Space>
map <C-A-f> :RgrepAdd<Space>

" autocomplete on C-Space
imap <C-Space> <C-n>

" useful to jump out of complimented parenthesis or brackets
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

imap <C-b> <C-r>+
imap <C-e> <C-r>+
cmap <C-e> <C-r>+

" in normal mode Enter inserts a blank line under cursor
nnoremap <C-CR> m`o<Esc>``

" in normal mode S-Enter inserts a blank line above cursor
nnoremap <S-CR> m`O<Esc>``

noremap - _
noremap _ -

" in insert mode C-Enter inserts a new line (emulating Enter keypress) and
" goes to that line
imap <C-CR> <Esc>A<CR>

nmap Y y$

nmap <C-x> "_d
vmap <C-x> "_d

" add trailing comma - convenient when adding a method to a JS object
map <Leader>, mxA,<Esc>`x
imap <Leader>, <Esc>mxA,<Esc>`xa

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
map <leader>rn :call RenameFile()<cr>

map <leader>rd :redraw!<CR>

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

" Edit vimrc
map <Leader>ev :tabedit $MYVIMRC<CR>
" Source vimrc
map <Leader>sv :source $MYVIMRC<CR>

" Unfold all foldings
map <Leader>uf :set foldlevel=99<CR>

map <Leader>bd :bd<CR>

vmap <C-Insert> "+y
nmap <C-Insert> "+y
nmap <S-Insert> "+P

map <M-[> [m
map <M-]> ]m

map <M-p> :tag 
map <M-c> :bd<CR>

map <silent> mm :noh<CR>
map <silent> cc :cclose<CR>

map <Leader>er :tabedit config/routes.rb<CR>
map <Leader>es :tabedit db/schema.rb<CR>
map <Leader>eg :tabedit Gemfile<CR>

map <silent> <Leader>dd :!meld . &<CR><CR>

map <A-j> :tabm -1<CR>
map <A-k> :tabm +1<CR>

" continious windows
noremap <silent> <leader>sb :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

map <Leader>yf :let @+ = expand("%")<CR>

function! Strip(input_string)
  return substitute(a:input_string, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction

function! EscapeSelectionToXReg()
  let @x = escape(Strip(@*), ' .()[]^+*?\')
endfunction
vmap <C-f> :<C-u>call EscapeSelectionToXReg()<cr>gv:<Backspace><Backspace><Backspace><Backspace><Backspace>Ack <Space><C-R>x


" returns true if is NERDTree open/active
function! rc:isNTOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" returns true if focused window is NERDTree window
function! rc:isNTFocused()
  return -1 != match(expand('%'), 'NERD_Tree')
endfunction

function! rc:syncTree()
  if &modifiable && rc:isNTOpen() && !rc:isNTFocused() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction
autocmd BufEnter * call rc:syncTree()
" autocmd TabEnter * redraw!

" let g:syntastic_enable_signs=1

map <A-1> 1gt
map <A-2> 2gt
map <A-3> 3gt
map <A-4> 4gt
map <A-5> 5gt
map <A-6> 6gt
map <A-7> 7gt
map <A-8> 8gt
map <silent> <A-9> :tablast<CR>
" map <silent> <C-A-w> :tabclose<CR>

imap <A-1> <Esc>1gt
imap <A-2> <Esc>2gt
imap <A-3> <Esc>3gt
imap <A-4> <Esc>4gt
imap <A-5> <Esc>5gt
imap <A-6> <Esc>6gt
imap <A-7> <Esc>7gt
imap <A-8> <Esc>8gt
imap <silent> <A-9> <Esc>:tablast<CR>
" inoremap <silent> <C-A-w> <Esc>:tabclose<CR>

nnoremap <C-S-t> :tabnew<CR>
inoremap <C-A-t> <Esc>:tabnew<CR>
" inoremap <C-A-w> <Esc>:tabclose<CR>


fu! SaveSess() 
  execute 'mksession! ' . getcwd() . '/.session.vim' 
endfunction 

fu! RestoreSess() 
if filereadable(getcwd() . '/.session.vim') 
   execute 'so ' . getcwd() . '/.session.vim' 
   if bufexists(1) 
     for l in range(1, bufnr('$')) 
       if bufwinnr(l) == -1 
        exec 'sbuffer ' . l 
       endif 
     endfor 
   endif 
endif 
syntax on 
endfunction 

" autocmd VimLeave * call SaveSess() 
" autocmd VimEnter * call RestoreSess()

" let g:tagbar_type_javascript = {
"     \ 'ctagsbin' : '/usr/local/bin/jsctags'
" \ }


" Quickfix window - open in new tab
nmap <c-x>t <c-w><cr><c-w>T


" CtrlP custom matcher
"
" let g:path_to_matcher = "matcher"
" 
" let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files . -co --exclude-standard']
" 
" let g:ctrlp_match_func = { 'match': 'GoodMatch' }
" 
" function! GoodMatch(items, str, limit, mmode, ispath, crfile, regex)
" 
"   " Create a cache file if not yet exists
"   let cachefile = ctrlp#utils#cachedir().'/matcher.cache'
"   if !( filereadable(cachefile) && a:items == readfile(cachefile) )
"     call writefile(a:items, cachefile)
"   endif
"   if !filereadable(cachefile)
"     return []
"   endif
" 
"   " a:mmode is currently ignored. In the future, we should probably do
"   " something about that. the matcher behaves like "full-line".
"   let cmd = g:path_to_matcher.' --limit '.a:limit.' --manifest '.cachefile.' '
"   if !( exists('g:ctrlp_dotfiles') && g:ctrlp_dotfiles )
"     let cmd = cmd.'--no-dotfiles '
"   endif
"   let cmd = cmd.a:str
" 
"   return split(system(cmd), "\n")
" 
" endfunction
set wildignore+=*/doc/*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip


" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif


map <silent> <Leader>th :Tab/\w:\zs/l0l1<CR>


nnoremap <silent> zj :call NextClosedFold('j')<cr>
nnoremap <silent> zk :call NextClosedFold('k')<cr>
function! NextClosedFold(dir)
    let cmd = 'norm!z' . a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction
