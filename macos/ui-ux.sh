#! /usr/bin/env sh

set -o nounset
set -o errexit

# Set the umask for readwrite only from the current user and read for anyone else
umask 0022

# Confiure general appearance and behavior settings
defaults write -g AppleAccentColor -int 3
defaults write -g AppleHighlightColor -string '0.752941 0.964706 0.678431 Green'
defaults write -g AppleInterfaceStyleSwitchesAutomatically -bool true
defaults write -g AppleReduceDesktopTinting -bool false
defaults write -g NSTableViewDefaultSizeMode -int 2
defaults write -g AppleActionOnDoubleClick -string 'Fill'
defaults write -g NSCloseAlwaysConfirmsChanges -bool true
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true

# Configure Stage Manager and Spaces settings
defaults write com.apple.WindowManager AppWindowGroupingBehavior -bool true
defaults write com.apple.WindowManager AutoHide -bool false
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool true
defaults write com.apple.WindowManager EnableTiledWindowMargins -bool false
defaults write com.apple.WindowManager HideDesktop -bool true
defaults write com.apple.WindowManager StageManagerHideWidgets -bool false
defaults write com.apple.WindowManager StandardHideWidgets -bool false

# Configure sound settings
defaults write -g com.apple.sound.beep.sound -string '/System/Library/Sounds/Sosumi.aiff'
defaults write -g com.apple.sound.beep.volume -float 0.5
defaults write -g com.apple.sound.beep.flash -int 0

# Set screensaver to start after 5 minutes of inactivity
defaults -currentHost write com.apple.screensaver idleTime -int 300
