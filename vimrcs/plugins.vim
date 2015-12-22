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
Plugin 'https://github.com/gorodinskiy/vim-coloresque.git'
Plugin 'https://github.com/Shougo/neocomplete.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Valloric/MatchTagAlways'
Plugin 'bling/vim-airline'
Plugin 'edsono/vim-matchit'
Plugin 'tomasr/molokai'
Plugin 'christoomey/vim-tmux-navigator'

" Plugin 'pzich/phtmlSwitch-vim'
Plugin 'SirVer/ultisnips'
Plugin 'maonx/vim-snippets'
Plugin 'mattn/emmet-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'maonx/vimim'
Plugin 'tpope/vim-commentary'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'

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


