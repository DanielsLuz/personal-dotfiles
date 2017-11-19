"omnicomplete configuration
set omnifunc=csscomplete#CompleteCSS
autocmd BufNewFile,BufRead *.scss             set ft=scss.css
autocmd! BufWritePost * Neomake
