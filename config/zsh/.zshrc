#! /usr/bin/env zsh

[ -d "${XDG_STATE_HOME}/zsh" ] || mkdir -p "${XDG_STATE_HOME}/zsh"
export HISTFILE="${XDG_STATE_HOME}"/zsh/history
[ -d "${XDG_CACHE_HOME}/zsh" ] || mkdir -p "${XDG_CACHE_HOME}/zsh"
typeset -g ZSH_CACHE_DIR="${XDG_CACHE_HOME}/zsh"

source "${XDG_CONFIG_HOME}/shell/xdg_vim.sh"

# Path to your oh-my-zsh installation.
export ZSH="${XDG_DATA_HOME}/oh-my-zsh"

typeset -g ZSH_THEME="robbyrussell"

# Disable bi-weekly auto-update checks.
zstyle ':omz:update' mode disabled

typeset -g ZSH_COMPDUMP="${ZSH_CACHE_DIR}/.zcompdump"
typeset -g DISABLE_UNTRACKED_FILES_DIRTY=true

# Command execution time stamp shown in the history command output.
typeset -g HIST_STAMPS="yyyy-mm-dd"

source "${ZSH}/oh-my-zsh.sh"

if [ -f "${XDG_CONFIG_HOME}/shell/private.sh" ]; then
	source "${XDG_CONFIG_HOME}/shell/private.sh"
fi

source "${XDG_CONFIG_HOME}/shell/aliases.sh"

eval "$(mise activate zsh)"
