# If not running interactively, don't do anything
[ -z "$PS1" ] && return
[ -n "$BASHRC_LOADED" ] && return
BASHRC_LOADED='YES!'

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# don't add a space after variable completion, expand variable when
# on a path&autocomplete
shopt -s direxpand

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

bind "set bell-style none"

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi


if [ -f ~/.git-completion.bash ]; then
    #git autocompletion
    source ~/.git-completion.bash
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# load profile if not loaded (becarefull to recursive inclusion)
if [ -f ~/.profile ]; then
    . ~/.profile
fi
