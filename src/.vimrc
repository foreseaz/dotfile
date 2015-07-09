" Auto load Plugins
execute pathogen#infect()

" Normal settings
set number
set history=100
set nocompatible
set ruler
set backspace=2
set ic
set ru
set confirm

" Appearance
set laststatus=2 " Always show status line
set t_Co=256
set background=dark
set title
colorscheme solarized
syntax on
filetype plugin indent on
set encoding=utf-8
set fileencodings=utf-8,cp950

" Searching
set ignorecase
set smartcase
set incsearch
set hlsearch

" Move swap and backup files to ~/.vim/tmp
set directory=~/.vim/tmp
set backupdir=~/.vim/tmp

" Use jk as <Esc> alternative
inoremap jk <Esc>
cnoremap jk <Esc>
snoremap jk <Esc>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Allow for cursor beyond last character
set virtualedit=onemore

" Map tab to autocompletion
inoremap <TAB> <C-x><C-n>

" Two-space indentation for some file types
autocmd FileType html,xml,ant,ruby,eruby,jsp,jspf setlocal shiftwidth=2 tabstop=2

" Four-space indentation for some file types
autocmd FileType swift setlocal shiftwidth=4 tabstop=4

" Access system clipboard
if has("unnamedplus")
   set clipboard=unnamedplus
else
   set clipboard=unnamed
endif

" Show syntax highlighting groups for word under cursor
nmap ,v :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Status Line
set laststatus=2
set statusline=%4*%<\%m%<[%f\%r%h%w]\ [%{&ff},%{&fileencoding},%Y]%=\[Position=%l,%v,%p%%]
 
"""""""""""""""""""""""""""""""""""""""""""""""""
"" Plugin: CtrlP
"""""""""""""""""""""""""""""""""""""""""""""""""
set runtimepath^=~/.vim/bundle/ctrlp.vim

"""""""""""""""""""""""""""""""""""""""""""""""""
"" Plugin: vim-less
"""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>


"""""""""""""""""""""""""""""""""""""""""""""""""
"" Plugin: NerdTree
"""""""""""""""""""""""""""""""""""""""""""""""""
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
