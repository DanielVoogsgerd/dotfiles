#!/usr/bin/zsh

function changelog() {
	local location="/usr/share/doc/$1/changelog.Debian.gz"
	if [ -f "$location" ]; then
		zless "$location"
	else
		echo "No changelog found"
	fi
}
