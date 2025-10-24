#! /usr/bin/env sh

set -o nounset
set -o errexit

# Set the umask for readwrite only from the current user and read for anyone else
umask 0022

DOTFILE_FOLDER="${1}"

# Show the ~/Library folder
chflags nohidden ~/Library

# Close affected applications for avoiding the settings overwriting
for app in Finder Dock Mail Photos Safari iTunes iCal Address\ Book SystemUIServer System\ Preferences; do
  osascript -e "tell application \"${app}\" to quit"
done

sh -c "${DOTFILE_FOLDER}/macos/apps.sh"
sh -c "${DOTFILE_FOLDER}/macos/dock.sh"
sh -c "${DOTFILE_FOLDER}/macos/finder.sh"
sh -c "${DOTFILE_FOLDER}/macos/input-devices.sh"
sh -c "${DOTFILE_FOLDER}/macos/language-and-region.sh"
sh -c "${DOTFILE_FOLDER}/macos/safari.sh"
sh -c "${DOTFILE_FOLDER}/macos/security-and-privacy.sh"
sh -c "${DOTFILE_FOLDER}/macos/set-terminal-theme.applescript"
sh -c "${DOTFILE_FOLDER}/macos/ui-ux.sh"
