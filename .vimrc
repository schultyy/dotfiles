set nocompatible                " choose no compatibility with legacy vi

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-commentary'
Plugin 'rodjek/vim-puppet'
Plugin 'airblade/vim-gitgutter'
Plugin 'elzr/vim-json'
Plugin 'JulesWang/css.vim' " only necessary if your Vim version < 7.4
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'tpope/vim-haml'
call vundle#end()            " required
map <C-n> :NERDTreeToggle<CR>
filetype plugin indent on    " required
syntax enable

set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation
set nobackup
set noswapfile

set background=dark
colorscheme solarized

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set mouse=a " Enable using the mouse if terminal emulator
set mousehide

" Strip trailing whitespaces on each save
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

""Line numbers
set number
set guifont=Courier:18
let macvim_skip_colorscheme = 1
au BufRead,BufNewFile *.rabl setf ruby
au BufRead,BufNewFile *.json setf javascript
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
au BufRead,BufNewFile *.less setf less
au BufRead,BufNewFile *.pp setf puppet
au BufRead,BufNewFile Gemfile setf ruby
au BufRead,BufNewFile Vagrantfile setf ruby


set runtimepath^=~/.vim/bundle/ctrlp.vim
