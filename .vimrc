let mapleader=" "
set number
set relativenumber

"syntax on
set showmode
set encoding=utf-8
set autoindent
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set showcmd

set hidden
" cursor line
set cursorline

set wildmenu

" match {[(
set showmatch

" set highlight search
set hlsearch
set incsearch
set ignorecase
set smartcase
set cul


call plug#begin()
Plug 'kalekundert/vim-nestedtext' " high light the code for the nest3.0 format
Plug 'Konfekt/FastFold' " the nestedtext delopy
Plug 'chiel92/vim-autoformat' " auto-format the code
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  } " The plug for better go
Plug 'wakatime/vim-wakatime' "wakatim
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'kiteco/vim-plugin'
Plug 'Yggdroot/indentLine'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python'  }
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'frazrepo/vim-rainbow'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'zxqfl/tabnine-vim'
Plug 'vim-airline/vim-airline'
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
call plug#end()
" formate the code
let g:nestedtext_folding = 1
"autocmd BufNewFile,BufRead *.py set filetype=nestedtext
" FastFold
"nmap zuz <Plug>(FastFoldUpdate)
"let g:fastfold_savehook = 0
"let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
"let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
"autocmd FileType python setlocal foldmethod=indent
"" indent line
let g:indentLine_defaultGroup = 'SpecialKey'
" Rainbow
let g:rainbow_active = 1
" Map
map S :w<CR>
map K 5k zz
map J 5j zz
map R :source $MYVIMRC<CR>
" Kite
let g:kite_auto_complete=0
set completeopt+=preview
autocmd CompleteDone * if !pumvisible() | pclose
set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2  " always display the status line
" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Tagbar
nmap <F8> :TagbarToggle<CR>

" pydocsting
let g:pydocstring_formatter = 'google'
let g:pydocstring_ignore_init = 1
nmap <C-d> <Plug>(pydocstring)
