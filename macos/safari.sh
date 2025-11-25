#! /usr/bin/env sh

set -o nounset
set -o errexit

# Set the umask for readwrite only from the current user and read for anyone else
umask 0022

# Configure Safari default search engine to DuckDuckGo
/usr/libexec/PlistBuddy -c 'Set :NSPreferredWebServices:NSWebServicesProviderWebSearch:NSDefaultDisplayName DuckDuckGo' ~/Library/Preferences/.GlobalPreferences.plist
/usr/libexec/PlistBuddy -c 'Set :NSPreferredWebServices:NSWebServicesProviderWebSearch:NSProviderIdentifier com.duckduckgo' ~/Library/Preferences/.GlobalPreferences.plist
sudo defaults write com.apple.Safari SearchProviderShortName -string 'DuckDuckGo'
sudo defaults write com.apple.Safari HomePage -string 'https://start.duckduckgo.com/'
sudo defaults write com.apple.Safari PrivateSearchEngineUsesNormalSearchEngineToggle -bool true

# Configure Safari downloads settings
sudo defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
sudo defaults write com.apple.Safari DownloadsClearingPolicy -int 2

# Configure Safari general appearance and behavior
sudo defaults write com.apple.Safari HistoryAgeInDaysLimit -int 30
sudo defaults write com.apple.Safari NewWindowBehavior -int 0
sudo defaults write com.apple.Safari EnableNarrowTabs -int 0
sudo defaults write com.apple.Safari ShowFavoritesBar-v2 -bool true
sudo defaults write com.apple.Safari IncludeDevelopMenu -bool true
sudo defaults write com.apple.Safari ReadingListSaveArticlesOfflineAutomatically -bool true
sudo defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
sudo defaults write com.apple.Safari WebKitPreferences.tabFocusesLinks -bool false
sudo defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool false
sudo defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false
sudo defaults write com.apple.Safari ShowOverlayStatusBar -bool true

# Enable Safari developer settings
sudo defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
sudo defaults write com.apple.Safari WebKitPreferences.developerExtrasEnabled -bool true
sudo defaults write com.apple.Safari.SandboxBroker ShowDevelopMenu -bool true

# Here only to reminding me how to enable the internal debug menu, disabled by default
sudo defaults write com.apple.Safari IncludeInternalDebugMenu -bool false
