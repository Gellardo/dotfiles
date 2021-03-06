ZDOTDIR=${ZDOTDIR:-${HOME}}
HISTFILE="${ZDOTDIR}/.zsh_history"
HISTSIZE='10000'
SAVEHIST="${HISTSIZE}"
if hash nvim 2>/dev/null; then
	export EDITOR='/usr/bin/nvim'
else
	export EDITOR='/usr/bin/vim'
fi
bindkey -e # use emacs bindings to edit lines

export GOPATH="$HOME/workspace/go"
path+=("$HOME/bin")
export PATH

# prompt setup
# using color names
autoload -U colors && colors
# extend prompt with git information
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%b'

PROMPT="%{$fg[green]%}%n@%M%{%b$reset_color%} %{$fg[blue]%}%~ %# %{%b$reset_color%}"
RPROMPT="%{$fg[cyan]%}\$vcs_info_msg_0_%{%b$reset_color%}[%{$fg_no_bold[green]%}%?%{$reset_color%}]"

# completion
autoload -U compinit
compinit
# complete using the white field for arrows
zstyle ':completion:*' menu select
# complete aliases
setopt completealiases

# Ignore lines prefixed with '#'.
setopt interactivecomments

# History
# Ignore duplicate in history.
setopt hist_ignore_dups
# Prevent record in history entry if preceding them with at least one space
setopt hist_ignore_space

#tryout from grml
setopt nobeep
setopt noshwordsplit

alias stirb='systemctl poweroff'
alias ls='ls --color=auto --human-readable'
alias lsl='ls --color=auto --human-readable -l'
alias grep='grep --color=auto'
alias sudo='sudo -E '
alias i3lock='i3lock -c 000000 -i ~/.i3lock.png -t'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias vim=nvim

# bind ^R wie in bash
bindkey "^R" history-incremental-search-backward
# search through lines with the same beginning
bindkey "^N" history-beginning-search-backward
bindkey "^P" history-beginning-search-forward

# fix delete button in insert mode (bk -a for normal mode also)
bindkey '^[[3~' delete-char

#start autojump if available
[[ -e /etc/profile.d/autojump.zsh ]] && source /etc/profile.d/autojump.zsh

