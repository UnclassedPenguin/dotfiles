#!/bin/bash

#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#
# Tyler(UnclassedPenguin) Dotfiles Installer 2022
#
# Author: Tyler(UnclassedPenguin)
#    URL: https://unclassed.ca
# GitHub: https://github.com/UnclassedPenguin
#
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
# Dependencies 
#-------------------------------------------------------------------------------
# Checks for dependencies. 
# The only one atm is curl
#-------------------------------------------------------------------------------

SCRIPTNAME="${0##*/}"

warn() {
    printf >&2 "$SCRIPTNAME: $*\n"
}

iscmd() {
    command -v >&- "$@"
}

checkdeps() {
    local -i not_found
    for cmd; do
        iscmd "$cmd" || { 
            warn $"$cmd is not found"
            let not_found++
        }
    done
    (( not_found == 0 )) || {
        warn $"Install dependencies listed above to use $SCRIPTNAME"
        exit 1
    }
}

# If you need to check more, just add here i.e.:
# checkdeps curl cmd cmd1 cmd2
checkdeps curl

checkexists() {
  for cmd; do
    if ! [ -x "$(command -v $cmd)" ] ; then
      warn $"$cmd not detected"
    else
      warn $"$cmd detected..."
    fi
  done
}

#-------------------------------------------------------------------------------
# End Dependencies 
#-------------------------------------------------------------------------------
# Thanks to Dmitry Alexandrov
# For this from: 
# https://stackoverflow.com/questions/20815433/
#       how-can-i-check-in-a-bash-script-if-some-software-is-installed-or-not
#-------------------------------------------------------------------------------
checkexists zsh
checkexists bananas 

warn $"Done!..."
