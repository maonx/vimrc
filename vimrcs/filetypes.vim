" markdown filetype
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" scss filetype
au BufRead,BufNewFile *.scss set ft=css syntax=css

" snippets filetype for css
au BufRead,BufNewFile css.snippets set ft=css syntax=css

au BufRead,BufNewFile *.scss let b:acmd_auto_encode=0

" ftl filetype
au BufRead,BufNewFile *.ftl set ft=html syntax=html shiftwidth=2 tabstop=2

" xml filetype
au BufRead,BufNewFile *.xml set shiftwidth=2 tabstop=2

" html filetype
au BufRead,BufNewFile *.html set shiftwidth=2 tabstop=2


