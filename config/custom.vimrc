"remap save shortcut
nnoremap <leader>ww :w<CR>
nnoremap <leader>wa :wa<CR>
"remap exit insert mode
ino jj <esc>
cno jj <c-c>
"Useful mappings
""go to next and previous buffer
nnoremap <C-l> :bn<CR>
nnoremap <C-h> :bp<CR>
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
map <F1> :NERDTreeToggle<CR>
noremap <F9> :cclose<cr>
noremap <F10> :copen 40<cr>
" RSpec.vim mapping
map <Leader>ra :call RunAllSpecs()<CR>
map <Leader>rs :call RunCurrentSpecFile()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>rn :call RunNearestSpec()<CR>
"Bind CtrlPBuffer key and configs
map <C-b> :CtrlPBuffer<CR>
"CSS files functions
nnoremap <leader>d :call JumpToSCSS()<CR>
nnoremap <leader>c :call JumpToCSS()<CR>
" Remap H and L (top, bottom of screen to left and right end of line)
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_
