#! /usr/bin/env sh

set -o nounset
set -o errexit

# Set the umask for readwrite only from the current user and read for anyone else
umask 0022

# shellcheck disable=SC2154
zsh="${xdg_data_home}/oh-my-zsh"

if [ -d "${zsh}" ]; then
	echo "Oh My Zsh is already installed, skipping..."
	exit 0
fi

TMP_DIR="$(mktemp -d)"

curl -fsSL --proto '=https' --tlsv1.2 https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -o "${TMP_DIR}/install.sh" 2> /dev/null
chmod +x "${TMP_DIR}/install.sh"
ZSH="${zsh}" sh -c "${TMP_DIR}/install.sh" "" --unattended

rm -fr "${TMP_DIR}"
