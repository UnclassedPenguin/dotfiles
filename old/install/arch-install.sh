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

#-------------------------------------------------------------------------------
# End Dependencies 
#-------------------------------------------------------------------------------
# Thanks to Dmitry Alexandrov
# For this from: 
# https://stackoverflow.com/questions/20815433/
#       how-can-i-check-in-a-bash-script-if-some-software-is-installed-or-not
#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
# Variables
#-------------------------------------------------------------------------------

# Where you want to put dotfiles_old/
basedir=~/git/

# Your dotfiles directory
dir=~/git/dotfiles

# dotfiles_old directory
budir=~/git/dotfiles_old

echo "Checking for i3..."
if [ -x "$(command -v i3)" ] ; then
  echo "i3 Detected..."

  # Files to symlink if i3 detected
  files="i3status.conf vimrc xresources zshrc"

  # ~/.config/i3/config name in backup/dotfiles
  i3conf=i3config

else
  echo "i3 Not Detected..."

  # Files to symlink if no i3 detected
  files="vimrc Xresources zshrc"

fi

#-------------------------------------------------------------------------------
# End Variables
#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
# ZSH section 
#-------------------------------------------------------------------------------

# Next section checks for zsh bin and if not there installs it

echo "Looking for Zsh..."

if ! [ -x "$(command -v zsh)" ] ; then
  # Install zsh
  echo "Zsh Not Found, installing..."
  echo "Installing Zsh..."
  sudo pacman -Syu lzsh || { warn $'apt install zsh failed' ; exit 1; }
  echo "Zsh Install Finished..."
  if [ -f "/bin/zsh" ] ; then
    echo "Changing shell to Zsh"
    chsh -s /bin/zsh
    echo "...done"
  fi
else
  echo "Zsh Found. Continuing..."
fi

# Next sections checks for oh my zsh and installs it if not there

echo "Looking for Oh My Zsh..."

if [ ! -d "$HOME/.oh-my-zsh" ] ; then
  echo "Oh My Zsh Not Found, installing..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended || { warn $'Getting Oh My Zsh failed...' ; exit 1; }
  echo "...done installing zsh"
else
  echo "Oh My Zsh found, continuing..."
fi

if [ -d "$HOME/.oh-my-zsh/custom/themes" ] ; then
  echo "Setting Zsh Theme..."
  ln -s $dir/tyler.zsh-theme $HOME/.oh-my-zsh/custom/themes/tyler.zsh-theme 
  echo "...done"
fi

#-------------------------------------------------------------------------------
# End ZSH section
#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
# Dotfiles section
#-------------------------------------------------------------------------------

# Create backup directory

echo "Creating $budir for backup of existing files"
mkdir -p $budir
echo "...done"

# Change to dotfile directory

echo "Changing to $dir directory"
cd $dir
echo "...done"

# Copy all the existing dotfiles into the backup dir, 
# and create symlinks to dotfiles in your git dotfiles folder. 
# This section takes care of any dotfiles located in your Homedir

for file in $files; do
  if [ -f "$HOME/.$file" ] ; then
    echo "Backing up $file to $budir"
    mv ~/.$file $budir/$file
    echo "...done"
  fi
  echo "Creating symlink to $file in ~"
  ln -s $dir/$file ~/.$file
  echo "...done"
done

# Install vim-plug if you don't have it

echo "Checking for vim-plug..."
if [ ! -f "$HOME/.vim/autoload/plug.vim" ] ; then
  echo "Vim-plug not found, installing..."
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim || { 
      warn $'installing vim-plug failed' ; exit 1; }

else
  echo "Vim-plug found, continuing..."
fi

#-------------------------------------------------------------------------------
# Program ends here if you don't have i3.
#-------------------------------------------------------------------------------

# Because the i3config file is in a different place I put this here seperately.
# It just does the same thing, backs up the existing file to dotfiles_old,
# and then creates a symlink from dotfiles/i3config. 

if [ -f "$HOME/.i3status.conf" ] && [ -f "$HOME/.config/i3/config" ] ; then
  echo "Backing up $i3conf to $budir"
  mv ~/.config/i3/config $budir/i3config
  echo "...done"
  echo "Creating symlink to i3config in ~"
  ln -s $dir/$i3conf ~/.config/i3/config
  echo "...done"
fi

#-------------------------------------------------------------------------------
# End Dotfiles section
#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
# Message 
#-------------------------------------------------------------------------------

echo "------------------------------------------------"
echo "------------------------------------------------"
echo " Thanks for using my Script!"
echo " Make sure to exec vim and run :PlugInstall"
echo " Tyler(UnclassedPenguin) 2022"
echo " "
echo "    URL: https://unclassed.ca"
echo " GitHub: https://github.com/unclassedpenguin"
echo "------------------------------------------------"
echo "------------------------------------------------"

#-------------------------------------------------------------------------------
# End Message 
#-------------------------------------------------------------------------------
