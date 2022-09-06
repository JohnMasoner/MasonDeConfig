let mapleader=" "

set relativenumber
filetype off

"syntax on
set showmode
set encoding=utf-8
set autoindent
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set showcmd

set foldmethod=manual

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
Plug '~/.vim/plugged/coc.nvim'
Plug 'majutsushi/tagbar'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
"Plug 'puremourning/vimspector'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
"Plug '~/.fzf'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'frazrepo/vim-rainbow'

Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'nvie/vim-flake8'
Plug 'psf/black', { 'branch': 'stable' }
"Plug 'fisadev/vim-isort'
"let g:vim_isort_map = '<C-i>'

Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'kiteco/vim-plugin'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python'  }
Plug 'Yggdroot/indentLine'

Plug 'https://github.com/sillybun/autoformatpythonstatement', {'do': './install.sh'}
let g:autoformatpython_insertmode = 0

Plug 'sillybun/vim-repl'
let g:repl_program = {
            \   'python': 'ipython',
            \   'default': 'zsh',
            \   'r': 'R',
            \   'lua': 'lua',
            \   }
let g:repl_predefine_python = {
            \   'numpy': 'import numpy as np',
            \   'matplotlib': 'from matplotlib import pyplot as plt'
            \   }
let g:repl_cursor_down = 1
let g:repl_python_automerge = 1
let g:repl_ipython_version = '7'
nnoremap <leader>r :REPLToggle<Cr>
autocmd Filetype python nnoremap <F12> <Esc>:REPLDebugStopAtCurrentLine<Cr>
autocmd Filetype python nnoremap <F10> <Esc>:REPLPDBN<Cr>
autocmd Filetype python nnoremap <F11> <Esc>:REPLPDBS<Cr>
let g:repl_position = 3

call plug#end()

" coc
let g:coc_disable_startup_warning = 1
let g:coc_global_extensions = ['coc-pyright', 'coc-lists', 'coc-json', 'coc-git', 'coc-marketplace']
" Map
map S :w<CR>
map K 5k zz
map J 5j zz
map R :source $MYVIMRC<CR>
" formate the code
let g:nestedtext_folding = 1
" Fzf
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
nnoremap <C-f> :Files<CR>
nnoremap <C-e> :Buffers<CR>
let g:fzf_action = {
                    \ 'ctrl-e': 'edit',
                    \ 'ctrl-b': 'tab split',
                    \ 'ctrl-v': 'vsplit'}
"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true  }  }

" NERDTree
autocmd VimEnter * NERDTree | wincmd p
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
" Tagbar
nmap <F8> :TagbarToggle<CR>
" pydocsting
let g:pydocstring_formatter = 'google'
let g:pydocstring_ignore_init = 1
nmap <C-d> <Plug>(pydocstring)

" coc
"set signcolumn=yes
set updatetime=300
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> B :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
      call CocActionAsync('doHover')
  else
      call feedkeys('K', 'in')
  endif
endfunction

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
