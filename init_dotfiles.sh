#!/bin/bash

file=".vimrc"
echo "Overwriting ~/$file"
cp $file ~/$file

file=".gitconfig"
echo "Overwriting ~/$file"
cp $file ~/$file

file=".bashrc"
echo "Overwriting ~/$file"
cp $file ~/$file

file=".bash_profile"
echo "Overwriting ~/$file"
cp $file ~/$file

echo "Sourcing ~/$file"
source ~/$file

echo ".dotfiles init complete!"
exit
