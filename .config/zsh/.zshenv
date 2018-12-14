export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=${HOME}/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:=${HOME}/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:=${HOME}/.local/share}

#export VIMINIT=":source $XDG_CONFIG_HOME"/vim/vimrc
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

if command -v ag > /dev/null; then
	export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -f -g ""'
else
	export FZF_DEFAULT_COMMAND='find -L'
fi
