#!/bin/bash

dir=~/git/dotfiles
budir=~/git/dotfiles_old
files="bashrc vimrc zshrc"

echo "Creating $budir for backup of existing files in ~/git/"
mkdir -p $budir
echo "...done"

echo "Changing to $dir directory"
cd $dir
echo "...done"

for file in $files; do
  echo "Moving $file to $budir"
  mv ~/.$file $budir
  echo "Creating symlink to $file in homedir"
  ln -s $dir/$file ~/.$file
done
