#! /usr/bin/env sh

set -o nounset
set -o errexit

# Set the umask for readwrite only from the current user and read for anyone else
umask 0022

# Configure Finder settings
defaults write -g AppleShowAllExtensions -bool true
defaults write com.apple.finder FXDefaultSearchScope -string 'SCcf'
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder FinderSpawnTab -bool true
defaults write com.apple.finder NewWindowTarget -string 'PfHm'
defaults write com.apple.finder ShowRecentTags -bool false
defaults write com.apple.finder WarnOnEmptyTrash -bool false
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder _FXSortFoldersFirstOnDesktop -bool true
defaults write com.apple.finder FXPreferredViewStyle -string 'Nlsv'
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true

# Confiure Finder info panes
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	Comments -bool false \
	General -bool true \
	MetaData -bool false \
	Name -bool true \
	OpenWith -bool false \
	Privileges -bool true

# avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# set default icon size and grid spacing on desktop
/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:arrangeBy grid' ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:gridSpacing 32' ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:iconSize 48' ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:textSize 13' ~/Library/Preferences/com.apple.finder.plist

# set default settings for column view
/usr/libexec/PlistBuddy -c 'Set :StandardViewOptions:ColumnViewOptions:ArrangeBy dnam' ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c 'Set :StandardViewOptions:ColumnViewOptions:ColumnShowFolderArrow 1' ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c 'Set :StandardViewOptions:ColumnViewOptions:ColumnShowIcons 1' ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c 'Set :StandardViewOptions:ColumnViewOptions:ColumnWidth 245' ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c 'Set :StandardViewOptions:ColumnViewOptions:FontSize 13' ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c 'Set :StandardViewOptions:ColumnViewOptions:PreviewDisclosureState 1' ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c 'Set :StandardViewOptions:ColumnViewOptions:SharedArrangeBy kipl' ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c 'Set :StandardViewOptions:ColumnViewOptions:ShowIconThumbnails 1' ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c 'Set :StandardViewOptions:ColumnViewOptions:ShowPreview 1' ~/Library/Preferences/com.apple.finder.plist
