#!/bin/bash

curdir=${PWD##*/}

if [ $curdir != ".dotfiles" ]
	then
		echo "This script should be run from inside the .dotfiles directory. Exiting."
		exit
fi

# Use files for git 2.17.1
gitver="v2.17.1"

file="git-completion.bash"
echo "curl'ing $file from master branch in git's github repo."
curl "https://raw.githubusercontent.com/git/git/$gitver/contrib/completion/$file" -o $file

file="git-prompt.sh"
echo "curl'ing $file from master branch in git's github repo."
curl "https://raw.githubusercontent.com/git/git/$gitver/contrib/completion/$file" -o $file

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
