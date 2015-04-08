#!/bin/bash
if [ -d ~/.vim/bundle/Vundle.vim ] ; then
  echo "Vundle already exists"
else
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

if [ -f ~/.vimrc ] ; then
  echo "Found existing .vimrc. Moving to ~/.vimrc.old"
  mv ~/.vimrc ~/.vimrc.old
fi
ln -s ~/dotfiles/.vimrc ~/.vimrc

if [ -f ~/.zshrc ] ; then
  echo "Found existing .zshrc. Moving to ~/.zshrc.old"
  mv ~/.zshrc ~/.zshrc.old
fi
ln -s ~/dotfiles/.zshrc ~/.zshrc

if [ -d ~/.vim/ftplugin ] ; then
  echo "Found existing ~/.vim/ftplugin. Moving to ~/.vim/ftplugin_old"
  mv ~/.vim/ftplugin ~/.vim/ftplugin_old
fi
ln -s ~/dotfiles/ftplugin ~/.vim/ftplugin

if [ -f ~/.gitconfig ] ; then
  echo "Found existing ~/.gitconfig. Moving to ~/.gitconfig.old"
  mv ~/.gitconfig ~/.gitconfig.old
fi
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
