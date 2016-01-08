#!/bin/bash
# link config files to the correct places

HOME=$(cd;pwd)
# change to dotfiles dir and save dirname to variable
DOTFILES="$( cd "$( dirname "$0" )" && pwd )"
echo "home $HOME"
echo "dotfiles $DOTFILES"
echo "-----------"

function link_home {
	if [[ -e $HOME/$2 ]]; then
		if [[ $(readlink $HOME/$2) != "$DOTFILES/$1" ]]; then
			echo "[W] file \$HOME/$2 exists, not linking"
		fi
	else
		echo "linking $1 -> $HOME/$2"
		ln -s $DOTFILES/$1 $HOME/$2
	fi
}

echo "Start linking files"

link_home zshrc .zshrc
link_home vimrc .vimrc
mkdir -p $HOME/.i3
link_home i3-config .i3/config
link_home i3status.conf .i3status.conf

echo "Successfully done"
