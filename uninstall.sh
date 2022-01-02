#!/bin/bash

#---------------------------------------------------------------------------------------------
# Dotfiles installer :)
#
# Written by Tyler(UnclassedPenguin) 2022
# Site: https://unclassed.ca
# Github: https://github.com/UnclassedPenguin
#
#---------------------------------------------------------------------------------------------


#---------------------------------------------------------------------------------------------
# Variables
#---------------------------------------------------------------------------------------------


#---------------------------------------------------------------------------------------------
# Variables
#---------------------------------------------------------------------------------------------

basedir=~/git/                                  # Where you want to put dotfiles_old/
dir=~/git/dotfiles                              # Your dotfiles directory
budir=~/git/dotfiles_old                        # dotfiles_old directory

if [ -f "$HOME/.i3status.conf" ] && [ -f "$HOME/.config/i3/config" ] ; then
  files="i3status.conf vimrc Xresources zshrc"    # Files to symlink
  i3conf=i3config                                 # ~/.config/i3/config name in backup/dotfiles
else
  files="vimrc Xresources zshrc"                  # Files to symlink
fi

#---------------------------------------------------------------------------------------------
# End Variables
#---------------------------------------------------------------------------------------------


#---------------------------------------------------------------------------------------------
# Program start
#---------------------------------------------------------------------------------------------

# Change directory to backup directory

echo "Moving to backup directory: $budir"
cd $budir
echo "...done"

# Delete symlinks and move backed up version back to original place

for file in $files; do
  echo "Deleting $file symlink"
  rm ~/.$file
  echo "...done"
  echo "Moving $file to ~/.$file"
  mv $file ~/.$file
  echo "...done"
done

# Same as above, but different location. Deletes symlink for i3config
# at ~/.config/i3/config and moves back the original file

if [ -f "$HOME/.i3status.conf" ] && [ -f "$HOME/.config/i3/config" ] ; then
  echo "Deleting $i3conf symlink"
  rm ~/.config/i3/config
  echo "...done"
  echo "Moving $i3conf to ~/.config/i3/config"
  mv $i3conf ~/.config/i3/config
  echo "...done"
fi

# Delete backup directory

echo "Deleting $budir"
cd ..
rm -r $budir
echo "...done! Thanks for playing!"

#---------------------------------------------------------------------------------------------
# End Program
#---------------------------------------------------------------------------------------------

