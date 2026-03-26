#!/bin/bash

#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#
# Tyler(UnclassedPenguin) Dotfiles Uninstaller 2022
#
# Author: Tyler(UnclassedPenguin)
#    URL: https://unclassed.ca
# GitHub: https://github.com/UnclassedPenguin
#
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------


#---------------------------------------------------------------------------------------------
# Variables
#---------------------------------------------------------------------------------------------

# Where you want to put dotfiles_old/
basedir=~/git/

# Your dotfiles directory
dir=~/git/dotfile

# dotfiles_old directory
budir=~/git/dotfiles_old

if [ -f "$HOME/.i3status.conf" ] && [ -f "$HOME/.config/i3/config" ] ; then
  # Files to symlink
  files="i3status.conf vimrc Xresources zshrc"    

  # ~/.config/i3/config name in backup/dotfiles
  i3conf=i3config                                 

else
  # Files to symlink
  files="vimrc Xresources zshrc"                  

fi

#---------------------------------------------------------------------------------------------
# End Variables
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

#-------------------------------------------------------------------------------
# Message 
#-------------------------------------------------------------------------------

echo "------------------------------------------------"
echo "------------------------------------------------"
echo " Thanks for using my Script!"
echo " Tyler(UnclassedPenguin) 2022"
echo " "
echo "    URL: https://unclassed.ca"
echo " GitHub: https://github.com/unclassedpenguin"
echo "------------------------------------------------"
echo "------------------------------------------------"

#-------------------------------------------------------------------------------
# End Message 
#-------------------------------------------------------------------------------
