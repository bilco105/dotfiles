" Plugins
" ==============================================
call plug#begin()

" Formatting
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" Split handling w/tmux
Plug 'christoomey/vim-tmux-navigator'

" Fuzzy Finder
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Lightline
Plug 'itchyny/lightline.vim'

" Themes
Plug 'NLKNguyen/papercolor-theme'
Plug 'arcticicestudio/nord-vim'

" Languages
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'stephpy/vim-yaml'
Plug 'rodjek/vim-puppet'
Plug 'hashivim/vim-terraform'

call plug#end() 

" UI
" ==============================================
set noerrorbells      " Stop the annoying feedback
set hidden            " Allow buffers to be hidden
set laststatus=2      " Always show status line
set noshowmode        " Don't show vim mode
set number            " Line numbers on
set relativenumber    " Relative line numbers
set colorcolumn=120   " Vertical guide
set clipboard=unnamed " Use system clipboard
let mapleader=' '     " Map leader to spacebar

" Splits
" ==============================================
set splitbelow
set splitright

" Backups 
" ==============================================
set undofile               " Persist undo history
set undodir=~/.vim/undodir " Store files out the way

" Formatting 
" ==============================================
set nowrap        " Line wrapping off
set tabstop=2     " Indentation = 2 spaces
set softtabstop=2 
set shiftwidth=2
set expandtab     " Tabs to spcaes   

" Theme 
" ==============================================
colorscheme nord

" Search 
" ==============================================
set incsearch  " Incremental searching
set ignorecase " Case insensitive searching..
set smartcase  " ..unless any caps are used

" Directory browser
" ==============================================
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
nnoremap - :Vexplore .<CR>

" Keymappings
" ==============================================

" Better escaping
imap jj <Esc>

" Better window resizing
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Plugin Specific Configs
source $HOME/.config/nvim/plugins/lightline.vim
source $HOME/.config/nvim/plugins/fzf.vim
