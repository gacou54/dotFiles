#! /bin/bash

now=$(date +"%Y_%m_%d_%H_%M_%S");

cp ./init.vim ./backup/init.vim\_$now
cp ~/.config/nvim/init.vim ./

