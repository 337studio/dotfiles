# ~/.bashrc

# Change umask to make directory sharing easier
umask 0002

# Aliases
if [ -e ~/.dotfiles/aliases.bash ]; then
    source ~/.dotfiles/aliases.bash
fi

# Functions
if [ -e ~/.dotfiles/functions.bash ]; then
    source ~/.dotfiles/aliases.bash
fi
