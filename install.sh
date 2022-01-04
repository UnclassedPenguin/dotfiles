#!/bin/bash
#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
# Dotfiles installer :)
#
# Written by Tyler(UnclassedPenguin) 2022
# Site: https://unclassed.ca
# Github: https://github.com/UnclassedPenguin
#
#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------


#---------------------------------------------------------------------------------------------
# Variables
#---------------------------------------------------------------------------------------------

basedir=~/git/                                  # Where you want to put dotfiles_old/
dir=~/git/dotfiles                              # Your dotfiles directory
budir=~/git/dotfiles_old                        # dotfiles_old directory

echo "Checking for i3..."
if [ -f "$HOME/.i3status.conf" ] && [ -f "$HOME/.config/i3/config" ] ; then
  echo "i3 Detected..."
  files="i3status.conf vimrc Xresources zshrc"    # Files to symlink
  i3conf=i3config                                 # ~/.config/i3/config name in backup/dotfiles
else
  echo "i3 Not Detected..."
  files="vimrc Xresources zshrc"                  # Files to symlink
fi

#---------------------------------------------------------------------------------------------
# End Variables
#---------------------------------------------------------------------------------------------


#---------------------------------------------------------------------------------------------
# Program start
#---------------------------------------------------------------------------------------------


#---------------------------------------------------------------------------------------------
# ZSH section 
#---------------------------------------------------------------------------------------------

# Next section checks for zsh bin and if not there installs it

echo "Looking for Zsh..."

if [ ! -f "/bin/zsh" ] ; then
  # Install zsh
  echo "Zsh Not Found, installing..."
  echo "Updating resources..."
  sudo apt update || { echo 'apt update failed' ; exit 1; }
  echo "Update finished..."
  echo "Installing Zsh..."
  sudo apt install zsh -y || { echo 'apt install zsh failed' ; exit 1; }
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
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  echo "...done installing zsh"
else
  echo "Oh My Zsh found, continuing..."
fi

if [ -d "$HOME/.oh-my-zsh/custom/themes" ] ; then
  echo "Setting Zsh Theme..."
  ln -s $dir/tyler.zsh-theme $HOME/.oh-my-zsh/custom/themes/tyler.zsh-theme 
  echo "...done"
fi

#---------------------------------------------------------------------------------------------
# End ZSH section
#---------------------------------------------------------------------------------------------


#---------------------------------------------------------------------------------------------
# Dotfiles section
#---------------------------------------------------------------------------------------------

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
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
  echo "Vim-plug found, continuing..."
fi

#---------------------------------------------------------------------------------------------
# Program ends here if you don't have i3.
#---------------------------------------------------------------------------------------------

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

#---------------------------------------------------------------------------------------------
# End Dotfiles section
#---------------------------------------------------------------------------------------------


#---------------------------------------------------------------------------------------------
# Message 
#---------------------------------------------------------------------------------------------

echo "------------------------------------------------"
echo "------------------------------------------------"
echo " Thanks for using my Script!"
echo " Make sure to exec vim and run :PlugInstall!"
echo " Tyler(UnclassedPenguin 2022"
echo "------------------------------------------------"
echo "------------------------------------------------"

#---------------------------------------------------------------------------------------------
# End Message 
#---------------------------------------------------------------------------------------------


#---------------------------------------------------------------------------------------------
# Program End
#---------------------------------------------------------------------------------------------
