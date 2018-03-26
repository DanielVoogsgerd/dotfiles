set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

set encoding=utf8

" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'


" Personal Plugins
Plugin 'Altercation/Vim-Colors-Solarized'
Plugin 'Atweiden/Vim-Hudigraphs'
Plugin 'Bling/Vim-Airline'
Plugin 'ChrisKempson/Base16-vim'
Plugin 'Chrisbra/Unicode.vim'
Plugin 'FuzzyFinder'
Plugin 'Godlygeek/Tabular'
Plugin 'L9'
Plugin 'Lokaltog/Vim-Easymotion'
Plugin 'Potatoesmaster/i3-Vim-Syntax'
Plugin 'Rodjek/Vim-Puppet'
Plugin 'Rstacruz/Sparkup', {'rtp': 'vim/'}
Plugin 'Scrooloose/NERDTree'
Plugin 'Scrooloose/Syntastic'
Plugin 'Sheerun/Vim-Polyglot'
Plugin 'Sickill/Vim-Monokai'
Plugin 'TPope/Vim-Dispatch'
Plugin 'TPope/Vim-Fugitive'
Plugin 'TPope/Vim-Git'
Plugin 'TPope/Vim-Repeat'
Plugin 'TPope/Vim-Sensible'
Plugin 'TPope/Vim-Surround'
Plugin 'TPope/Vim-Eunuch'
Plugin 'Trusktr/Seti.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'lervag/vimtex'
Plugin 'ryanoasis/vim-devicons'
Plugin 'triglav/vim-visual-increment'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'

" Syntax plugins
Plugin 'NGiNX.vim'
Plugin 'yeahnoob/icinga2-vim'
Plugin 'Leafgarland/Typescript-Vim'
Plugin 'nvie/vim-flake8'


call vundle#end()
" End Plugins

filetype plugin indent on

function! LoadColorscheme(name)
    let pat = 'colors/'.a:name.'.vim'
    if !empty(globpath(&rtp, pat))
        colorscheme seti
    endif
endfunction


" We like colors :D
set t_Co=256

" Powerline is awesome
set laststatus=2
" let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
" Showing the mode in the command window is quite redundant with powerline
set noshowmode


" Visual settings
hi clear
syntax on
set background=dark
:call LoadColorscheme('seti')

" Make the background transparent
hi Normal ctermbg=none
hi NonText ctermbg=none

" Couple settings
set number
set relativenumber
set cursorcolumn
set cursorline
set backupdir=/tmp
set swapfile
set dir=/tmp
set showcmd

" Remaps
nnoremap ; :
inoremap jj <Esc>
inoremap ;; <End>;<Esc>:w<CR>

" Easier split workflow
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


let s:tabwidth=4
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Searchoptions
set incsearch
set ignorecase
set hlsearch

let mapleader = ","
let g:mapleader = ","

" Let's stop using the arrow keys
noremap <Up> :m -2<CR>
noremap <Down> :m +1<CR>
noremap <Left> <NOP>
noremap <Right> <NOP>

noremap <ScrollWheelUp> <NOP>
noremap <S-ScrollWheelUp> <NOP>
noremap <ScrollWheelDown> <NOP>
noremap <S-ScrollWheelDown> <NOP>

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Quickly open vimrc
command! Vimrc :e ~/.vimrc
nnoremap <leader>rc :Vimrc<CR>
command! Reload :so $MYVIMRC
nnoremap <leader>rl :Reload<CR>

" Keybinds
vnoremap <leader>so :sort u<CR>

" I paste a lot from my X11 clipboard
noremap <leader>v "+p
noremap <leader>c "+y

" With a map leader it's possible to do extra key combinations
" Easymotion
nmap s <Plug>(easymotion-w)

" NERDTree keybindings
nmap <leader>1 :NERDTreeToggle<CR>

" YouCompleteMe keybindings
nnoremap <leader>d  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Tagbar
map <leader>t :TagbarToggle<CR>

" Git bindings
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gc :Gcommit -q<CR>
nnoremap <leader>gps :Gpush<CR>
nnoremap <leader>gpl :Gpull<CR>
nnoremap <leader>go :Copen<CR>
nnoremap <leader>gg :GitGutterSignsToggle<CR>

nmap <Leader>gsh <Plug>GitGutterStageHunk
nmap <Leader>gnh <Plug>GitGutterNextHunk
nmap <Leader>gph <Plug>GitGutterPrevHunk


let g:gitgutter_map_keys = 0

" Quick alignment with Tabular
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

" Execute the current file
nnoremap <Leader>e :!./#<CR>

" Colourcolumn
highligh ColorColumn ctermbg=darkgrey
set colorcolumn=81,121

" Trailing whitespace and incorrect indentation
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

" This probably makes some people cringe, but it's nice and consistent
nnoremap <C-T> :tabe<CR>
nnoremap <C-W> :tabclose<CR>

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>


" Since visual block mode is way better than visual mode; why don't we just swap them.
nnoremap    v   <C-V>
nnoremap <C-V>     v

vnoremap    v   <C-V>
vnoremap <C-V>     v

" Add slash seperated text object
onoremap <silent> i/ :<C-U>normal! T/vt/<CR> " inside /
onoremap <silent> a/ :<C-U>normal! F/vf/<CR> " around /
xnoremap <silent> i/ :<C-U>normal! T/vt/<CR> " inside /
xnoremap <silent> a/ :<C-U>normal! F/vf/<CR> " around /

" Line highlighting
hi LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Spellcheck for English, Basic English and Dutch
nmap ;s  :set invspell spelllang=en<CR>
nmap ;ss :set invspell spelllang=en-basic<CR>
nmap ;sd :set invspell spelllang=nl<CR>

" Write
cmap w!! w !sudo tee > /dev/null %

" Map CTRL-K to a list diagraph without losing context
" inoremap <expr> <C-K> ShowDigraphs()

function! ShowDigraphs ()
    digraphs
    call getchar()
    return "\<C-K>"
endfunction

highlight NonText ctermbg=none

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 3

let g:vimtex_view_general_viewer = 'mupdf'
