set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" What I installed
Plugin 'scrooloose/nerdtree'
" Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
" Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-commentary'
Plugin 'airblade/vim-gitgutter'
Plugin 'valloric/youcompleteme'
Plugin 'bling/vim-airline'
Plugin 'godlygeek/tabular'
Plugin 'vim-airline/vim-airline-themes'

" For haskell
Plugin 'eagletmt/ghc-mod'
Plugin 'eagletmt/neco-ghc'
Plugin 'neovimhaskell/haskell-vim'

" For latex
Plugin 'vim-latex/vim-latex'

" For elm
Plugin 'ElmCast/elm-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set number
set mouse=v
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
let g:airline_theme='minimalist'

nnoremap o o<Esc>^Da
nnoremap O O<Esc>^Da


" I have bug in tmux, I try this line :
" set term=xterm-256color
set background=dark
set t_Co=256


" Navigating througth panes
" -------------------------------------------------------------------------
let g:BASH_Ctrl_j='off'

nnoremap <C-l> <c-w>l
nnoremap <C-h> <c-w>h
nnoremap <C-k> <c-w>k
nnoremap <C-j> <c-w>j

nnoremap <Right> <c-w>l
nnoremap <Left> <c-w>h
nnoremap <Up> <c-w>k
nnoremap <Down> <c-w>j

set splitbelow
set splitright
" -------------------------------------------------------------------------


" youcompleteme
" -------------------------------------------------------------------------
let g:ycm_extra_conf_globlist=['~/.vim/*']
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_min_num__of_chars_for_completion=1
let g:ycm_auto_trigger=1

" Python
let g:ycm_python_binary_path='python'

" Others
let g:ycm_semantic_triggers = {
     \ 'haskell' : ['.'],
     \ 'elm' : ['.'],
     \ }

let g:ycm_error_symbol='✗'
let g:ycm_warning_symbol='▲'
" -------------------------------------------------------------------------


" NerdTree
" -------------------------------------------------------------------------
map <C-n> :NERDTreeToggle<CR>
" -------------------------------------------------------------------------


" vim-latex config
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat="pdf"

" Remove trailing whitespace
augroup remove_trailing_whitespace
    autocmd!
    autocmd BufWritePre * :%s/\s\+$//e
augroup end

" Redefine some command
cmap W w

" Indent for file type
autocmd FileType tex setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType haskell setlocal shiftwidth=2 tabstop=2
autocmd FileType elm setlocal shiftwidth=2 tabstop=2
autocmd FileType cpp setlocal shiftwidth=2 tabstop=2
autocmd FileType c setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" To compile and execute haskell file
command E execute "w \|!rm main; clear; ghc -v1 -O % -o main; ./main"
command H execute "w \|!clear; ghc -v1 -O % -o main;"
command S execute "w \|!clear; stack build"
command I execute "w \|!clear; stack install"

" for python script
command P execute "w \|!clear; python %"
"
" for R script
command R execute "w \|!clear; Rscript %"

" for latex
command L execute "w \|!clear; pdflatex %"

" For markdown
command M execute "w \|!pandoc --from markdown --to html % -o output.html"

" For elm
command Elm execute "w \|!elm make %"

" For electron
command Electron execute "w \|!electron main.js"




augroup vimrc_todo
    au!
    au Syntax * syn match MyTodo /\v<(FIXME|NOTE|TODO|OPTIMIZE|XXX|BUG|HACK|TEMP|REVIEW)\v/
          \ containedin=.*Comment,vimCommentTitle
augroup END
hi def link MyTodo Todo


" for the slow things with 'O'
:set ttimeoutlen=100


