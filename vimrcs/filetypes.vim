" markdown filetype
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" scss filetype
au BufRead,BufNewFile *.scss set ft=css syntax=css

" snippets filetype for css
au BufRead,BufNewFile css.snippets set ft=css syntax=css

au BufRead,BufNewFile *.scss let b:acmd_auto_encode=0



