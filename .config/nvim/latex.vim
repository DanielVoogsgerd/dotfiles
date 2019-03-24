augroup vimtex_config
	au!
	au User VimtexEventQuit call vimtex#compiler#clean(0)
augroup END

let g:tex_flavor='latex'
let vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

let g:auto_save = 0
augroup ft_latex
  au!
  au FileType tex let b:auto_save = 1
augroup END

let g:auto_save_events = ["InsertLeave", "TextChanged"]
let g:auto_save_silent = 1
