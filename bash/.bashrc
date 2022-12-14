#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto --group-directories-first'
alias games='cd ~/games/installati/'
alias gamesdl='cd ~/games/downloads/'
alias dotf='cd ~/.dotfiles/'
alias disk='cd /mnt/disk/'

# Startup Scripts. Located in ~/.local/bin/
remaps

# Function that, when called, creates a dir and directly cd in it
function mkdcd () {
	mkdir -p $1
	cd $_
}

# Function that, when called, removes a directory even if not empty
function rmd () {
	rm -r $1
}

PS1='[\u@\h \W]\$ '



