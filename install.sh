#!/bin/bash
# link config files to the correct places

HOME=$(cd;pwd)
DOTFILES=$(pwd)
echo "home $HOME"
echo "dotfiles $DOTFILES"
echo "'''''''''''"

function link_home {
	if [[ -e $HOME/$2 ]]; then
		echo [N] file \$HOME/$2 exists, not linking
	else
		echo "linking $1 -> $HOME/$2"
		ln -s $DOTFILES/$1 $HOME/$2
	fi
}

link_home zshrc .zshrc
link_home vimrc .vimrc
mkdir -p $HOME/.i3
link_home i3-config .i3/config
link_home i3status.conf .i3status.conf
