# ~/.bashrc

# Change umask to make directory sharing easier
umask 0002

# Ignore dupes in command history
export HISTCONTROL=ignoredups

# Increase history size to 1000 lines
export HISTSIZE=1000

# Prepend time stamp to each history entry showing when the command was executed
# export HISTTIMEFORMAT="%m/%d/%y %T "

# Aliases
# TODO: how to pull these out to separate file?

# Credit: https://github.com/Bash-it/bash-it
alias ..='cd ..'         # Go up one directory
alias ...='cd ../..'     # Go up two directories
alias ....='cd ../../..' # Go up three directories
alias -- -='cd -'        # Go back

# `ls` aliases
alias lf='ls -F'       # `/` denotes directories; `*` denotes executables
alias ld="ls -ld */"   # List in long format, only directories
# alias ll='ls -l'     # long form

# better mneumonics
alias search=grep
alias whereami=pwd # since there's a `whoami` command, hehe

# shortcut to my Google Drive/Code folder
alias code='echo Now in Code folder, which contains; cd ~/Google\ Drive/Code/; ls -1'

# Open in chrome
alias chrome='open -a Google\ Chrome.app'


# Functions
# TODO: same with aliases, how to pull out into separate file?
