#! /usr/bin/env sh

# setup the locale
export LC_ALL="en_US.UTF-8"

# setup EDITOR
export EDITOR="vim"
export SUDO_EDITOR="${EDITOR}"

# setup PAGER
export PAGER="less"

# setup TERM colors
export TERM="xterm-256color"

# setup paths
export GOPATH="${XDG_DATA_HOME}/go"
export PATH="${KREW_ROOT}/bin:${HOME}/.local/bin:${PATH}"
export MANPATH="/usr/local/man:${MANPATH}"
