" Auto load Plugins
execute pathogen#infect()

syntax on
filetype plugin indent on
set nowrap
set ruler
set ru
set number

" Comma is easier than \
let mapleader=','

" Searching
set ignorecase
set smartcase
set incsearch
set hlsearch
" Keep search pattern at the center of the screen
nnoremap n nzz
nnoremap N Nzz

nnoremap <leader>s :%s/
vnoremap <leader>s :s/

" color theme setting
set laststatus=2 " Always show status line
syntax enable
set t_Co=256
set background=dark
colorscheme solarized 

" Coustom Mapping
inoremap jk <esc>
cnoremap jk <esc>
snoremap jk <esc>

" 4-space indentation
set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4


" Allow for cursor beyond last character
set virtualedit=onemore

" Access system clipboard
if has("unnamedplus")
   set clipboard=unnamedplus
else
   set clipboard=unnamed
endif

" Reselect visual block after indent/outdent 
vnoremap < <gv
vnoremap > >gv

" Move swap and backup files to ~/.vim/tmp
set directory=~/.vim/tmp
set backupdir=~/.vim/tmp

" Shift is hard
nnoremap ; :
vnoremap ; :

" Insert line outside insert mode
nmap <leader>o o<Esc>
nmap <leader>O O<Esc>

" No beep, no visual bell
set visualbell
set t_vb=

" Show syntax highlighting groups for word under cursor
nmap ,v :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""
"" File setting
"""""""""""""""""""""""""""""""""""""""""""""""""
" Two-space indentation for some file types
autocmd FileType html,xml,ant,ruby,eruby,jsp,jspf setlocal shiftwidth=2 tabstop=2
" Increase the indent for these HTML tags
let g:html_indent_inctags = "html,body,head,tbody" 

" Four-space indentation for some file types
autocmd FileType swift setlocal shiftwidth=4 tabstop=4

" Line wrap for plain text files
autocmd FileType text set wrap linebreak

" Associate .tld file to xml
autocmd BufRead,BufNewFile *.tld set filetype=xml

" Associate .md file to markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Associate .m file to objective-c
autocmd BufRead,BufNewFile *.m set filetype=objc

" Associate .plist file to xml
autocmd BufRead,BufNewFile *.plist set filetype=xml

" Associate .jspf file (JSP fragments) to JSP
autocmd BufRead,BufNewFile *.jspf set filetype=jsp

" Associate .i file (preprocessed .c files) to C
autocmd BufRead,BufNewFile *.i set filetype=c

" Associate ssh/config file to sshconfig
autocmd BufRead,BufNewFile */ssh/config set filetype=sshconfig

" Enable spell checking for markdown
autocmd FileType markdown setlocal spell

" Enable text wrapping for markdown
autocmd FileType markdown setlocal wrap

" Turn off indentation for access modifiers in C++
autocmd FileType cpp set cinoptions+=g0

" Syntax highlighting for pentadactylrc
autocmd BufRead,BufNewFile *pentadactylrc set filetype=vim

" Syntax highlighting for tmux.conf
autocmd BufRead,BufNewFile *tmux.conf set filetype=conf

"""""""""""""""""""""""""""""""""""""""""""""""""
"" Plugin: NerdTree
"""""""""""""""""""""""""""""""""""""""""""""""""
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <leader>m :NERDTreeToggle<CR>
let QuitOnOpen=1
let ChDirMode=2
let MinimalUI=1

"""""""""""""""""""""""""""""""""""""""""""""""""
"" Plugin: CtrlP
"""""""""""""""""""""""""""""""""""""""""""""""""
set runtimepath^=~/.vim/bundle/ctrlp.vim
nnoremap <leader>e :CtrlP<cr>
nnoremap <leader>n :tabnew<cr>:CtrlP<cr>
set wildignore+=*build/*


"""""""""""""""""""""""""""""""""""""""""""""""""
"" Plugin: tComment
"""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>c :TComment<cr>
vnoremap <leader>c :TComment<cr>


"----------------- Most Used -----------------
" Automatically append closing characters
inoremap {<cr>  {<cr>}<esc>O

" Next and previous tab page
nnoremap H :tabprevious<cr>
nnoremap L :tabnext<cr>

" Quit quickly
nnoremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>

" Select all text in current buffer
nnoremap <leader>a ggVG

" oo new line
nmap oo i<CR><Esc>
