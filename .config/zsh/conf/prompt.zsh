setopt PROMPT_SUBST
source $ZDOTDIR/plugins/vcs/zshrc.sh

# ┌───────┐
# │ Title │
# └───────┘
function title() {
	# Credits to Brian St. Pierre 
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

# ┌──────────────────────┐
# │ Before Prompt is ran │
# └──────────────────────┘
function precmd() {
    title "zsh" "%m:%55<...<%~"
}

# ┌────────────────────────────────┐
# │ Before the command is executed │
# └────────────────────────────────┘
function preexec() {
    title "$1" "%m:%35<...<%~"
}

function shell_icon {
	if [[ "$(stat -f -c %T .)" == 'cifs' ]]; then
		echo "☁"
	else
		echo "%(?..%F{001})%(!.#.$)%f"
	fi
}

# ┌─────────────┐
# │ Left Prompt │
# └─────────────┘
PROMPT=""

# Username if not my own user
if [[ "$USER" != "$username" ]]; then
	PROMPT+="%(!.%F{001}.%F{011})$USER"
fi

# Hostname if connected via SSH
if [ -n "$SSH_CONNECTION" ]; then
	PROMPT+="%m"
fi

# Path
PROMPT+=" %F{027}"
PROMPT+="%~ "

PROMPT+="%f"

# Shell icon
PROMPT+='$(shell_icon)'

# Set color to normal and add a space for seperation
PROMPT+="%f "

# ┌──────────────┐
# │ Right Prompt │
# └──────────────┘
RPROMPT=""

RPROMPT+="%F{004}"

# Return code
RPROMPT+="%(?..%F{001}[%?] )"

# VCS info
RPROMPT+='$(vcs_super_info)'

RPROMPT+="%f"
