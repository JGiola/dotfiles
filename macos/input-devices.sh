#! /usr/bin/env sh

set -o nounset
set -o errexit

# Set the umask for readwrite only from the current user and read for anyone else
umask 0022

# Keyboard settings
defaults write -g AppleKeyboardUIMode -int 2
defaults write -g InitialKeyRepeat -int 25
defaults write -g KeyRepeat -int 12
defaults write com.apple.HIToolbox AppleFnUsageType -int 2

# Mouse settings
defaults write -g ContextMenuGesture -bool true

# Trackpad settings
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.dock showAppExposeGestureEnabled -bool true
defaults -currentHost write -g com.apple.mouse.tapBehavior -int 1
defaults -currentHost write -g com.apple.trackpad.trackpadCornerClickBehavior -int 0
