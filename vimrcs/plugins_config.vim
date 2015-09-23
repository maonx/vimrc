" YankRing"{{{
let g:yankring_history_dir = '~/.vim/temp_dirs/'
nnoremap <silent> <leader>h :YRShow<CR>
let g:yankring_replace_n_nkey = ""
let g:yankring_replace_n_pkey = ""
"}}}
" CTRL-P"{{{
let g:ctrlp_working_path_mode = 1

let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"}}}
" Nerd Tree"{{{
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>
"}}}
" vim-airline config (force color)"{{{
let g:airline_theme="luna"
let g:airline_powerline_fonts = 1
" turn on tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" switch buffers
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>
" turn off whitespace
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
if WINDOWS()
    set guifont=Consolas\ for\ Powerline\ FixedD:h11
    let g:Powerline_symbols="fancy"
    let g:airline_symbols = {}
    let g:airline_left_sep = "\u2b80" "use double quotes here
    let g:airline_left_alt_sep = "\u2b81"
    let g:airline_right_sep = "\u2b82"
    let g:airline_right_alt_sep = "\u2b83"
    let g:airline_symbols.branch = "\u2b60"
    let g:airline_symbols.readonly = "\u2b64"
    let g:airline_symbols.linenr = "\u2b61"


    let g:airline#extensions#tabline#left_sep = "\u2b80"
    let g:airline#extensions#tabline#left_alt_sep = "\u2b81"
endif "}}}
" Syntastic (syntax checker)"{{{
let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_javascript_checkers = ['jshint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Custom CoffeeScript SyntasticCheck
func! SyntasticCheckCoffeescript()
    let l:filename = substitute(expand("%:p"), '\(\w\+\)\.coffee', '.coffee.\1.js', '')
    execute "e " . l:filename
    execute "SyntasticCheck"
    execute "Errors"
endfunc
nnoremap <silent> <leader>l :call SyntasticCheckCoffeescript()<cr>
"}}}
"UltiSnips "{{{
if has("win16") || has("win32")
    let g:UltiSnipsUsePythonVersion = 3
else 
    let g:UltiSnipsUsePythonVersion = 2
endif 
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/Documents/snippets']
let g:UltiSnipsRemoveSelectModeMappings = 1
"}}}
"Neocomplete"{{{
let g:neocomplete#enable_at_startup = 1
"popup width
let g:neocomplete#max_list = 15
"keyword width
let g:neocomplete#max_keyword_width = 40 

"auto complete  
inoremap <leader>n <C-x><C-o>

"No scratch  
set completeopt-=preview

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    "return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key.
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" :
" \ neocomplete#start_manual_complete()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

" custom dictionaries
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'php' : $HOME.'/.common.php'
    \ }
"let g:neocomplete#sources#omni#input_patterns.php =
"\ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
"let g:neocomplete#sources#omni#input_patterns.c =
"\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
"let g:neocomplete#sources#omni#input_patterns.cpp =
"\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl =
            \ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

" For smart TAB completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
"        \ <SID>check_back_space() ? "\<TAB>" :
"        \ neocomplete#start_manual_complete()
"  function! s:check_back_space() 
"    let col = col('.') - 1
"    return !col || getline('.')[col - 1]  =~ '\s'
"  endfunction

"}}}

