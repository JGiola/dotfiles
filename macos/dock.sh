#! /usr/bin/env sh

set -o nounset
set -o errexit

# Set the umask for readwrite only from the current user and read for anyone else
umask 0022

# Configure Dock settings, left side, no recent apps, minimized to app icon
# magnification on hover, no indicators
defaults write com.apple.dock largesize -int 48
defaults write com.apple.dock magnification -int 1
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.dock orientation -string 'left'
defaults write com.apple.dock show-process-indicators -bool false
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock tilesize -int 32

# Configure Hot Corners, make sure to turn off any existing settings
# and set bottom left to lock screen
defaults write com.apple.dock wvous-tl-corner -int 1
defaults write com.apple.dock wvous-tl-modifier -int 0
defaults write com.apple.dock wvous-tr-corner -int 1
defaults write com.apple.dock wvous-tr-modifier -int 0
defaults write com.apple.dock wvous-bl-corner -int 13
defaults write com.apple.dock wvous-bl-modifier -int 0
defaults write com.apple.dock wvous-br-corner -int 1
defaults write com.apple.dock wvous-br-modifier -int 0
