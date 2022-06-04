" --- General
let g:python3_host_prog = '/usr/bin/python3'
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" source ~/.vimrc
syntax on
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set number
set numberwidth=2
set relativenumber
" set signcolumn=number
set noswapfile
set nobackup
set undodir=$HOME/.cache/nvim/undodir
set undofile
set incsearch
set nohlsearch
set ignorecase
set smartcase
set nowrap
set splitbelow
set splitright
set hidden
set scrolloff=8
set noshowmode
set updatetime=250
set encoding=UTF-8
set mouse=a
set modeline
set modelines=7

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
let g:indentLine_char = '⦙'

"PlugUpdate --- Colors
set background=dark
set termguicolors

" colorscheme gruvbox-material

call plug#begin('~/.config/nvim/plugged')
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
"   - e.g. `call plug#begin('~/.vim/plugged')`

Plug '~/dotfiles/nvim/.config/nvim/plugged/vim-easy-align'
Plug '~/dotfiles/nvim/.config/nvim/plugged/vim-github-dashboard'
Plug '~/dotfiles/nvim/.config/nvim/plugged/ultisnips'
Plug '~/dotfiles/nvim/.config/nvim/plugged/vim-snippets'
Plug '~/dotfiles/nvim/.config/nvim/plugged/nerdtree'
Plug '~/dotfiles/nvim/.config/nvim/plugged/nerdtree-git-plugin'
Plug '~/dotfiles/nvim/.config/nvim/plugged/vim-devicons'
Plug '~/dotfiles/nvim/.config/nvim/plugged/vim-nerdtree-syntax-highlight'
Plug '~/dotfiles/nvim/.config/nvim/plugged/fzf.vim'

call plug#end()

