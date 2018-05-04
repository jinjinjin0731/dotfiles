#!/bin/zh

## Install Oh My Zsh
if [ ! -d $HOME/.oh-my-zsh ] || [ ! -f $HOME/.oh-my-zsh/oh-my-zsh.sh ]; then
    echo -e "\nInstalling Oh My Zsh"
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

DOTFILES=$HOME/dotfiles
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

## Theme
if [ ! -d $ZSH_CUSTOM/themes ]; then
    mkdir -p $ZSH_CUSTOM/themes/
fi
ln -s $DOTFILES/oh-my-zsh/themes/bullet-train.zsh-theme $ZSH_CUSTOM/themes/bullet-train.zsh-theme
ln -s $DOTFILES/oh-my-zsh/themes/bullet-train.zsh-theme $HOME/.oh-my-zsh/themes/bullet-train.zsh-theme

## Plugins
if [ ! -d $ZSH_CUSTOM/plugins ]; then
    mkdir -p $ZSH_CUSTOM/plugins/
fi

if [ ! -d $ZSH_CUSTOM/plugins/nvm-auto ]; then
git clone https://github.com/dijitalmunky/nvm-auto.git $ZSH/custom/plugins/nvm-auto
fi

if [ ! -d $ZSH_CUSTOM/plugins/zsh-better-npm-completion ]; then
    echo -e "\nInstalling zsh-better-npm-completion plugin"
    git clone https://github.com/lukechilds/zsh-better-npm-completion $ZSH_CUSTOM/plugins/zsh-better-npm-completion
fi

if [ ! -d $ZSH_CUSTOM/plugins/zsh-autosuggestions ]; then
    echo -e "\nInstalling zsh-autosuggestions plugin"
    git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
fi