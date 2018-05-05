#!/bin/sh

# install pacapt
wget -O /usr/local/bin/pacapt https://github.com/icy/pacapt/raw/ng/pacapt
chmod 755 /usr/local/bin/pacapt
ln -sv /usr/local/bin/pacapt /usr/local/bin/pacman || true

pacapt -S --noconfirm autojump-zsh
