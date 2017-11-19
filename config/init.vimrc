"Set vim config files path
let $MYVIMCFG = '$HOME/.config/nvim/config'
"Incremental search, jump as I type
set incsearch
syntax enable
"remap LEADER
let mapleader=","
"disable arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
"enabling the ctags
set tags=./tags;
set noswapfile
" Use ack instead of grep
set grepprg=ack
" Wildignores for ctrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.cabal-sandbox,.tmp
set wildmode=longest:full,full
"""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on
set showmatch		" Show matching brackets.
" set tabstop=4
" set shiftwidth=4
"set tab to 2 spaces rather than 4
set tabstop=2
set shiftwidth=2
set expandtab
set nowrap
set scrolloff=10
set number
set notimeout
set ttimeout
set ttimeoutlen=10
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" Global utils
Plugin 'radenling/vim-dispatch-neovim'
Plugin 'tpope/vim-dispatch'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
" Linting
Plugin 'neomake/neomake'
" Searching
Plugin 'mileszs/ack.vim'
" Some colorschemes
Plugin 'rafi/awesome-vim-colorschemes'
" Git utils
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
" Navigation
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
" Better buffers
Plugin 'itchyny/lightline.vim'
Plugin 'taohex/lightline-buffer'
" Rails plugins
Plugin 'tpope/vim-rails'
Plugin 'thoughtbot/vim-rspec'
Plugin 'slim-template/vim-slim'
" Autocompletion
Plugin 'Shougo/deoplete.nvim'
Plugin 'garbas/vim-snipmate'
Plugin 'mattn/emmet-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tomtom/tcomment_vim'
"Javascript plugins
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'posva/vim-vue'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'burnettk/vim-angular'
Plugin 'leafgarland/typescript-vim'
"Other languages
Plugin 'elixir-editors/vim-elixir'
call vundle#end()            " required
filetype plugin indent on    " required
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1
