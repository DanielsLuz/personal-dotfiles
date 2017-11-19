" deoplete configuration
let g:deoplete#enable_refresh_always=0
let g:deoplete#enable_smart_case=1

let g:deoplete#sources = {}
let g:deoplete#sources._ = ['buffer', 'tag']
let deoplete#tag#cache_limit_size = 5000000
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" <C-h>, <BS>: close popup and delete backword char
inoremap <expr><C-h> deolete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"
