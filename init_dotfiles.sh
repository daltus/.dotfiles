#!/bin/bash

curdir=${PWD##*/}

if [ $curdir != ".dotfiles" ]
	then
		echo "This script should be run from inside the .dotfiles directory. Exiting."
		exit
fi

file="git-completion.bash"
echo "curl'ing $file from master branch in git's github repo."
curl "https://raw.githubusercontent.com/git/git/master/contrib/completion/$file" -o $file

file="git-prompt.sh"
echo "curl'ing $file from master branch in git's github repo."
curl "https://raw.githubusercontent.com/git/git/master/contrib/completion/$file" -o $file

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
