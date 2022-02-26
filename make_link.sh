#!/bin/bash

link_dir_ini=
link_dir_txt=

function check_file () {
    file_path=$1

    if [ -e $1 ]; then
        mv $1 ${1}.bak
        rm $1
    fi
}

check_file "${link_dir_ini}/Engine.ini"
ln -s ./Engine.ini ${link_dir_ini}/Engine.ini
check_file "${link_dir_ini}/Game.ini"
 ln -s ./Game.ini ${link_dir_ini}/Game.ini

check_file "${link_dir_txt}/MapCycle.txt"
ln -s ./MapCycle.txt ${link_dir_txt}/MapCycle.txt
check_file "./Mods.txt ${link_dir_txt}/Mods.txt"
ln -s ./Mods.txt ${link_dir_txt}/Mods.txt
