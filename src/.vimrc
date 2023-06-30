set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'ervandew/supertab'
Plugin 'tomtom/tcomment_vim'
Plugin 'alvan/vim-closetag'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" Solve confilt of TAB: snipmate, supertab
let g:UltiSnipsExpandTrigger="<tab>"

syntax on
filetype plugin indent on
set nowrap
set ruler
set ru
set number

let g:closetag_filenames = "*.html, *.xhtml, *.phtml, *html.erb"

" Comma is easier than \
let mapleader=','

" Hey man, your code is too long for one line
if exists('+colorcolumn')
    set colorcolumn=80
  else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

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

" Next and Previous Tab
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l>   :tabnext<CR>
inoremap <C-h> <Esc>:tabprevious<CR>i
inoremap <C-l>   <Esc>:tabnext<CR>i

" color theme setting
set laststatus=2 " Always show status line
syntax enable
set t_Co=256
set background=dark
colorscheme solarized
let g:molokai_Original=1
" let g:rehash256=1
" colorscheme molokai

" Airlinebar config
let g:airline_theme='papercolor'
let g:airline_powerline_fonts=1
set laststatus=2

" Coustom Mapping
inoremap jk <esc>
cnoremap jk <esc>
snoremap jk <esc>

" 4-space indentation
set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2


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
autocmd BufNewFile,BufRead *.html.erb set filetype=html
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
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'


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

""""""""""""""""""""""""""""""""""""""""
" BACKUP / TMP FILES
""""""""""""""""""""""""""""""""""""""""
if isdirectory($HOME . '/.vim/backup') == 0
    :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" " If you have .vim-swap in the current directory, it'll use that.
" " Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
    :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
    " undofile - This allows you to use undos after exiting and restarting
    " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
    " :help undo-persistence
    " This is only present in 7.3+
    if isdirectory($HOME . '/.vim/undo') == 0
        :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
    endif
    set undodir=./.vim-undo//
    set undodir+=~/.vim/undo//
    set undofile
endif

" if (has("termguicolors"))
"  set termguicolors
" endif
