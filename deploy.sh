#! /bin/bash

# If there is new files, add them here
files=(bashrc bash_aliases vimrc gvimrc);

now=$(date +"%Y_%m_%d_%H_%M_%S");

for file in "${files[@]}"
do
    cp ../.$file ./backup/$file\_$now
    cp ./$file ../.$file
done

