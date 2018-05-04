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
fi

echo -e "\nSetup Oh My Zsh"
source $DOTFILES/install/oh-my-zsh.sh

## Create Symlinks
source $DOTFILES/install/link.sh

## Changing to zsh
echo -e "\nConfiguring zsh as default shell"
TEST_CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
if [ "$TEST_CURRENT_SHELL" != "zsh" ]; then
    # If this platform provides a "chsh" command (not Cygwin), do it, man!
    if hash chsh >/dev/null 2>&1; then
        printf "Time to change your default shell to zsh!\n"
        chsh -s $(grep /zsh$ /etc/shells | tail -1)
    # Else, suggest the user do so manually.
    else
        printf "I can't change your shell automatically because this system does not have chsh.\n"
        printf "Please manually change your default shell to zsh!\n"
    fi
fi

echo '         __                                     __   '
echo '  ____  / /_     ____ ___  __  __   ____  _____/ /_  '
echo ' / __ \/ __ \   / __ `__ \/ / / /  /_  / / ___/ __ \ '
echo '/ /_/ / / / /  / / / / / / /_/ /    / /_(__  ) / / / '
echo '\____/_/ /_/  /_/ /_/ /_/\__, /    /___/____/_/ /_/  '
echo '                        /____/                       ....is now installed!'

exec zsh

if [ -e $HOME/.zshrc ]; then
    echo -e "Loading zshrc..."
    source $HOME/.zshrc
fi

echo -e "\nDone."
exit 0
