# dotfiles
My dotfiles

#### Install oh my zsh:
[oh-my-zsh link](https://ohmyz.sh/)
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### Install juneplugg vim-plug
[vim-plug link](https://github.com/junegunn/vim-plug)
```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
Make sure after you run this command to execute vim, and then run `:PlugInstall`

!!! install.sh is broken for sure. It needs work. Restructuring. Not gonna bother for now !!!  

#### Todo:
- Add an alias.zsh to zsh folder for ~/oh-my-zsh/custom/ because I always end up creating that and putting same stuff in it...



`install.sh` backs up and creates symlinks for:

- ~/.vimrc
- ~/.zshrc
- ~/.Xresources
- ~/.i3status.conf
- ~/.config/i3/config

Also installs zsh and oh my zsh if not installed. 


Uninstall deletes symlinks and puts everything back.
