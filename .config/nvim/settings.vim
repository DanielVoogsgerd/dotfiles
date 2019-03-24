" Let netrw respect the XDG base directory spec
let g:netrw_home=$XDG_CACHE_HOME.'/vim'

" Settings
set number
set relativenumber
set cursorcolumn
set cursorline
set showcmd " Show the commands I'm typing, great for demo's

" Set tabsize
set tabstop=4
set shiftwidth=4

set laststatus=2
set statusline=%F
set statusline+=%=
set statusline+=%{getcwd()}
let mapleader=","

" Enable deoplete

set completeopt=noinsert,longest,menuone
let g:deoplete#enable_at_startup = 1

let g:SuperTabDefaultCompletionType = "<c-n>"

" Move Ultisnippets directory to XDG_CONFIG_HOME
let g:UltiSnipsSnippetDirectories = [$XDG_CONFIG_HOME."/vim/UltiSnips", $XDG_CONFIG_HOME.'/nvim/UltiSnips']
let g:UltiSnipsUsePythonVersion = 3

let g:netrw_home=$XDG_CACHE_HOME.'/nvim'
let g:vebugger_leader="<leader>b"

" Enable vim hardtime
let g:hardtime_default_on = 1

let NERDSpaceDelims=1


" Automatically resource nvim config
if ! exists("g:reloadcfg")
	let g:reloadcfg="yes"
	autocmd BufWritePost ~/.config/nvim/* source ~/.config/nvim/init.vim
endif


" Spelling
set spelllang=nl,en_gb


let $FZF_DEFAULT_COMMAND .= ' -p ~/.config/nvim/fzf.ignore'
