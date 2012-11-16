#!/bin/bash

FILES=( .vimrc .vim .gitconfig .zshrc )
PWD=$(pwd)

for f in ${FILES[@]}
do
    orig="~/$f"
    # Backup:
    if [ -e "$orig.bak" ];
    then
        echo "Backup von $f existiert schon"
    else
        if [ ! -L $orig ]; # falls kein Softlink existiert, wird gebackuppt
        then
            mv -fv $orig{,.bak}
        fi
    fi
    # Softlinks erstellen, aber nur wenn sie noch nicht existieren:
    if [ ! -e $orig ];
    then
        ln -sv "$PWD/$f" ~
    fi
done

# Ordner für vim erstellen:
mkdir ~/.vim/backup
mkdir ~/.vim/tmp
# smyck color scheme verlinken:
ln -s ~/.vim/colors/smyck/smyck.vim ~/.vim/colors/smyck.vim
