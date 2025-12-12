#! /usr/bin/env sh

set -o nounset
set -o errexit

# Set the umask for readwrite only from the current user and read for anyone else
umask 0022

DOTFILE_FOLDER="${1}"

# cleanup files of old shell files
# bash
rm -fr "${HOME}"/.bash*
rm -fr "${HOME}"/.profile
rm -fr "${HOME}"/.aliases

# zsh
rm -fr "${HOME}"/.zsh*
rm -fr "${HOME}"/.zprofile
rm -fr "${HOME}"/.zlog*
rm -fr "${HOME}"/.zcompdump*

# korn shell
rm -fr "${HOME}"/ksh*

# csh
rm -fr "${HOME}"/.csh*
rm -fr "${HOME}"/.tcsh*
rm -fr "${HOME}"/.login
rm -fr "${HOME}"/.history

# symlink the config directory in the home directory
# shellcheck disable=SC2154
rm -fr "${xdg_config_home}"
ln -sf "${DOTFILE_FOLDER}/config/" "${xdg_config_home}"

# shellcheck disable=SC2154
tee "${xdg_config_home}/shell/xdg_support.sh" > /dev/null << EOF
#! /usr/bin/env sh

# XDG Base Directory Specification
export XDG_DATA_HOME=${xdg_data_home}
export XDG_CONFIG_HOME=${xdg_config_home}
export XDG_STATE_HOME=${xdg_state_home}
export XDG_DATA_DIRS=${xdg_data_dirs}
export XDG_CONFIG_DIRS=${xdg_config_dirs}
export XDG_CACHE_HOME=${xdg_cache_home}

# setup workaround for xdg
export WGETRC="\${XDG_CONFIG_HOME}/.wgetrc"
export INPUTRC="\${XDG_CONFIG_HOME}/readline/inputrc"
export DOCKER_CONFIG="\${XDG_CONFIG_HOME}/docker"
export KREW_ROOT="\${XDG_DATA_HOME}/krew"
export BUNDLE_USER_CACHE="${XDG_CACHE_HOME}/bundle"
export BUNDLE_USER_CONFIG="${XDG_CONFIG_HOME}/bundle/config"
export BUNDLE_USER_PLUGIN="${XDG_DATA_HOME}/bundle"
EOF

tee "${HOME}/.zshenv" > /dev/null << EOF
#! /usr/bin/env zsh

source "${xdg_config_home}/shell/xdg_support.sh"

# Change the default directories for zsh
export ZDOTDIR="\${XDG_CONFIG_HOME}/zsh"

source "\${XDG_CONFIG_HOME}/shell/base_export.sh"
EOF

touch "${xdg_config_home}/git/config.private"
cp "${PWD}/.editorconfig" "${HOME}/.editorconfig"
touch "${HOME}/.hushlogin"
