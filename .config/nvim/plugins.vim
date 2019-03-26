call plug#begin('~/.local/share/nvim/plugins')
" ┌───────────┐
" │ Movements │
" └───────────┘
Plug 'tpope/vim-surround'

" ┌───────────┐
" │ Languages │
" └───────────┘
Plug 'autozimu/LanguageClient-neovim', { 'do': 'bash install.sh' }
Plug 'w0rp/ale'

" LaTeX
Plug '907th/vim-auto-save', {'for': 'tex'} " I only use autosave for tex
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'lervag/vimtex', {'for': 'tex'}

" i3 window manager
Plug 'Potatoesmaster/i3-Vim-Syntax'

" NGiNX config
Plug 'chr4/nginx.vim'

" Icinga config
Plug 'yeahnoob/icinga2-vim'

" Typescript
Plug 'Leafgarland/Typescript-Vim'

" Python
Plug 'nvie/vim-flake8'

" ┌────────────────┐
" │ Autocompletion │
" └────────────────┘
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
" Plug 'ncm2/ncm2'
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-path'

" ┌────────────┐
" │ Appearance │
" └────────────┘
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'machakann/vim-highlightedyank'

" ┌───────────┐
" │ Debugging │
" └───────────┘
Plug 'idanarye/vim-vebugger'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" ┌──────┐
" │ Misc │
" └──────┘
Plug 'Dimercel/todo-vim'
Plug 'airblade/vim-rooter'
Plug 'jmcantrell/vim-virtualenv'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'sirver/ultisnips'
Plug 'takac/vim-hardtime'
Plug 'tpope/vim-fugitive'

call plug#end()
