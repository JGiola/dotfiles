#! /usr/bin/env sh

set -o nounset
set -o errexit

# Set the umask for readwrite only from the current user
umask 0077

# Check for Homebrew and install it if not found
if ! /usr/bin/command -v brew > /dev/null 2>&1; then
  printf "%sInstalling Homebrew...%s\n" "$(/usr/bin/tput setaf 7)" "$(/usr/bin/tput sgr0)"
  /bin/bash -c "$(curl -qfsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  /usr/local/bin/brew analytics off
else
  printf "%sHomebrew already present, updating...%s\n" "$(/usr/bin/tput setaf 7)" "$(/usr/bin/tput sgr0)"
  /usr/local/bin/brew update
fi

# Ensure that all the listed formulae/casks/apps are installed
/usr/local/bin/brew bundle --file="$(/usr/bin/dirname "${0}")/../Brewfile"
