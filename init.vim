" INIT config
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
set grepprg=ag\ --path-to-agignore\ ~/.ignore\ --nogroup\ --nocolor
" Wildignores for ctrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.cabal-sandbox,.tmp
set wildmode=longest:full,full

set path=.,src
set suffixesadd=.js,.vue

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
set rtp+=~/.fzf
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
Plugin 'airblade/vim-gitgutter'
" Navigation
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf.vim'
" Better buffers
Plugin 'itchyny/lightline.vim'
Plugin 'taohex/lightline-buffer'
" Autocompletion
Plugin 'Shougo/deoplete.nvim'
Plugin 'mattn/emmet-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tomtom/tcomment_vim'
"Javascript plugins
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'posva/vim-vue'
Plugin 'pangloss/vim-javascript'
call vundle#end()            " required
filetype plugin indent on    " required

"APPEARANCE SETTINGS
"Setting colorscheme
set background=dark
" set t_Co=256
colorscheme scheakur

"setting textwidth to 80
set textwidth=100
highlight ColorColumn ctermbg=lightblue
set colorcolumn=100
"CUSTOM MAPPINGS
"
"remap save shortcut
nnoremap <leader>w :w<CR>
nnoremap <leader>q :wa<CR>

"remap exit insert mode
ino jj <esc>
cno jj <c-c>
tnoremap jj <C-\><C-n>
tnoremap <C-k> <UP>
tnoremap <C-j> <DOWN>

"Useful mappings
""go to next and previous buffer
nnoremap <C-l> :bn<CR>
nnoremap <C-h> :bp<CR>

" Maps backspace to last buffer
nmap <BS> <C-^>

" Remaping K for search under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" QuickFix navigation
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

"map BufOnly command
map <leader>bo :BufOnly<CR>

"Remove all trailing whitespace by pressing F3
nnoremap <F3> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"set line numbers on
nmap <C-N><C-N> :set invnumber<CR>

"map \s to rename variable
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

"Set pastetoggle, keeps indentation
set pastetoggle=<F2>
nmap <Leader>m :NERDTreeToggle<CR>
nmap <Leader>n :NERDTreeFind<CR>
noremap <F9> :cclose<cr>
noremap <F10> :copen 40<cr>

" Remap H and L (top, bottom of screen to left and right end of line)
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

" Don't yank to default register when changing something
nnoremap c "xc
xnoremap c "xc

" After block yank and paste, move cursor to the end of operated text and don't override register
vnoremap y y`]
vnoremap p "_dP`]
nnoremap p p`]

" Don't cancel visual select when shifting
xnoremap <  <gv
xnoremap > >gv
" Reselect last-pasted text
nnoremap gp `[v`]
" Keep the cursor in place while joining lines
nnoremap J mzJ`z
" [S]plit line (sister to [J]oin lines) S is covered by cc.
" nnoremap S mzi<CR><ESC>`z
" Source (reload configuration)
nnoremap <silent> <F5> :source $MYVIMRC<CR>
" Toggle search highlight
nnoremap <silent> <F6> :set nohlsearch!<CR> :set nohlsearch?<CR>

"PLUGIN SETTINGS
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_vue_eslint_exe = $PWD .'/node_modules/.bin/eslint'
let g:deoplete#enable_at_startup = 1
autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

"deoplete

" deoplete configuration
let g:deoplete#enable_refresh_always=0
let g:deoplete#enable_smart_case=1

let g:deoplete#sources = {}
let g:deoplete#sources._ = ['buffer', 'tags']
let deoplete#tag#cache_limit_size = 5000000
" deoplete tab-complete
imap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" <C-h>, <BS>: close popup and delete backword char
inoremap <expr><C-h> deolete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"

"lightline

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden
"vim-airline configurations
set laststatus=2
set showtabline=2  " always show tabline
let g:lightline = {
      \ 'tabline': {
      \   'left': [ [ 'bufferinfo' ],
      \             [ 'separator' ],
      \             [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
      \   'right': [ [ 'close' ], ],
      \ },
      \ 'component_expand': {
      \   'buffercurrent': 'lightline#buffer#buffercurrent',
      \   'bufferbefore': 'lightline#buffer#bufferbefore',
      \   'bufferafter': 'lightline#buffer#bufferafter',
      \ },
      \ 'component_type': {
      \   'buffercurrent': 'tabsel',
      \   'bufferbefore': 'raw',
      \   'bufferafter': 'raw',
      \ },
      \ 'component_function': {
      \   'bufferinfo': 'lightline#buffer#bufferinfo',
      \ },
      \ 'component': {
      \   'separator': '',
      \ },
      \ }

"omnicomplete configuration
set omnifunc=csscomplete#CompleteCSS
autocmd BufNewFile,BufRead *.scss             set ft=scss.css
autocmd! BufWritePost * Neomake

"nerdtree configuration
"Toggle NERDTree
let g:NERDTreeWinSize=45

"fzf configuration
nnoremap <silent> <leader><space> :Files<CR>
nnoremap <silent> <leader>a :Buffers<CR>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

"emmet plugin, html and css
let g:user_emmet_leader_key='<C-X>'

"quickfix settings
au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

"Neovim configs
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
set clipboard+=unnamedplus
let g:syntastic_ignore_files = ['\.java$']
