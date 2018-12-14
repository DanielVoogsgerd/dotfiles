function md() { [ -n "$1" ] && mkdir -p "$@" && cd "$1"; }

function server {
    if [ -n "$1" ]; then
        PORT="$1"
    else
        PORT="8000"
    fi

    xdg-open "http://localhost:$PORT/"
    php -S localhost:$PORT
}

function edit {
	FILE=$1
	if [ -w "$FILE" ] || [ -w "$(dirname $FILE)" ]; then
		echo "Write permission is granted on $FILE"
		if hash "$VISUAL" 2>/dev/null; then
			$VISUAL "$FILE"
		elif hash "$EDITOR" 2>/dev/null; then
			$EDITOR "$FILE"
		else
			echo "The specified editors couldn't be found"
			return 1
		fi
	else
		echo "Write permission is NOT granted on $FILE"
		echo "Opening using sudoedit"
		sleep 0.5
		sudoedit $FILE
    fi
}

function editbin {
    edit `which $1`
}

function calc() {
	local result="";
	result="$(printf "scale=10;$*\n" | bc --mathlib | tr -d '\\\n')";

	if [[ "$result" == *.* ]]; then
		# improve the output for decimal numbers
		printf "$result" |
		sed -e 's/^\./0./'        `# add "0" for cases like ".5"` \
		    -e 's/^-\./-0./'      `# add "0" for cases like "-.5"`\
		    -e 's/0*$//;s/\.$//';  # remove trailing zeros
	else
		printf "$result";
	fi;
	printf "\n";
}

function gz() {
	if [ -z "$1" ]; then
		echo "No file specified"
		echo "Usage: $0 [file]"
		return 1
	fi
	if [ ! -f "$1" ]; then
		echo "File '$1' not found"
		echo "Usage: $0 [file]"
		return 1
	fi

	local origsize=$(wc -c < "$1");
	local gzipsize=$(gzip -c "$1" | wc -c);
	local ratio=$(echo "$gzipsize * 100 / $origsize" | bc -l);
	echo "Filesize comparison"
	printf "Original:          %d bytes\n" "$origsize";
	printf "Compressed (gzip): %d bytes (%2.2f%%)\n" "$gzipsize" "$ratio";
}

function vcs_super_info_wrapper {
	if [[ "$(stat -f -c %T .)" != 'cifs' ]]; then
		vcs_super_info
	fi
}

# Function works better than alias to fool autocomplete
function diff {
	git diff --no-index -- $@
}

