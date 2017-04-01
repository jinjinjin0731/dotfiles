#!/bin/bash

echo "---------------------------------------------------------"

DOTFILES=$HOME/dotfiles

## Install Submodules
echo -e "\nInitializing submodule(s)"
git submodule update --init --recursive

## Create Symlinks
source $DOTFILES/install/link.sh

## Create ~/.bash_profile if not found
if [ ! -e "$HOME/.bash_profile" ]; then
    touch $HOME/.bash_profile
fi

## Install or Configure OSX
if [ "$(uname)" == "Darwin" ]; then
    echo -e "\n-- Running on OSX"

    if [ ! -d $HOME/.oh-my-zsh ]; then
        echo -e "\nInstalling Oh My Zsh"
        sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    fi

    ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
    ### Oh My Zsh
    if [ ! -d $ZSH_CUSTOM/themes ]; then
        mkdir -p $ZSH_CUSTOM/themes/
    fi
    ln -s $DOTFILES/oh-my-zsh/themes/bullet-train.zsh-theme $ZSH_CUSTOM/themes/bullet-train.zsh-theme
    ln -s $DOTFILES/oh-my-zsh/themes/bullet-train.zsh-theme $HOME/.oh-my-zsh/themes/bullet-train.zsh-theme
    if [ ! -d $ZSH_CUSTOM/plugins ]; then
        mkdir -p $ZSH_CUSTOM/plugins/
    fi

    echo -e "\nInstalling nvm-auto plugin"
    git clone https://github.com/dijitalmunky/nvm-auto.git $ZSH_CUSTOM/plugins/nvm-auto

    echo -e "\nInstalling zsh-autosuggestions plugin"
    git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

    echo -e "\nBrewing all the things"
    source $DOTFILES/install/brew.sh

    echo -e "\nUpdating OSX settings"
    source $DOTFILES/install/osx.sh
fi

## Changing to zsh
echo -e "\nConfiguring zsh as default shell"
chsh -s $(which zsh)

echo -e "\nDone."
echo -e "You should reload oh-my-zsh with command: \n\tsource ~/.zshrc"
exit 0
