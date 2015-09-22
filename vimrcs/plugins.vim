" Set Vundle
""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" custom plugin
Plugin 'fholgado/minibufexpl.vim'
Plugin 'https://github.com/gorodinskiy/vim-coloresque.git'
Plugin 'scrooloose/nerdcommenter'
Plugin 'https://github.com/Shougo/neocomplete.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Valloric/MatchTagAlways'
"Plugin 'Lokaltog/vim-powerline'
Plugin 'bling/vim-airline'
Plugin 'edsono/vim-matchit'
Plugin 'tomasr/molokai'
Plugin 'pzich/phtmlSwitch-vim'
Plugin 'SirVer/ultisnips'
Plugin 'kien/ctrlp.vim'
Plugin 'maonx/vimim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'scrooloose/syntastic'
Plugin 'powerline/fonts'
"Plugin 'ggreer/the_silver_searcher'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


