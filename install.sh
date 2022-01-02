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

basedir=~/git/                                  # Where you want to put dotfiles_old/
dir=~/git/dotfiles                              # Your dotfiles directory
budir=~/git/dotfiles_old                        # dotfiles_old directory

# This section includes i3 config files. Comment out these two lines and the i3 section 
# further down if you aren't using i3
files="i3status.conf vimrc Xresources zshrc"    # Files to symlink
i3conf=i3config                                 # ~/.config/i3/config name in backup/dotfiles

# Uncomment the line below if don't have i3
#files="vimrc Xresources zshrc"    # Files to symlink

#---------------------------------------------------------------------------------------------
# End Variables
#---------------------------------------------------------------------------------------------


#---------------------------------------------------------------------------------------------
# Program start
#---------------------------------------------------------------------------------------------

# Create backup directory

echo "Creating $budir for backup of existing files in $basedir"
mkdir -p $budir
echo "...done"

# Change to backup directory, to copy files here

echo "Changing to $dir directory"
cd $dir
echo "...done"

# Copy all the existing dotfiles into the backup dir, 
# and create symlinks to dotfiles in your git dotfiles folder. 

for file in $files; do
  echo "Backing up $file to $budir"
  mv ~/.$file $budir/$file
  echo "...done"
  echo "Creating symlink to $file in ~"
  ln -s $dir/$file ~/.$file
  echo "...done"
done


#---------------------------------------------------------------------------------------------
# Program ends here if you don't have i3. comment out everything below
#---------------------------------------------------------------------------------------------

# i3 section. Uncomment these following lines if you aren't using i3!!
# Because the i3config file is in a different place I put it here seperately.
# This just does the same thing, backs up the existing file to dotfiles_old,
# and then creates a symlink from dotfiles/i3config. 

echo "Backing up $i3conf to $budir"
mv ~/.config/i3/config $budir/i3config
echo "...done"
echo "Creating symlink to i3config in ~"
ln -s $dir/$i3conf ~/.config/i3/config
echo "...done"

#---------------------------------------------------------------------------------------------
# Program End
#---------------------------------------------------------------------------------------------
