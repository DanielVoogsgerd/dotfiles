call plug#begin('~/.local/share/nvim/plugins')
Plug 'tpope/vim-surround'

"Plug 'autozimu/LanguageClient-neovim', {
    "\ 'branch': 'next',
    "\ 'do': 'bash install.sh',
    "\ }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'

Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'sirver/ultisnips'
Plug 'scrooloose/nerdcommenter'
Plug 'Dimercel/todo-vim'

Plug 'takac/vim-hardtime'
Plug 'airblade/vim-rooter'
Plug 'machakann/vim-highlightedyank'

" Debugging
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'idanarye/vim-vebugger'


" LaTeX
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug '907th/vim-auto-save'

" Colourschemes
Plug 'chriskempson/base16-vim'

Plug 'w0rp/ale'


" Syntax plugins
Plug 'Potatoesmaster/i3-Vim-Syntax'
Plug 'chr4/nginx.vim'
Plug 'yeahnoob/icinga2-vim'
Plug 'Leafgarland/Typescript-Vim'
Plug 'nvie/vim-flake8'


" Testing
Plug 'junegunn/goyo.vim'


call plug#end()
