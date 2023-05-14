" __     ___
" \ \   / (_)_ __ ___   -- cherry-noize
"  \ \ / /| | '_ ` _ \  -- https://github.com/cherrynoize
"   \ V / | | | | | | | -- #vimnotrsi
"    \_/  |_|_| |_| |_| .rc
"   Vim configuration file
" <Esc> is bind to the Alt key if AltSendsEscape is set to true in .Xresources
" using <M-key> instead of <Esc>key still works e.g: in nvim but may not vim

" If using fish revert shell to sh
if &shell =~# 'fish$'
    set shell=sh
endif

" Blamer
let g:blamer_enabled = 1

" Appearance

" Welcome message
"echo "Welcome back," $USER

" Syntax highlighting
syntax on
" Tabline
"hi TabLineFill ctermfg=LightBlue ctermbg=DarkBlue
"hi TabLine ctermfg=Black ctermbg=White
" Window counter per tab
"hi Title ctermfg=Black

" Switch between hybrid/absolute line numbers with different modes
:set number
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END

" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

" Selection

" Select with Shift + cursor keys
set keymodel=startsel
set keymodel=startsel,stopsel

" Behaviour

" Make cw behave like it should
set cpoptions-=_

" Search defaults to case sensitive if pattern contains
"
"
" an uppercase character
set ignorecase smartcase

" Disable search highlighting
set nohlsearch

" Backspace, Del, C-w and C-u behavior
set backspace=indent,eol,start " Run over pretty much everything.
" Set which characters wrap around lines
set whichwrap+=<,>,[,]

" Show tab as number of spaces
"set tabstop=4
" Normal mode '>' number of spaces
"set shiftwidth=4
" Tab indents with spaces
set expandtab

" Indentation

" Auto-detect filetype and load plugin and indent files 
filetype plugin indent on

" Define modes
autocmd FileType sh setlocal shiftwidth=2 tabstop=2
autocmd FileType fish setlocal shiftwidth=2 tabstop=2
autocmd FileType rasi setlocal shiftwidth=2 tabstop=2
autocmd FileType c setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal shiftwidth=3 tabstop=3
autocmd FileType lua setlocal shiftwidth=3 tabstop=3

" Configuration
nnoremap <Esc>R <Cmd>:so $MYVIMRC<CR>

" Edit

" Undo
inoremap <C-Z> <Cmd>:undo<CR>

" Rebind to delete instead of cut
nnoremap x i<Del><Esc>l
" Re-emulate original x keybinding (cuts char)
nnoremap <Esc>x vd
" Paste on newline (after current line)
nnoremap <C-p> o<Esc>P

" Insert single character
nnoremap <Esc>i i <Esc>r

" Insert whitespace
nnoremap <C-Space> i<Space><Esc>l
 
" Insert backspace
nnoremap <BS> i<BS><Esc>l

" Copy word
inoremap <C-c> <Esc>yiwea
vnoremap <C-c> <Esc>yiwea

" Delete till the beginning of a word
" (<C+H> is <C+BS>)
nnoremap <C-H> db
inoremap <C-H> <Esc>dbxi

" Delete till the end of a word
nnoremap <C-Del> de
inoremap <C-Del> <Esc>ldei
 
" Duplicate line
inoremap <C-d> <Cmd>:copy+0<CR>
noremap <Esc>d <Cmd>:copy+0<CR>

" Append newline after current line
nnoremap <CR> o<Esc>
" Insert newline character at cursor
nnoremap <Esc><CR> i<CR><Esc>
" Delete from last newline up to cursor
nnoremap <Esc>o d0i<BS><Esc>l

" Append to all selected lines
vnoremap A :s/$/

" Search and replace

" Toggle search highlighting and move to next match
nnoremap <F3> :set hlsearch!<CR>

" Indent

" Align on equals sign
vnoremap <Esc>= :! column -t -s= -o=<CR>
nnoremap <Esc>= Vk:! column -t -s= -o=<CR>2$

" Buffer navigation

" Move to beginning/end of paragraph
noremap è {
noremap ò }

" Buffer editing

" Open buffer command menu
nnoremap <F12> :buffers<CR>:buffer<Space>

" Workspace flow

" Move between windows
nnoremap <Esc>h <C-w>h
nnoremap <Esc>j <C-w>j
nnoremap <Esc>k <C-w>k
nnoremap <Esc>l <C-w>l

" Open new empty tab
nnoremap <Esc>t :tabe<CR>
" Move to next tab
nnoremap <Esc><Tab> gt
inoremap <Esc><Tab> <Cmd>gt<CR>
" Move to previous tab
nnoremap <S-Tab> gT
inoremap <S-Tab> <Cmd>gT<CR>
" Close current window
nnoremap <Esc>C :clo<CR>
" Close tab
nnoremap <Esc>W :tabc<CR>

" Session and file handling

" Write all files
nnoremap <C-s> :w!<CR>
inoremap <C-s> <Cmd>:w!<CR>
" Write all and save default session
nnoremap <Esc>s :wa!<CR>:mksession! ~/.vim/sessions/main.vim<CR>
" Save and close all files
nnoremap <Esc>q :xa<CR>
nnoremap <Esc>Q :q!<CR>

" vim: sw=2:ts=2
