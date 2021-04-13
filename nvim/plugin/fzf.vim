" Use RG to respect .gitignore
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

" Top down layout with info inline
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'

" Move fzf window to the centre of the window
let g:fzf_layout = 
\ { 'up':'~90%', 
\   'window': 
\    { 'width': 0.8, 
\      'height': 0.8,
\      'yoffset':0.5,
\      'xoffset': 0.5, 
\      'border': 'sharp' 
\    } 
\ }  

" Force fzf to use colourscheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Key mappings
nnoremap <silent> <C-f> :Files <CR>
nnoremap <silent> <C-b> :Buffers <CR>
nnoremap <silent> <C-t> :Tags <CR>
nnoremap <silent> <C-s> :Rg <CR>
