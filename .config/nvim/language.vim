let g:ale_completion_enabled = 1
let g:ale_linters = {}
let g:ale_fixers = {}
let g:ale_open_list = 1

" ┌────────────┐
" │ Appearence │
" └────────────┘
highlight ALEWarning ctermbg=DarkMagenta
let g:ale_echo_msg_format = "%linter%: %code: %%s"

" ┌────────┐
" │ Python │
" └────────┘
let g:ale_linters.python = ['pyls', 'flake8', 'mypy', 'pylint']

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



