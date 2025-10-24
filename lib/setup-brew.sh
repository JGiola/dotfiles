#! /usr/bin/env sh

set -o nounset
set -o errexit

# Set the umask for readwrite only from the current user and read for anyone else
umask 0022

DOTFILE_FOLDER="${1}"

TMP_DIR="$(mktemp -d)"

if ! /usr/bin/command -v brew > /dev/null 2>&1; then
	curl -fsSL --proto '=https' --tlsv1.2 "https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh" -o "${TMP_DIR}/install-brew.sh" 2> /dev/null
	chmod +x "${TMP_DIR}/install-brew.sh"
	sh -c "${TMP_DIR}/install-brew.sh"
fi

rm -fr "${TMP_DIR}"
eval "$(/opt/homebrew/bin/brew shellenv)"
brew analytics off
brew bundle --file="${DOTFILE_FOLDER}/Brewfile"
