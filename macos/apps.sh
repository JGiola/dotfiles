#! /usr/bin/env sh

set -o nounset
set -o errexit

# Set the umask for readwrite only from the current user and read for anyone else
umask 0022

# Prevent the App Store from nagging for reviews
defaults write com.apple.AppStore "InAppReviewEnabled" -bool false

# Set default country in Contacts to Italy
sudo defaults write com.apple.AddressBook ABDefaultAddressCountryCode -string 'it'

# Show week numbers in Calendar
defaults write com.apple.iCal 'Show Week Numbers' -bool true

# Configure Music playback quality settings
sudo defaults write com.apple.Music losslessEnabled -bool true
sudo defaults write com.apple.Music preferredDolbyAtmosPlaySetting -int 30
sudo defaults write com.apple.Music preferredDownloadAudioQuality -int 15
sudo defaults write com.apple.Music preferredStreamPlaybackAudioQuality -int 15
sudo defaults write com.apple.Music userWantsPlaybackNotifications -bool false

# Configure screenshot settings
# shellcheck disable=SC2088
defaults write com.apple.screencapture location -string "~/Desktop"
defaults write com.apple.screencapture show-thumbnail -bool false
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture type -string 'png'
