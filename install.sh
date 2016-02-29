#!/usr/bin/env bash
#
# SCRIPT: install.sh
# AUTHOR: Hogan Lee
# DATE:   02/29/2016
#
# PLATFORM: Mac OS X
#
# REQUIREMENTS: None
#
# PURPOSE: This script creates symlinks from this dotfiles directory
#        into ~.
#
# REV LIST:
#        DATE: DATE_of_REVISION
#        BY:   AUTHOR_of_MODIFICATION
#        MODIFICATION: Describe what was modified, new features, etc--
#
#
# set -n   # Uncomment to check script syntax, without execution.
#          # NOTE: Do not forget to put the # comment back in or
#          #       the shell script will never execute!
set -x   # Uncomment to debug this shell script
#
##########################################################
#         DEFINE FILES AND VARIABLES HERE
##########################################################

# Directory where script was called from
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Old dotfiles backup directory
OLDDIR="$(dirname $BASEDIR)"/dotfiles_old

# List of files/folders to symlink in homedir
FILES="bashrc bash_profile gitconfig"

##########################################################
#              DEFINE FUNCTIONS HERE
##########################################################


##########################################################
#               BEGINNING OF MAIN
##########################################################

# create dotfiles_old in homedir
echo "Creating $OLDDIR for backup of any existing dotfiles in ~/Code"
mkdir -p $OLDDIR
echo "...done"

# change to the dotfiles directory
echo "Changing to the $BASEDIR directory"
cd $BASEDIR
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory,
# then create symlinks
for FILE in $FILES; do
    if [ -e ~/.$FILE ]; then
      echo "Moving existing .$FILE from ~ to $OLDDIR"
      mv ~/.$FILE ~/Code/dotfiles_old/
    fi
    echo "Creating symlink to $FILE in home directory."
    ln -s $BASEDIR/$FILE ~/.$FILE
done

# End of script
