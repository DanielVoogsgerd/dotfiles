
function! Objectsearch()
	if has_key(g:LanguageClient_serverCommands, &filetype)
		call LanguageClient#textDocument_documentSymbol()
	else
		BTags
	endif
endfunction
