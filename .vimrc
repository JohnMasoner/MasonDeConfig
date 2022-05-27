let mapleader=" "

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
Plug 'frazrepo/vim-rainbow'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'kiteco/vim-plugin'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python'  }
Plug 'Yggdroot/indentLine'
call plug#end()

" coc
let g:coc_disable_startup_warning = 1
let g:coc_global_extensions = ['coc-pyright', 'coc-lists', 'coc-json', 'coc-git']
" Map
map S :w<CR>
nnoremap <C-n> :noh<CR>
map K 5k zz
map J 5j zz
map R :source $MYVIMRC<CR>
" formate the code
let g:nestedtext_folding = 1
" Fzf
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
nnoremap <C-f> :Files<CR>
nnoremap <C-e> :Buffers<CR>
let g:fzf_action = { 'ctrl-e': 'edit'  }

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
"set signcolumn=number
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
