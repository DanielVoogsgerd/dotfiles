# Expanding the path a bit
export PATH="$PATH:$HOME/bin:$HOME/.config/composer/vendor/bin:./vendor/bin"

# Knowing the OS is used for feature detection in the dotfiles
if command -v foo >/dev/null 2>&1; then
	export OS=$(lsb_release -si)
else
	export OS="Not detected"
fi
