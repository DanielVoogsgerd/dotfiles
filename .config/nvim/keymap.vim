" ┌─────────┐
" │ General │
" └─────────┘
let mapleader="," " Set the leader key
" Map up and down to be visually a line down instead of the same column on the
" next line
nnoremap j gj
nnoremap k gk

" Easy tab operations
" nnoremap <C-T> :tabe<CR>
" nnoremap <C-W> :tabclose<CR>
" nnoremap <C-j> :tabnext<CR>
" nnoremap <C-k> :tabprevious<CR>

" Close buffer
map <C-Q> :bdelete<CR>

" ┌────────────┐
" │ Appearance │
" └────────────┘
" Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Todo
map <leader>d :TODOToggle<CR>

" ┌────────────┐
" │ Navigation │
" └────────────┘
map <C-p> :Files<CR>
map <A-tab> :Buffers<CR>

" GoTo Definition
map <leader>gd :ALEGoToDefinition<CR>
map <leader>fr :ALEFindReferences<CR>
map <C-o> :BTags<CR>
map <leader>bo :BTags<CR>
map <leader>o :Tags<CR>

" map <leader>r :call LanguageClient#textDocument_rename()<CR>
" map <F2> :call LanguageClient#textDocument_rename()<CR>

" ┌──────┐
" │ Misc │
" └──────┘
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <C-t> :call LanguageClient_contextMenu()<CR>
map <A-p> :Commands<CR>

" Easy aliases when editting nvim config files 
map <leader>rce :e ~/.config/nvim/init.vim<CR>
map <leader>rcs :source ~/.config/nvim/init.vim<CR>

" Terminal
map <A-t> :terminal<CR>

" Goto file and create file if it does not exist
map <leader>gf :e <cfile><cr>

" ┌──────────┐
" │ Snippets │
" └──────────┘
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsListSnippets = '<s-up>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

" ┌──────────┐
" │ Spelling │
" └──────────┘
" Fix last spelling mistake
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
" Enable spellcheck
nnoremap <leader>spe :setlocal spell<CR>
" Disable spellheck
nnoremap <leader>spd :setlocal nospell<CR>

" ┌───────────┐
" │ Behaviour │
" └───────────┘
let g:hardtime_default_on = 1 " Limit the use of hjkl
let g:list_of_disabled_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"] " Disable the arrowkeys
