#!/bin/bash

dir=~/git/dotfiles
budir=~/git/dotfiles_old
files="vimrc"

echo "Moving to backup directory: $budir"
cd $budir
echo "...done"

for file in $files; do
  echo "Deleting $file symlink"
  rm ~/.$file
  echo "...done"
  echo "Moving $file to ~/.$file"
  mv $file ~/.$file
  echo "...done"
done

echo "Deleting $budir"
cd ..
rm -r $budir
echo "...done! Thanks for playing!"
