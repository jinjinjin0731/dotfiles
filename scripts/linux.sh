#!/bin/sh

# install pacapt
wget -O /usr/local/bin/pacapt https://github.com/icy/pacapt/raw/ng/pacapt
chmod 755 /usr/local/bin/pacapt
ln -sv /usr/local/bin/pacapt /usr/local/bin/pacman || true

# install autojump-zsh
pacapt -S --noconfirm autojump-zsh

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
