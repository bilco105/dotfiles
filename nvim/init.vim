" Plugins
" ==============================================
call plug#begin()

" Comments
Plug 'tpope/vim-commentary'

" Git
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'

" Fuzzy Finder
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Languages
Plug 'hashivim/vim-terraform'

" Lightline
Plug 'itchyny/lightline.vim'

" Native LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" Tags
Plug 'ludovicchabant/vim-gutentags'
Plug 'preservim/tagbar'

" Theme
Plug 'arcticicestudio/nord-vim'

" Tmux
Plug 'christoomey/vim-tmux-navigator'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

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

" Keymaps
" ==============================================

" Better indenting behaviour
vnoremap < <gv
vnoremap > >gv

" Plugin configurations 
" ==============================================
lua require('bilco105')
