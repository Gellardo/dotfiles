#!/bin/bash
# link config files to the correct places

HOME=$(cd;pwd)
DOTFILES=$(pwd)
echo "home $HOME"
echo "dotfiles $DOTFILES"

function link_home {
	if [[ -e $HOME/$2 ]]; then
		echo [W] file $2 exists, not linking
	else
		echo do stuff
		echo $DOTFILES/$1 $HOME/$2
	fi
}

link_home zshrc .zshrc
link_home vimrc .vimrc
