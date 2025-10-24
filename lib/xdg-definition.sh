#! /usr/bin/env sh

set -o nounset
set -o errexit

# Set the umask for readwrite only from the current user and read for anyone else
umask 0022

export local_bin="${HOME}/.local/bin"
export xdg_data_home="${XDG_DATA_HOME:-$HOME/.local/share}"
export xdg_config_home="${XDG_CONFIG_HOME:-$HOME/.config}"
export xdg_state_home="${XDG_STATE_HOME:-$HOME/.local/state}"
export xdg_data_dirs="${XDG_DATA_DIRS:-/usr/local/share/:/usr/share/}"
export xdg_config_dirs="${XDG_CONFIG_DIRS:-/etc/xdg}"
export xdg_cache_home="${XDG_CACHE_HOME:-$HOME/.cache}"

# Create the directories that will be not symlinked
mkdir -p "${xdg_data_home}"
mkdir -p "${xdg_state_home}"
mkdir -p "${xdg_cache_home}"
mkdir -p "${HOME}/Developer"
mkdir -p "${xdg_data_home}"/go
