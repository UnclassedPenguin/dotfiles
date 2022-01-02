#!/bin/bash
# Written by Tyler(UnclassedPenguin) 2022
# Site: https://unclassed.ca
# Github: https://github.com/UnclassedPenguin
#

# Variables
dir=~/git/dotfiles                              # Your dotfiles directory
budir=~/git/dotfiles_old                        # dotfiles_old directory
files="i3status.conf vimrc Xresources zshrc"    # Files to unsymlink
i3conf=i3config                                 # ~/.config/i3/config name in backup and dotfiles


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
