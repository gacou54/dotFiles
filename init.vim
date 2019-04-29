set nocompatible            " Disable compatibility to old-time vi
set showmatch               " Show matching brackets.
set mouse=n                 " middle-click paste with mouse
set hlsearch                " highlight search results
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=79                   " set an 79 column border for good coding style

" Custom indentation
autocmd Filetype haskell setlocal ts=2 sw=2 expandtab
autocmd Filetype html setlocal ts=2 sw=2 expandtab

call plug#begin('~/.local/share/nvim/plugged')

" Vim-Commentary
Plug 'https://github.com/tpope/vim-commentary'

" Lightline
Plug 'itchyny/lightline.vim'

" Fuzzy finder
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" NerdTree
Plug 'scrooloose/nerdtree'

" Deoplete (autocompletion)
Plug 'Shougo/deoplete.nvim',  { 'do': ':UpdateRemotePlugins' }

" Go
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'zchee/deoplete-go', { 'do': 'make'}

" Python
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }
Plug 'stsewd/isort.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'

" Haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'alx741/vim-hindent'
Plug 'eagletmt/neco-ghc'

" Theme
Plug 'kaicataldo/material.vim'

call plug#end()

" Lightline
set laststatus=2


" Deoplete
let g:deoplete#enable_at_startup = 1
set completeopt-=preview

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"


" Color and Theme
set background=dark
set termguicolors
colorscheme material 

let g:material_theme_style = 'dark'
let g:lightline = { 'colorscheme': 'material_vim' }


" NerdTree
nnoremap <C-n> :NERDTreeToggle<CR>


" Custom commands
command W execute 'w'
command Q execute 'q'
command WQ execute 'wq'
command Wq execute 'wq'

command P execute 'w |!python %'
command G execute 'w |!go run %'

" Python
map <C-f> :call yapf#YAPF()<cr>
let g:isort_command = 'isort'

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/home/gacou54/anaconda3/bin/python3'
let g:vim_isort_python_version = '/home/gacou54/anaconda3/bin/python3'

" Go
let g:deoplete#sources#go#gocode_binary = '~/go/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" Haskell
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:hindent_command = "stack exec -- hindent"

" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0

" neco-ghc
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc 
let g:necoghc_enable_detailed_browse = 1
