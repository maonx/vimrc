" markdown filetype
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" scss filetype
au BufRead,BufNewFile *.scss set ft=css syntax=css

" snippets filetype for css
au BufRead,BufNewFile css.snippets set ft=css syntax=css

au BufRead,BufNewFile *.scss let b:acmd_auto_encode=0

" ftl filetype
au BufRead,BufNewFile *.ftl set ft=html syntax=html shiftwidth=2 tabstop=2

autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=80 cc=80
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
