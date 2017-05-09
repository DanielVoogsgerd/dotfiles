# Config alias :D
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Enable terminal 256 colour support
export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color

ZSH=$HOME/.zsh
cdir=$HOME/.cdir

export PATH="$PATH:$ENVIRONMENT/bin:$HOME/.config/composer/vendor/bin:./vendor/bin"
export OS=$(lsb_release -si)

export USERRUNDIR="/run/user/$(id -u)"

function shell_log {
	if [[ "$USER" != 'root' ]] || [[ $DEBUG == true ]]; then
		echo $@
	fi
}

function load {
	if [ -f $1 ]; then
		shell_log $2
		source $1
	fi
}


load $HOME/.userconfig/zsh/before.zsh "Loading user settings (Before)"
load "$ZSH/settings.zsh" "Loading general settings"

# Loading imported libraries
shell_log "Loading libraries"
for file in $ZSH/lib/*.zsh; do
	load $file "Loading library: ($file)"
done

# Loading configs
shell_log "Loading configs"
for file in $ZSH/conf/*.zsh; do
	load $file "Loading config: ($file)"
done
unset file

load $HOME/.userconfig/zsh/after.zsh "Loading userspecific settings (after)"

[ -f $cdir ] && shell_log "cdir found (`cat $cdir`)" && cd "`cat $cdir`" && rm "$cdir"

typeset -U path cdpath fpath

if [[ "$USER" != 'root' ]]; then
	clear

	if hash archey 2>/dev/null; then
		archey
	elif hash screenfetch 2>/dev/null; then
		screenfetch
	fi
fi
