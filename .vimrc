"{{{ General
set nocompatible   " functionality over compatibility
set encoding=utf-8 " use utf-8 everywhere
"}}}
"Plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized' " theme
Plug 'kien/ctrlp.vim'                   " go-to-file functionality
Plug 'scrooloose/nerdtree'              " file tree explorer
Plug 'scrooloose/syntastic'             " syntax checking
Plug 'tpope/vim-fugitive'               " git integration
Plug 'tpope/vim-commentary'             " comment stuff out
Plug 'tpope/vim-surround'               " manage parentheses, etc
Plug 'Xuyuanp/nerdtree-git-plugin'      " nerdtree git integration
Plug 'airblade/vim-gitgutter'           " git gutter
Plug 'bling/vim-airline'                " awesome statusbar
Plug 'godlygeek/tabular'                " text filtering & alignment
Plug 'SirVer/ultisnips'                 " text snippets
Plug 'honza/vim-snippets'               " community maintained programming snippets
Plug 'rodjek/vim-puppet'                " puppet niceties
Plug 'cespare/vim-sbd'                  " smart buffer closing

call plug#end()
"}}}
"{{{ Plugin: Airline
set laststatus=2                           " always display statusline
let g:airline_theme='solarized'            " matching airline theme
let g:airline_powerline_fonts=1            " use powerline fonts & symbols
let g:airline#extensions#tabline#enabled=1 " enable enhanced tabline
if !has("gui_macvim")
  let g:airline_left_sep = ''              " disable powerline seperator
  let g:airline_right_sep = ''             " disable powerline seperator
end
"}}}
"{{{ Plugin: CtrlP
let g:ctrlp_match_window = 'bottom,order:ttb' " order files top to bottom
let g:ctrlp_switch_buffer = 0                 " open files in new buffer
let g:ctrlp_working_path_mode = 0             " respect changing working path
"}}}
"{{{ Plugin: UltiSnip
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"}}}
"{{{ Plugin: NerdTree
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeBookmarksSort = 1
"}}}
"{{{ Plugin: SBD
nnoremap <silent> <C-x> :Sbd<CR> " Map Ctrl-x to close buffer
"}}}
"{{{ Colours
set t_Co=256          " enable 256 colours
colorscheme solarized " colour scheme
set background=dark   " dark colour scheme in terminal
syntax enable         " enable syntax processing
"}}}
"{{{ Tabs & spacing
set backspace=indent,eol,start " backspace in insert mode
set tabstop=2 shiftwidth=2     " tabs are two spaces
set expandtab                  " use spaces, not tabs
set modelines=5                " enable per-file vim modelines
set autoindent                 " enable auto indenting
set copyindent                 " copy previous indenting
set nowrap                     " don't wrap lines
filetype indent on             " enable file type indentation 
filetype plugin on             " enable file type plugins
"}}}
"{{{ UI
set ttyfast          " faster redraw
set hidden           " hide buffers rather than close
set number           " show line numbers
set showcmd          " show command in bottom bar
set cursorline       " highlight current line
set wildmenu         " visual autocomplete for command menu
set showmatch        " highlight matching parenthesis
set pastetoggle=<F2> " quickly enable paste mode
"}}}
"{{{ Searching
set ignorecase " searches are case insensitive...
set smartcase  " ... unless they contain at least one cap
set incsearch  " search as characters are entered
set hlsearch   " highlight matches
"}}}
"{{{ Folding
set foldenable        " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10    " 10 nested fold max
set foldmethod=indent " fold based on indent level
"}}}
"{{{ Backups
set backup 
set backupdir=/tmp//,.
set directory=/tmp//,.
"}}}
"{{{ MacVim
if has("gui_macvim")
  set background=light          " light background
  set guifont=Hasklig:h13       " powerline patched font & size
  set linespace=1               " set sane line spacing
  set antialias                 " smooth fonts
  set guioptions-=e             " don't use gui tabs
  set guioptions-=T             " remove toolbar
  set guioptions-=L             " remove left scrollbar
  set guioptions-=l             " remove left scrollbar
  set guioptions-=R             " remove right scrollbar
  set guioptions-=r             " remove right scrollbar
  set stal=2                    " turn on tabs by default
  set fuoptions=maxvert,maxhorz " fullscreen options (MacVim only), resized window when changed to fullscreen
  set gtl=%t gtt=%F             " sensible tab/tooltip headings
end
"}}}
"{{{ Key Mappings: Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
"}}}
"{{{ Key Mappings: Splits
nnoremap <C-J> <C-W><C-J> " ctrl+j select bottom pane
nnoremap <C-K> <C-W><C-K> " ctrl+k select top pane
nnoremap <C-L> <C-W><C-L> " ctrl+l select right pane
nnoremap <C-H> <C-W><C-H> " ctrl+h select left pane
"}}}
" vim:foldmethod=marker:foldlevel=0
