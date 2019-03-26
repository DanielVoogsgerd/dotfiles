" ┌────────────┐
" │ Appearence │
" └────────────┘
let g:ale_echo_msg_format = "%linter%: %code: %%s"

" ┌────────┐
" │ Python │
" └────────┘
let g:ale_linters.python = ['pyls', 'flake8', 'mypy', 'pylint']
let g:ale_fixers.python = ['autopep8']

" ┌────────────┐
" │ Javascript │
" └────────────┘
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab
let g:ale_fixers.javascript = ['standard']

" ┌──────┐
" │ HTML │
" └──────┘

" ┌─────┐
" │ CSS │
" └─────┘

" ┌───────┐
" │ LaTeX │
" └───────┘
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

" ┌──────┐
" │ Rust │
" └──────┘

