" ┌─────────────┐
" │ Colorscheme │
" └─────────────┘
let base16colorspace=256
colorscheme base16-material-darker

" Increase the Comment contrast
highlight Comment ctermfg=grey 

" Increase the visual contrast
highlight Visual ctermbg=darkgrey

" Make the background transparent
highlight Normal ctermbg=none
highlight NonText ctermbg=none

" ┌────────────┐
" │ Statusline │
" └────────────┘
set laststatus=2
set statusline=%F
set statusline+=%=
set statusline+=%{getcwd()}
