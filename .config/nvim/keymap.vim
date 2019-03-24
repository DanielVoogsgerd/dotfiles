" Map up and down to be visually a line down instead of the same column on the
" next line
nnoremap j gj
nnoremap k gk

" Easy tab operations
" nnoremap <C-T> :tabe<CR>
" nnoremap <C-W> :tabclose<CR>
" nnoremap <C-j> :tabnext<CR>
" nnoremap <C-k> :tabprevious<CR>

" Easier split workflow
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

map <C-p> :Files<CR>


" Testing
" Run test
map <leader>t :!nosetests --with-coverage --cover-html --cover-erase<CR>

" Todo comments
map <leader>d :TODOToggle<CR>

map <leader>r :call LanguageClient#textDocument_rename()<CR>
map <F2> :call LanguageClient#textDocument_rename()<CR>

map <C-o> :call Objectsearch()<CR>
map <leader>o :call Objectsearch()<CR>
" map <C-o> :call LanguageClient#textDocument_documentSymbol()<CR>
" map <leader>o :call LanguageClient#textDocument_documentSymbol()<CR>

" I'd prefer <C-S-p>, but Termite refuses to pass it through
map <A-p> :Commands<CR>
map <C-p> :Files<CR>
map <A-tab> :Buffers<CR>

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <C-t> :call LanguageClient_contextMenu()<CR>

" Terminal
map <A-t> :terminal<CR>

" Close buffer
map <C-Q> :bdelete<CR>

" Easy aliases when editting nvim config files 
map <leader>rce :e ~/.config/nvim/init.vim<CR>
map <leader>rcs :source ~/.config/nvim/init.vim<CR>

" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Create file if it does not existS
map <leader>gf :e <cfile><cr>


" Ultisnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsListSnippets = '<s-up>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'


" ┌──────────┐
" │ Spelling │
" └──────────┘

" Fix last spelling mistake
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
nnoremap <leader>spe :setlocal spell<CR>
nnoremap <leader>spd :setlocal nospell<CR>

" ┌───────────────────┐
" │ Disable arrowkeys │
" └───────────────────┘
let g:list_of_disabled_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
