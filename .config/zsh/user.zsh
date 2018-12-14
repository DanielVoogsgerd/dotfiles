#!/usr/bin/zsh
# Personal
export NAME="Daniel Voogsgerd"
export EMAIL="daniel@voogsgerd.nl"
export GPGKEY="daniel@voogsgerd.nl"
export LANG="en_US.UTF-8"
export SSH_AUTH_SOCK=/run/user/1000/keyring/ssh

if [ -f $ENVIRONMENT/userspecific/zsh/functions.zsh ]; then
	source $ENVIRONMENT/userspecific/zsh/functions.zsh
fi

export username="daniel"
