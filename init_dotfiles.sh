#!/bin/sh

curdir=${PWD##*/}

if [ $curdir != ".dotfiles" ]
	then
		echo "This script should be run from inside the .dotfiles directory. Exiting."
		exit
fi

file=".vimrc"
echo "Overwriting ~/$file"
cp $file ~/$file

file=".bash_profile"
echo "Overwriting ~/$file"
cp $file ~/$file

file=".gitconfig"
echo "Overwriting ~/$file"
cp $file ~/$file

echo "Sourcing ~/$file"
source ~/$file

echo ".dotfiles init complete!"
exit
