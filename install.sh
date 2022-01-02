#!/bin/bash

basedir=~/git/                          # Where you want to put dotfiles_old/
dir=~/git/dotfiles
budir=~/git/dotfiles_old
files="i3status.conf vimrc Xresources zshrc"
i3conf=i3config

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
  echo "Creating symlink to $file in ~"
  ln -s $dir/$file ~/.$file
  echo "...done"
done

echo "Backing up $i3conf to $budir"
mv ~/.config/i3/config $budir/i3config
echo "...done"
echo "Creating symlink to i3config in ~"
ln -s $dir/$i3conf ~/.config/i3/config
echo "...done"
