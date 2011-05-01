#!/bin/bash

FILES=$(find ~/dotfiles/ -maxdepth 1 -mindepth 1 \! -name ".git" -name ".*")
cd ~
for f in $FILES
do
    #Backup:
    if [ -e $(basename $f).bak ];
    then
        echo "Backup von $f existiert schon"
    else
        if [ ! -h $(basename $f) ]; #falls schon Softlinks existieren, wird nicht gebackuppt
        then
            mv -fv $(basename $f){,.bak}
        fi
    fi
    #Softlinks erstellen:
    ln -sv $f $(basename $f)
done
