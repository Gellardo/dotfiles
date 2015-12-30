#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

xrdb -merge ~/.Xresources

case $1 in
xfce4)
#	exec ck-launch-session dbus-launch --exit-with-session startxfce4
	exec startxfce4
	;;
*)
	/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
	exec i3
	;;
esac
