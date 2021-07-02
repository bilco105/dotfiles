" Plugins
" ==============================================
call plug#begin()

" Helpful Utilities
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'lua' }

" Fuzzy Finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Git
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'

" Languages
Plug 'hashivim/vim-terraform'

" Lightline
Plug 'itchyny/lightline.vim'

" Native LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
Plug 'glepnir/lspsaga.nvim'
Plug 'simrat39/symbols-outline.nvim'

" Theme
Plug 'arcticicestudio/nord-vim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

call plug#end() 

" UI
" ==============================================
let mapleader=' '
set hidden
set noshowmode
set cursorline
set signcolumn=yes
set colorcolumn=80
set scrolloff=10
set updatetime=300
set wildmode=longest,list,full
set shortmess+=c
set completeopt=menuone,noselect

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

" Aligning 
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Completion
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" Plugin configurations 
" ==============================================
lua require('bilco105')
