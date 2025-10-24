#! /usr/bin/env sh

set -o nounset
set -o errexit

# Set the umask for readwrite only from the current user and read for anyone else
umask 0022

defaults write com.apple.AdLib allowApplePersonalizedAdvertising -int 0 # Disable personalized ads
defaults write com.apple.AdLib forceLimitAdTracking -bool true # Enable limit ad tracking
