" ┌──────────────────┐
" │ General Settings │
" └──────────────────┘
set relativenumber " Show relative linenumber to the line I'm at right now
set number " Show the absolute number on the current line
set cursorcolumn " Highlight the current column I'm at
set cursorline " Hightlight the current row I'm at
set showcmd " Show the commands I'm typing, great for demo's
set undofile " Write an undofile, this makes undo persistent
set scrolloff=5 " Keep the edge of the view n lines away for the current row

" ┌─────────────┐
" │ Indentation │
" └─────────────┘
set tabstop=4 " Make tabs appear as 4 spaces
set shiftwidth=4 " The size of the indent for = < >
set expandtab " Automatically expand the tabkey to spaces

" ┌────────────────┐
" │ Autocompletion │
" └────────────────┘
set completeopt=noinsert,longest,menuone,noselect
let g:deoplete#enable_at_startup = 1
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:ale_completion_enabled = 1
let g:ale_open_list = 1

" ┌─────────┐
" │ Linting │
" └─────────┘
let g:ale_sign_error = "✖"
let g:ale_sign_warning = "⚠"
let g:ale_sign_info = "i"
let g:ale_sign_hint = "➤"
let g:ale_linters = {}
let g:ale_fixers = {}

" ┌──────────┐
" │ Snippets │
" └──────────┘
" Move Ultisnippets directory to XDG_CONFIG_HOME
let g:UltiSnipsSnippetDirectories = [$XDG_CONFIG_HOME."/vim/UltiSnips", $XDG_CONFIG_HOME.'/nvim/UltiSnips']
let g:UltiSnipsUsePythonVersion = 3

" ┌───────┐
" │ Netrw │
" └───────┘
let g:netrw_home=$XDG_CACHE_HOME.'/nvim'

" ┌──────────┐
" │ Debugger │
" └──────────┘
let g:vebugger_leader="<leader>b"

" ┌──────────┐
" │ Comments │
" └──────────┘
let NERDSpaceDelims=1

" ┌──────────────────┐
" │ Config reloading │
" └──────────────────┘
if ! exists("g:reloadcfg")
	let g:reloadcfg="yes"
	autocmd BufWritePost ~/.config/nvim/* source ~/.config/nvim/init.vim
endif

" ┌─────────────┐
" │ Spell check │
" └─────────────┘
set spelllang=nl,en_gb

" ┌─────┐
" │ FZF │
" └─────┘
let $FZF_DEFAULT_COMMAND .= ' -p ~/.config/nvim/fzf.ignore'

" ┌──────┐
" │ Misc │
" └──────┘
if executable('nvim-open')
	let $VISUAL='nvim-open'
endif
