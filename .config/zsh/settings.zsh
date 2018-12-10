autoload -U compinit
autoload -U colors
colors

compinit -C

# why would you type 'cd dir' if you could just type 'dir'?
setopt AUTO_CD

# Now we can pipe to multiple outputs!
setopt MULTIOS

# Spell check commands!  (Always annoying!)
#setopt CORRECT

# Expand globs
setopt GLOB_COMPLETE
setopt PUSHD_MINUS
