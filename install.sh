#!/bin/bash

basedir=~/git/                          # Where you want to put dotfiles_old/
dir=~/git/dotfiles
budir=~/git/dotfiles_old
files="vimrc Xresources zshrc"

echo "Creating $budir for backup of existing files in $basedir"
mkdir -p $budir
echo "...done"

echo "Changing to $dir directory"
cd $dir
echo "...done"

for file in $files; do
  echo "Backing up $file to $budir"
  mv ~/.$file $budir/$file
  echo "...done"
  echo "Creating symlink to $file in homedir"
  ln -s $dir/$file ~/.$file
  echo "...done"
done
