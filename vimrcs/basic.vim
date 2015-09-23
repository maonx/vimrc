" General"{{{
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" enable syntax highlighting
syntax enable 

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" fast saving
nmap <leader>w :w!<cr>

" :w sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Always show the status line
set laststatus=2

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"}}}
" vim user interface"{{{
" avoid garbled characters in chinese language windows os
let $lang='en' 
set langmenu=en
set encoding=utf-8
"source $vimruntime/delmenu.vim
"source $vimruntime/menu.vim
set fileencodings=ucs-bom,utf-8,cp936,big5

" turn on the wild menu
set wildmenu

" ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.ds_store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

"always show current position
set ruler

" height of the command bar
set cmdheight=1

" a buffer becomes hidden when it is abandoned
set hid

" configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" in many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" ignore case when searching
set ignorecase

" when searching try to be smart about cases 
set smartcase

" highlight search results
set hlsearch

" makes search act like search in modern browsers
set incsearch 

" don't redraw while executing macros (good performance config)
set lazyredraw 

" for regular expressions turn magic on
set magic

" show matching brackets when text indicator is over them
set showmatch 
" how many tenths of a second to blink when matching brackets
set mat=2

" no annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" add a bit extra margin to the left
set foldcolumn=0

" show number
set number
set cursorline
set cursorcolumn

" set foldmethod
set foldmethod=marker"}}}
" files, backups and undo"{{{
" turn backup off, since most stuff is in svn, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Turn persistent undo on 
" means that you can undo even when you close a buffer/VIM
try
    set undodir=~/.vim/temp_dirs/undodirs
    set undofile
catch
endtry
"}}}
" text, tab and indent related"{{{
" use spaces instead of tabs
set expandtab

" be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" linebreak on 500 characters
set lbr
set tw=500

set ai "auto indent
set si "smart indent
set wrap "wrap lines
"}}}
" moving around, tabs, windows and buffers"{{{
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
"}}}
" Editing mappings"{{{
" Remap VIM 0 to first non-blank character
map 0 ^
" copy paste
vnoremap <Leader>y "+y
nmap <Leader>p "+p
nmap <Leader>P "+P

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
"}}}
" Misc"{{{
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
"}}}
" Helper functions"{{{
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ag \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction"}}}
