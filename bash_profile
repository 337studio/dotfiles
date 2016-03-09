# ~/.bash_profile

# Amend PATH
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

# Ignore dupes in command history
export HISTCONTROL=ignoredups

# Increase history size to 1000 lines
export HISTSIZE=1000

# Prepend time stamp to each history entry showing when the command was executed
# export HISTTIMEFORMAT="%m/%d/%y %T "

# See: http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

#- end
