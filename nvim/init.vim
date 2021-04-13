" Plugins
" ==============================================
call plug#begin()


" Git
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'

" Fuzzy Finder
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Lightline
Plug 'itchyny/lightline.vim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" CTags
Plug 'preservim/tagbar'

" Native LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" Theme
Plug 'arcticicestudio/nord-vim'

" Languages
Plug 'hashivim/vim-terraform'

call plug#end() 

" UI
" ==============================================
let mapleader=' '
set hidden
set noshowmode
set number
set relativenumber
set signcolumn=yes
set cursorline
set scrolloff=10
set updatetime=300
set wildmode=longest,list,full

" Splits
" ==============================================
set splitbelow
set splitright

" Backups 
" ==============================================
set noswapfile
set nobackup
set undofile
set undodir=~/.vim/undodir

" Formatting 
" ==============================================
set nowrap
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

" Theme 
" ==============================================
set termguicolors
colorscheme nord

" Search 
" ==============================================
set nohlsearch
set incsearch
set ignorecase
set smartcase

" Directory browser
" ==============================================
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25

" Plugin configurations 
" ==============================================
lua require('bilco105')
