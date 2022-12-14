#
# ~/.bash_profile
#

export PATH=$HOME/.local/bin:$PATH
export EDITOR=/usr/bin/vim

#NPM
NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$PATH:$NPM_PACKAGES/bin"

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# Lutris: skip update search
export LUTRIS_SKIP_INIT=1


[[ -f ~/.bashrc ]] && . ~/.bashrc

# Starts Xorg
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	exec startx
fi
