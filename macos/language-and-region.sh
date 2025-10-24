#! /usr/bin/env sh

set -o nounset
set -o errexit

# Set the umask for readwrite only from the current user and read for anyone else
umask 0022

# Configure Language and Region settings
defaults write -g AppleLanguages -array 'en-IT' 'it-IT'
defaults write -g AppleLocale -string 'en_IT'
