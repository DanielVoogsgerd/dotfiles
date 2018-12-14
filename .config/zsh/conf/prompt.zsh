setopt PROMPT_SUBST
source $ZDOTDIR/plugins/vcs/zshrc.sh

# Besides an ordinairy prompt I also set the terminal window to contain the executed command. Thanks to Brian from bstpierre
function title() {
    # escape '%' chars in $1, make nonprintables visible
    local a=${(V)1//\%/\%\%}

    # Truncate command, and join lines.
    a=$(print -Pn "%40>...>$a" | tr -d "\n")
    case $TERM in
        screen*)
            print -Pn "\e]2;$a @ $2\a" # plain xterm title
            print -Pn "\ek$a\e\\"      # screen title (in ^A")
            print -Pn "\e_$2   \e\\"   # screen location
            ;;
        xterm*)
            print -Pn "\e]2;$a @ $2\a" # plain xterm title
            ;;
    esac
}

# precmd is called just before the prompt is printed
function precmd() {
    title "zsh" "%m:%55<...<%~"
	if [ -f $HISTFILE ]; then
		commandcount=$(wc -l < $HISTFILE)
	fi
}

# preexec is called just before any command line is executed
function preexec() {
    title "$1" "%m:%35<...<%~"
}

function shell_icon {
	if [[ "$(stat -f -c %T .)" == 'cifs' ]]; then
		echo "☁"
	elif [[ "$USER" == "root" ]]; then
		echo "#"
	else
		echo "$"
	fi
}

function prompt() {
	local p_hostname="%F{005}"
	local p_path="%F{027}"

	PROMPT=""

	if [[ "$USER" == "root" ]]; then
		PROMPT+="%F{001} $USER"
	elif [[ "$USER" != "$username" ]]; then
		PROMPT+="%F{011} $USER"
	fi

	PROMPT+=" $p_path"
	PROMPT+="%~ "
	PROMPT+="%f"
	PROMPT+='$(vcs_super_info_wrapper)'
	PROMPT+='$(shell_icon)'
	PROMPT+="%f "

	RPROMPT=""

	if [ -z "$commandcount" ]; then
		RPROMPT+="%F{004}["
		RPROMPT+="%F{012}"'${commandcount}'
		RPROMPT+="%F{004}]"
	fi

	RPROMPT+="%F{004}"
	RPROMPT+="[%(?,%F{012},%F{001})"
	RPROMPT+="%?"
	RPROMPT+="%F{004}]"

	RPROMPT+="%F{004}["
	RPROMPT+="%F{012}%*"
	RPROMPT+="%F{004}]"
	RPROMPT+="%f"
}


prompt
