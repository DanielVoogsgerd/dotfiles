#!/usr/bin/zsh
function shell_log {
	if [[ $DEBUG == true ]]; then
		echo $@
	fi
}

function load {
	if [ -f $1 ]; then
		shell_log $2
		source $1
	fi
}

if command -v lsb_release > /dev/null; then
	export OS=$(lsb_release -is)
fi

autoload -U compinit
compinit -d ${XDG_CACHE_HOME:=~/.cache}/zsh/zcompdump-$ZSH_VERSION


load $ZDOTDIR/user.zsh "Loading userspecific settings"
load "$ZDOTDIR/settings.zsh" "Loading general settings"

# Loading configs
shell_log "Loading configs"
for file in $ZDOTDIR/conf/*.zsh; do
	load $file "Loading config: ($file)"
done
unset file


typeset -U path cdpath fpath

load /usr/share/fzf/completion.zsh "Loading fzf completion"
load /usr/share/fzf/key-bindings.zsh "Loading fzf key-bindings"
