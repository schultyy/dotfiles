#!/bin/bash
if [ -d ~/.vim/bundle/Vundle.vim ] ; then
  echo "Vundle already exists"
else
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/ftplugin ~/.vim/ftplugin

