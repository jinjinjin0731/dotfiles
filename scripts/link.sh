#!/bin/bash

DOTFILES=$HOME/dotfiles

echo -e "\nCreating symlinks"
echo "=============================="
linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )
for file in $linkables ; do
    target="$HOME/.$( basename $file ".symlink" )"
    
    if [ -e $target ]; then
        if [ -L "$target" ]; then
            echo "~${target#$HOME} already exists as a link... Skipping."
        else
            echo "~${target#$HOME} already exists as a file... Create a backup."
            mv $target $target.bak
            ln -s $file $target
        fi
    else
        echo "Creating symlink for $file"
        ln -s $file $target
    fi
done

echo -e "\n\ninstalling to ~/.config"
echo "=============================="
if [ ! -d $HOME/.config ]; then
    echo "Creating ~/.config"
    mkdir -p $HOME/.config
fi

if [ ! "$(ls -A $DOTFILES/config)" ]; then
    echo "No contents in config... Skipping."
else
    for config in $DOTFILES/config/*; do
        if [ "$config" == ".gitkeep" ]; then
            continue
        fi
        target=$HOME/.config/$( basename $config )
        if [ -e $target ]; then
            echo "~${target#$HOME} already exists... Skipping."
        else
            echo "Creating symlink for $config"
            ln -s $config $target
        fi
    done
fi

