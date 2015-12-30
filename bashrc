#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias stirb='systemctl poweroff'
alias ls='ls --color=auto'
alias sudo='sudo -E'
alias i3lock='i3lock -i ~/Downloads/glider_wallpaper.png'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w $\[\033[00m\] '
complete -cf sudo
complete -cf man
export EDITOR=vim

export PYTHONSTARTUP="$HOME/.pyrc"

#for faster using of systemd/sysv
if ! systemd-notify --booted; then # not using systemd
  start() {
    sudo rc.d start $1
  }

  restart() {
    sudo rc.d restart $1
  }

  stop() {
    sudo rc.d stop $1
  }
else
  start() {
    sudo systemctl start $1
  }

  restart() {
    sudo systemctl restart $1
  }

  stop() {
    sudo systemctl stop $1
  }

  enable() {
    sudo systemctl enable $1
  }

  status() {
    sudo systemctl status $1
  }

  disable() {
    sudo systemctl disable $1
  }
fi
