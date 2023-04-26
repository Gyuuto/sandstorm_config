#!/bin/bash

link_dir_ini=
link_dir_txt=

function check_file () {
    file_path=$1

    if [ -L $1 ]; then
        echo "${1} is symbolic linked file, do nothing."
        return 1
    elif [ -f $1 ]; then
        mv $1 ${1}.bak
        return 0
    fi
}

check_file "${link_dir_ini}/Engine.ini" && ln -s "$(pwd)/Engine.ini" "${link_dir_ini}/Engine.ini"
check_file "${link_dir_ini}/Game.ini" && ln -s "$(pwd)/Game.ini" "${link_dir_ini}/Game.ini"

check_file "${link_dir_txt}/MapCycle.txt" && ln -s "$(pwd)/MapCycle.txt" "${link_dir_txt}/MapCycle.txt"
check_file "${link_dir_txt}/Mods.txt" && ln -s "$(pwd)/Mods.txt" "${link_dir_txt}/Mods.txt"
