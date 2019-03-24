
" Language servers
set hidden
let g:LanguageClient_serverCommands = {}
if executable('javascript-typescript-stdio')
  let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
  " Use LanguageServer for omnifunc completion
  autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
else
  echo "javascript-typescript-stdio not installed!\n"
  :cq
endif

if executable('pyls')
  let g:LanguageClient_serverCommands.python = ['pyls']
  " Use LanguageServer for omnifunc completion
  autocmd FileType python setlocal omnifunc=LanguageClient#complete
else
  echo "pyls not installed!\n"
  :cq
endif


if executable('bash-language-server')
	let g:LanguageClient_serverCommands.sh = ['bash-language-server', 'start']
	autocmd FileType bash setlocal omnifunc=LanguageClient#complete
endif

if executable('html-languageserver')
	let g:LanguageClient_serverCommands.html = ['html-languageserver', '--stdio']
	autocmd FileType html setlocal omnifunc=LanguageClient#complete
endif

if executable('css-languageserver')
	let g:LanguageClient_serverCommands.css = ['css-languageserver', '--stdio']
	autocmd FileType css setlocal omnifunc=LanguageClient#complete
endif
