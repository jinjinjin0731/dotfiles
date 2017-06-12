#!/bin/bash

echo "---------------------------------------------------------"

DOTFILES=$HOME/dotfiles

## Create ~/.bash_profile if not found
if [ ! -e "$HOME/.bash_profile" ]; then
    touch $HOME/.bash_profile
fi

## Install Submodules
echo -e "\nInitializing submodule(s)"
git submodule update --init --recursive

## Create Symlinks
source $DOTFILES/install/link.sh

## Install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

## Install or Configure OSX
if [ "$(uname)" == "Darwin" ]; then
    echo -e "\n-- Running on OSX"

    echo -e "\nUpdating OSX settings"
    source $DOTFILES/install/osx.sh

    echo -e "\nBrewing all the things"
    source $DOTFILES/install/brew.sh

    # Install Tmux Plugin Manager
    source $DOTFILES/install/tpm.sh

    echo -e "\nSetup Oh My Zsh"
    source $DOTFILES/install/oh-my-zsh.sh
fi

## Changing to zsh
echo -e "\nConfiguring zsh as default shell"
shell_path="$(which zsh)"
if ! grep "$shell_path" /etc/shells > /dev/null 2>&1 ; then
    sudo sh -c "echo $shell_path >> /etc/shells"
fi
chsh -s "$shell_path"

exec zsh

if [ -e $HOME/.zshrc ]; then
    echo -e "Loading zshrc..."
    source $HOME/.zshrc
fi

echo -e "\nDone."
exit 0
