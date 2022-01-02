#!/bin/bash

dir=~/git/dotfiles
budir=~/git/dotfiles_old
files="i3status.conf vimrc Xresources zshrc"
i3conf=i3config

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

echo "Deleting $i3conf symlink"
rm ~/.config/i3/config
echo "...done"
echo "Moving $i3conf to ~/.config/i3/config"
mv $i3conf ~/.config/i3/config
echo "...done"

echo "Deleting $budir"
cd ..
rm -r $budir
echo "...done! Thanks for playing!"
