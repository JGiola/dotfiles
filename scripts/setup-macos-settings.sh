#! /usr/bin/env sh
# Bring the system to be in line with a set of /usr/bin/defaults

set -o nounset
set -o errexit

# Set the umask for readwrite only from the current user
umask 0077

# Close affected applications for avoiding the settings overwriting
for app in Finder Dock Mail Safari iTunes iCal Address\ Book SystemUIServer System\ Preferences; do
  /usr/bin/osascript -e "tell application \"${app}\" to quit"
done

# Ask for the administrator password upfront
/usr/bin/sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do /usr/bin/sudo -n true; /bin/sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

## Show the ~/Library folder
/usr/bin/chflags nohidden ~/Library

# NSGlobalDomain
/usr/bin/defaults write NSGlobalDomain "AppleAccentColor" -int 3
/usr/bin/defaults write NSGlobalDomain "AppleActionOnDoubleClick" -string "Maximize"
/usr/bin/defaults write NSGlobalDomain "AppleAntiAliasingThreshold" -int 4
/usr/bin/defaults write NSGlobalDomain "AppleAquaColorVariant" -int 1
/usr/bin/defaults write NSGlobalDomain "AppleEnableMouseSwipeNavigateWithScrolls" -bool true
/usr/bin/defaults write NSGlobalDomain "AppleHighlightColor" -string "0.752941 0.964706 0.678431 Green"
/usr/bin/defaults write NSGlobalDomain "AppleKeyboardUIMode" -int 2
/usr/bin/defaults write NSGlobalDomain "AppleLanguages" -array "en-US" "it-IT"
/usr/bin/defaults write NSGlobalDomain "AppleLocale" -string "en_IT"
/usr/bin/defaults write NSGlobalDomain "AppleMeasurementUnits" -string "Centimeters"
/usr/bin/defaults write NSGlobalDomain "AppleMetricUnits" -bool true
/usr/bin/defaults write NSGlobalDomain "AppleMiniaturizeOnDoubleClick" -bool false
/usr/bin/defaults write NSGlobalDomain "AppleScrollerPagingBehavior" -bool true
/usr/bin/defaults write NSGlobalDomain "AppleShowScrollBars" -string "WhenScrolling"
/usr/bin/defaults write NSGlobalDomain "AppleShowAllExtensions" -bool true
/usr/bin/defaults write NSGlobalDomain "AppleTemperatureUnit" -string "Celsius"
/usr/bin/defaults write NSGlobalDomain "AppleWindowTabbingMode" -string "fullscreen"
/usr/bin/defaults write NSGlobalDomain "NSAutomaticCapitalizationEnabled" -bool false
/usr/bin/defaults write NSGlobalDomain "NSAutomaticDashSubstitutionEnabled" -bool true
/usr/bin/defaults write NSGlobalDomain "NSAutomaticPeriodSubstitutionEnabled" -bool true
/usr/bin/defaults write NSGlobalDomain "NSAutomaticQuoteSubstitutionEnabled" -bool true
/usr/bin/defaults write NSGlobalDomain "NSAutomaticSpellingCorrectionEnabled" -bool true
/usr/bin/defaults write NSGlobalDomain "NSAutomaticTextCompletionEnabled" -bool true
/usr/bin/defaults write NSGlobalDomain "NSCloseAlwaysConfirmsChanges" -bool false
/usr/bin/defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool false
/usr/bin/defaults write NSGlobalDomain "NSNavPanelExpandedStateForSaveMode" -bool true
/usr/bin/defaults write NSGlobalDomain "NSNavPanelExpandedStateForSaveMode2" -bool true
/usr/bin/defaults write NSGlobalDomain "NSPersonNameDefaultShortNameEnabled" -int 1
/usr/bin/defaults write NSGlobalDomain "NSPersonNameDefaultShortNameFormat" -int 2
# It seems that this will do nothing to Safari ¯\_(ツ)_/¯
#/usr/bin/defaults write NSGlobalDomain "NSPreferredWebServices" -dict \
#  "NSWebServicesProviderWebSearch" '{ NSDefaultDisplayName = "DuckDuckGo"; NSProviderIdentifier = "com.duckduckgo"; }'
/usr/bin/defaults write NSGlobalDomain "NSQuitAlwaysKeepsWindows" -bool true
/usr/bin/defaults write NSGlobalDomain "NSTableViewDefaultSizeMode" -int 1
/usr/bin/defaults write NSGlobalDomain "NSTextShowsControlCharacters" -bool true
/usr/bin/defaults write NSGlobalDomain "PMPrintingExpandedStateForPrint" -bool true
/usr/bin/defaults write NSGlobalDomain "PMPrintingExpandedStateForPrint2" -bool true
/usr/bin/defaults write NSGlobalDomain "com.apple.sound.beep.flash" -int 0
/usr/bin/defaults write NSGlobalDomain "com.apple.sound.beep.sound" -string "/System/Library/Sounds/Sosumi.aiff"
/usr/bin/defaults write NSGlobalDomain "com.apple.sound.beep.volume" -float 0.5
/usr/bin/defaults write NSGlobalDomain "com.apple.springing.delay" -float 0.5
/usr/bin/defaults write NSGlobalDomain "com.apple.springing.enabled" -bool true
/usr/bin/defaults write NSGlobalDomain "com.apple.trackpad.forceClick" -bool true
/usr/bin/defaults write NSGlobalDomain "userMenuExtraStyle" -int 1

# com.apple.AdLib
/usr/bin/defaults write com.apple.AdLib "forceLimitAdTracking" -bool true

# com.apple.AddressBook
/usr/bin/defaults write com.apple.AddressBook "ABDefaultAddressCountryCode" -string "it"
/usr/bin/defaults write com.apple.AddressBook "ABNicknameVisible" -int 1

# com.apple.AppleMultitouchMouse
/usr/bin/defaults write com.apple.AppleMultitouchMouse "MouseButtonDivision" -int 55
/usr/bin/defaults write com.apple.AppleMultitouchMouse "MouseButtonMode" -string "TwoButton"
/usr/bin/defaults write com.apple.AppleMultitouchMouse "MouseHorizontalScroll" -bool true
/usr/bin/defaults write com.apple.AppleMultitouchMouse "MouseMomentumScroll" -bool true
/usr/bin/defaults write com.apple.AppleMultitouchMouse "MouseOneFingerDoubleTapGesture" -int 1
/usr/bin/defaults write com.apple.AppleMultitouchMouse "MouseTwoFingerDoubleTapGesture" -int 3
/usr/bin/defaults write com.apple.AppleMultitouchMouse "MouseTwoFingerHorizSwipeGesture" -int 2
/usr/bin/defaults write com.apple.AppleMultitouchMouse "MouseVerticalScroll" -bool true

# com.apple.AppleMultitouchTrackpad
/usr/bin/defaults write com.apple.AppleMultitouchTrackpad "ActuateDetents" -int 1
/usr/bin/defaults write com.apple.AppleMultitouchTrackpad "ActuationStrength" -int 1
/usr/bin/defaults write com.apple.AppleMultitouchTrackpad "Clicking" -bool true
/usr/bin/defaults write com.apple.AppleMultitouchTrackpad "Dragging" -bool false
/usr/bin/defaults write com.apple.AppleMultitouchTrackpad "TrackpadFiveFingerPinchGesture" -int 2
/usr/bin/defaults write com.apple.AppleMultitouchTrackpad "TrackpadFourFingerHorizSwipeGesture" -int 2
/usr/bin/defaults write com.apple.AppleMultitouchTrackpad "TrackpadFourFingerPinchGesture" -int 2
/usr/bin/defaults write com.apple.AppleMultitouchTrackpad "TrackpadFourFingerVertSwipeGesture" -int 2
/usr/bin/defaults write com.apple.AppleMultitouchTrackpad "TrackpadHorizScroll" -int 1
/usr/bin/defaults write com.apple.AppleMultitouchTrackpad "TrackpadMomentumScroll" -bool true
/usr/bin/defaults write com.apple.AppleMultitouchTrackpad "TrackpadPinch" -int 1
/usr/bin/defaults write com.apple.AppleMultitouchTrackpad "TrackpadRightClick" -bool true
/usr/bin/defaults write com.apple.AppleMultitouchTrackpad "TrackpadRotate" -int 1
/usr/bin/defaults write com.apple.AppleMultitouchTrackpad "TrackpadScroll" -bool true
/usr/bin/defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerDrag" -bool true
/usr/bin/defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerHorizSwipeGesture" -int 0
/usr/bin/defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerTapGesture" -int 0
/usr/bin/defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerVertSwipeGesture" -int 0
/usr/bin/defaults write com.apple.AppleMultitouchTrackpad "TrackpadTwoFingerDoubleTapGesture" -int 1
/usr/bin/defaults write com.apple.AppleMultitouchTrackpad "TrackpadTwoFingerFromRightEdgeSwipeGesture" -int 3

# com.apple.Chess
/usr/bin/defaults write com.apple.Chess "Black" -string "Computer"
/usr/bin/defaults write com.apple.Chess "Event" -string "Casual Game"
/usr/bin/defaults write com.apple.Chess "MBCBoardStyle" -string "Wood"
/usr/bin/defaults write com.apple.Chess "MBCPieceStyle" -string "Metal"
/usr/bin/defaults write com.apple.Chess "MBCSearchTime" -float 2

# com.apple.FontBook
/usr/bin/defaults write com.apple.FontBook "FBDefaultInstallDomainRef" -int 3
/usr/bin/defaults write com.apple.FontBook "FBResolveByMovingToTrashKey" -bool true

# com.apple.Notes
/usr/bin/defaults write com.apple.Notes "hasShownWelcomeScreen" -bool true

# com.apple.Safari
/usr/bin/defaults write com.apple.Safari "AutoOpenSafeDownloads" -bool false
/usr/bin/defaults write com.apple.Safari "DownloadsClearingPolicy" -int 2
/usr/bin/defaults write com.apple.Safari "HistoryAgeInDaysLimit" -int 31
/usr/bin/defaults write com.apple.Safari "HomePage" -string "https://start.duckduckgo.com/"
/usr/bin/defaults write com.apple.Safari "IncludeDevelopMenu" -bool true
/usr/bin/defaults write com.apple.Safari "IncludeInternalDebugMenu" -bool true
/usr/bin/defaults write com.apple.Safari "ReadingListSaveArticlesOfflineAutomatically" -bool true
/usr/bin/defaults write com.apple.Safari "ShowFavoritesBar-v2" -bool true
/usr/bin/defaults write com.apple.Safari "ShowFullURLInSmartSearchField" -bool true
/usr/bin/defaults write com.apple.Safari "ShowIconsInTabs" -bool true
/usr/bin/defaults write com.apple.Safari "ShowOverlayStatusBar" -bool true
/usr/bin/defaults write com.apple.Safari "WebKitDeveloperExtrasEnabledPreferenceKey" -bool true
/usr/bin/defaults write com.apple.Safari \
  "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true

# com.apple.TextEdit
/usr/bin/defaults write com.apple.TextEdit "CheckGrammarWithSpelling" -bool true
/usr/bin/defaults write com.apple.TextEdit "WidthInChars" -int 120

# com.apple.bird
/usr/bin/defaults write com.apple.bird "optimize-storage" -bool false

# com.apple.commerce
/usr/bin/defaults write com.apple.commerce "InAppReviewEnabled" -bool false

# com.apple.dashboard
/usr/bin/defaults write com.apple.dashboard "mcx-disabled" -bool true

# com.apple.desktopservices
/usr/bin/defaults write com.apple.desktopservices "DSDontWriteNetworkStores" -bool true
/usr/bin/defaults write com.apple.desktopservices "DSDontWriteUSBStores" -bool true

# com.apple.dock
/usr/bin/defaults write com.apple.dock "autohide" -bool false
/usr/bin/defaults write com.apple.dock "expose-group-apps" -bool true
/usr/bin/defaults write com.apple.dock "largesize" -float 50
/usr/bin/defaults write com.apple.dock "launchanim" -bool true
/usr/bin/defaults write com.apple.dock "magnification" -bool true
/usr/bin/defaults write com.apple.dock "mineffect" -string "genie"
/usr/bin/defaults write com.apple.dock "minimize-to-application" -bool true
/usr/bin/defaults write com.apple.dock "mod-count" -int 38
/usr/bin/defaults write com.apple.dock "mru-spaces" -bool false
/usr/bin/defaults write com.apple.dock "orientation" -string "left"
/usr/bin/defaults write com.apple.dock "show-process-indicators" -bool false
/usr/bin/defaults write com.apple.dock "show-recents" -bool false
/usr/bin/defaults write com.apple.dock "showAppExposeGestureEnabled" -bool true
/usr/bin/defaults write com.apple.dock "showMissionControlGestureEnabled" -bool true
/usr/bin/defaults write com.apple.dock "tilesize" -float 32
/usr/bin/defaults write com.apple.dock "wvous-bl-corner" -int 10
/usr/bin/defaults write com.apple.dock "wvous-bl-modifier" -int 0

# com.apple.driver.AppleBluetoothMultitouch.mouse
/usr/bin/defaults write com.apple.driver.AppleBluetoothMultitouch.mouse "MouseButtonDivision" -int 55
/usr/bin/defaults write com.apple.driver.AppleBluetoothMultitouch.mouse "MouseButtonMode" -string "TwoButton"
/usr/bin/defaults write com.apple.driver.AppleBluetoothMultitouch.mouse "MouseHorizontalScroll" -bool true
/usr/bin/defaults write com.apple.driver.AppleBluetoothMultitouch.mouse "MouseMomentumScroll" -bool true
/usr/bin/defaults write com.apple.driver.AppleBluetoothMultitouch.mouse "MouseOneFingerDoubleTapGesture" -int 1
/usr/bin/defaults write com.apple.driver.AppleBluetoothMultitouch.mouse "MouseTwoFingerDoubleTapGesture" -int 3
/usr/bin/defaults write com.apple.driver.AppleBluetoothMultitouch.mouse "MouseTwoFingerHorizSwipeGesture" -int 2
/usr/bin/defaults write com.apple.driver.AppleBluetoothMultitouch.mouse "MouseVerticalScroll" -bool true

# com.apple.driver.AppleBluetoothMultitouch.trackpad
/usr/bin/defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "Clicking" -bool true
/usr/bin/defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "Dragging" -bool false
/usr/bin/defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "TrackpadFiveFingerPinchGesture" -int 2
/usr/bin/defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "TrackpadFourFingerHorizSwipeGesture" -int 2
/usr/bin/defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "TrackpadFourFingerPinchGesture" -int 2
/usr/bin/defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "TrackpadFourFingerVertSwipeGesture" -int 2
/usr/bin/defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "TrackpadHorizScroll" -int 1
/usr/bin/defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "TrackpadMomentumScroll" -bool true
/usr/bin/defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "TrackpadPinch" -int 1
/usr/bin/defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "TrackpadRightClick" -bool true
/usr/bin/defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "TrackpadRotate" -int 1
/usr/bin/defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "TrackpadScroll" -bool true
/usr/bin/defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "TrackpadThreeFingerDrag" -bool true
/usr/bin/defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "TrackpadThreeFingerHorizSwipeGesture" -int 0
/usr/bin/defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "TrackpadThreeFingerTapGesture" -int 0
/usr/bin/defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "TrackpadThreeFingerVertSwipeGesture" -int 0
/usr/bin/defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "TrackpadTwoFingerDoubleTapGesture" -int 1
/usr/bin/defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad \
  "TrackpadTwoFingerFromRightEdgeSwipeGesture" -int 3

# com.apple.finder
/usr/bin/defaults write com.apple.finder "FXArrangeGroupViewBy" -string "Name"
/usr/bin/defaults write com.apple.finder "FXDefaultsearchScope" -string "SCcf"
/usr/bin/defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool false
/usr/bin/defaults write com.apple.finder "FXICloudDriveDesktop" -bool false
/usr/bin/defaults write com.apple.finder "FXICloudDriveDocuments" -bool false
/usr/bin/defaults write com.apple.finder "FXICloudDriveEnabled" -bool true
/usr/bin/defaults write com.apple.finder "FXInfoPanesExpanded" -dict \
  Comments -bool false \
  General -bool true \
  MetaData -bool true \
  Name -bool true \
  OpenWith -bool false \
  Preview -bool false \
  Privileges -bool true
/usr/bin/defaults write com.apple.finder "FXPreferredGroupBy" -string "Name"
/usr/bin/defaults write com.apple.finder "FXPreferredViewStyle" -string "Nlsv"
/usr/bin/defaults write com.apple.finder "NewWindowTarget" -string "PfHm"
/usr/bin/defaults write com.apple.finder "NewWindowTargetPath" -string "file:///${HOME}"
/usr/bin/defaults write com.apple.finder "ShowExternalHardDrivesOnDesktop" -bool true
/usr/bin/defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool false
/usr/bin/defaults write com.apple.finder "ShowMountedServersOnDesktop" -bool false
/usr/bin/defaults write com.apple.finder "ShowRemovableMediaOnDesktop" -bool true
/usr/bin/defaults write com.apple.finder "ShowSidebar" -bool true
/usr/bin/defaults write com.apple.finder "ShowStatusBar" -bool true
/usr/bin/defaults write com.apple.finder "ShowPathbar" -bool true
/usr/bin/defaults write com.apple.finder "WarnOnEmptyTrash" -bool false
/usr/bin/defaults write com.apple.finder "_FXSortFoldersFirst" -bool true

## Use PlistBuddy instead of /usr/bin/defaults for tricky settings
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" \
  "${HOME}/Library/Preferences/com.apple.finder.plist"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 30" \
  "${HOME}/Library/Preferences/com.apple.finder.plist"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 50" \
  "${HOME}/Library/Preferences/com.apple.finder.plist"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:labelOnBottom true" \
  "${HOME}/Library/Preferences/com.apple.finder.plist"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo false" \
  "${HOME}/Library/Preferences/com.apple.finder.plist"

/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" \
 "${HOME}/Library/Preferences/com.apple.finder.plist"
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 30" \
 "${HOME}/Library/Preferences/com.apple.finder.plist"
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 50" \
 "${HOME}/Library/Preferences/com.apple.finder.plist"
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:labelOnBottom true" \
 "${HOME}/Library/Preferences/com.apple.finder.plist"
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo false" \
 "${HOME}/Library/Preferences/com.apple.finder.plist"

/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" \
  "${HOME}/Library/Preferences/com.apple.finder.plist"
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 30" \
  "${HOME}/Library/Preferences/com.apple.finder.plist"
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 50" \
  "${HOME}/Library/Preferences/com.apple.finder.plist"
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:labelOnBottom true" \
  "${HOME}/Library/Preferences/com.apple.finder.plist"
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo false" \
  "${HOME}/Library/Preferences/com.apple.finder.plist"

# com.apple.loginwindow
sudo /usr/bin/defaults write /Library/Preferences/com.apple.loginwindow "AdminHostInfo" -string "HostName"
sudo /usr/bin/defaults write /Library/Preferences/com.apple.loginwindow "GuestEnabled" -bool false
sudo /usr/bin/defaults write /Library/Preferences/com.apple.loginwindow "PowerOffDisabled" -bool true
sudo /usr/bin/defaults write /Library/Preferences/com.apple.loginwindow "showInputMenu" -bool true

# com.apple.mail
/usr/bin/defaults write com.apple.mail "AddressesIncludeNameOnPasteboard" -bool false
/usr/bin/defaults write com.apple.mail "NSUserKeyEquivalents" -dict-add "Send" "@\U21a9"
/usr/bin/defaults write com.apple.mail "DraftsViewerAttributes" -dict-add "DisplayInThreadedMode" -string "yes"
/usr/bin/defaults write com.apple.mail "DraftsViewerAttributes" -dict-add "SortedDescending" -string "yes"
/usr/bin/defaults write com.apple.mail "DraftsViewerAttributes" -dict-add "SortOrder" -string "received-date"

# com.apple.screencapture
/usr/bin/defaults write com.apple.screencapture "disable-shadow" -bool true
/usr/bin/defaults write com.apple.screencapture "save-selections" -bool false
/usr/bin/defaults write com.apple.screencapture "type" -string "png"

# com.apple.screensaver
/usr/bin/defaults write com.apple.screensaver "askForPassword" -int 1
/usr/bin/defaults write com.apple.screensaver "askForPasswordDelay" -int 0

# com.apple.spaces
/usr/bin/defaults write com.apple.spaces "spans-displays" -bool false

# com.blackpixel.kaleidoscope
/usr/bin/defaults write com.blackpixel.kaleidoscope "KSFileSystemItemRepScanHiddenFilesKey" -bool true

# com.colliderli.iina
/usr/bin/defaults write com.colliderli.iina "actionAfterLaunch" -int 2
/usr/bin/defaults write com.colliderli.iina "onlineSubSource" -int 2
/usr/bin/defaults write com.colliderli.iina "oscPosition" -int 2
/usr/bin/defaults write com.colliderli.iina "pauseWhenOpen" -bool true
/usr/bin/defaults write com.colliderli.iina "quitWhenNoOpenedWindow" -bool true
/usr/bin/defaults write com.colliderli.iina "recordPlaybackHistory" -bool false
/usr/bin/defaults write com.colliderli.iina "recordRecentFiles" -bool false
/usr/bin/defaults write com.colliderli.iina "showRemainingTime" -bool true
/usr/bin/defaults write com.colliderli.iina "subLang" -string "it,en"
/usr/bin/defaults write com.colliderli.iina "usePhysicalResolution" -bool false

# com.mactrackerapp.Mactracker
/usr/bin/defaults write com.mactrackerapp.Mactracker "AddDefaultiCalAlarm" -bool false
/usr/bin/defaults write com.mactrackerapp.Mactracker "AppleAquaColorVariant" -int 1
/usr/bin/defaults write com.mactrackerapp.Mactracker "Currency" -string "EUR"
/usr/bin/defaults write com.mactrackerapp.Mactracker "HideVintageandObsolete" -bool false
/usr/bin/defaults write com.mactrackerapp.Mactracker "ModelIconPreviewSize" -string "Small"
/usr/bin/defaults write com.mactrackerapp.Mactracker "PerformanceScores" -string "Geekbench4"
/usr/bin/defaults write com.mactrackerapp.Mactracker "ShowCurrentPriceConfirmation" -bool false
/usr/bin/defaults write com.mactrackerapp.Mactracker "ShowInternetConfirmation" -bool true
/usr/bin/defaults write com.mactrackerapp.Mactracker "ShowTimeline" -bool true
/usr/bin/defaults write com.mactrackerapp.Mactracker "SortDirection" -int 1
/usr/bin/defaults write com.mactrackerapp.Mactracker "SourceText" -string "Small"
/usr/bin/defaults write com.mactrackerapp.Mactracker "Units" -string "ME"

# com.noodlesoft.Hazel
/usr/bin/defaults write com.noodlesoft.Hazel "IgnoreGrowl" -int 1
/usr/bin/defaults write com.noodlesoft.Hazel "ShowStatusInMenuBar" -bool true
/usr/bin/defaults write com.noodlesoft.Hazel "TrashMaintainMaxSize" -int 1
/usr/bin/defaults write com.noodlesoft.Hazel "TrashPurgeOldFiles" -int 1
/usr/bin/defaults write com.noodlesoft.Hazel "TrashUninstallApps" -int 1
/usr/bin/defaults write com.noodlesoft.Hazel "UninstallLogEnabled" -int 1

# com.quoteunquoteapps.highlandapp2
/usr/bin/defaults write com.quoteunquoteapps.highlandapp2 "AutocapitalizeSceneHeaders" -bool true
/usr/bin/defaults write com.quoteunquoteapps.highlandapp2 "AutocorrectEnabled" -bool true
/usr/bin/defaults write com.quoteunquoteapps.highlandapp2 "AutomaticGrammarChecking" -bool false
/usr/bin/defaults write com.quoteunquoteapps.highlandapp2 "AutomaticSpellChecking" -bool true
/usr/bin/defaults write com.quoteunquoteapps.highlandapp2 "AutomaticallySubstituteSmartQuotes" -bool true
/usr/bin/defaults write com.quoteunquoteapps.highlandapp2 "ExcludeNotesFromWordCount" -bool true
/usr/bin/defaults write com.quoteunquoteapps.highlandapp2 "ShowPageNumbersInEditor" -int 1

# cx.c3.theunarchiver
/usr/bin/defaults write cx.c3.theunarchiver "deleteExtractedArchive" -bool true

# org.m0k.transmission
/usr/bin/defaults write org.m0k.transmission "AutoImport" -bool true
/usr/bin/defaults write org.m0k.transmission "AutoImportDirectory" -string "${HOME}/Downloads"
/usr/bin/defaults write org.m0k.transmission "BadgeUploadRate" -bool false
/usr/bin/defaults write org.m0k.transmission "BlocklistAutoUpdate" -bool true
/usr/bin/defaults write org.m0k.transmission "BlocklistNew" -bool true
/usr/bin/defaults write org.m0k.transmission "BlocklistURL" -string "http://john.bitsurge.net/public/biglist.p2p.gz"
/usr/bin/defaults write org.m0k.transmission "CheckRemove" -bool false
/usr/bin/defaults write org.m0k.transmission "DeleteOriginalTorrent" -bool true
/usr/bin/defaults write org.m0k.transmission "DownloadAsk" -bool false
/usr/bin/defaults write org.m0k.transmission "DownloadLocationConstant" -bool true
/usr/bin/defaults write org.m0k.transmission "EncryptionRequire" -bool true
/usr/bin/defaults write org.m0k.transmission "PlayDownloadSound" -bool false
/usr/bin/defaults write org.m0k.transmission "MagnetOpenAsk" -bool false
/usr/bin/defaults write org.m0k.transmission "RemoveWhenFinishSeeding" -bool true
/usr/bin/defaults write org.m0k.transmission "WarningDonate" -bool false
/usr/bin/defaults write org.m0k.transmission "WarningLegal" -bool false

osascript <<EOD

tell application "Terminal"

  local allOpenedWindows
  local initialOpenedWindows
  local windowID
  set themeName to "Japanesque"

  (* Store the IDs of all the open terminal windows. *)
  set initialOpenedWindows to id of every window

  (* Open the custom theme so that it gets added to the list
     of available terminal themes (note: this will open two
     additional terminal windows). *)
  do shell script "open '$(/usr/bin/dirname "${0}")/../" & themeName & ".terminal'"

  (* Wait a little bit to ensure that the custom theme is added. *)
  delay 1

  (* Set the custom theme as the default terminal theme. *)
  set default settings to settings set themeName

  (* Get the IDs of all the currently opened terminal windows. *)
  set allOpenedWindows to id of every window

  repeat with windowID in allOpenedWindows

    (* Close the additional windows that were opened in order
       to add the custom theme to the list of terminal themes. *)
    if initialOpenedWindows does not contain windowID then
      close (every window whose id is windowID)

    (* Change the theme for the initial opened terminal windows
       to remove the need to close them in order for the custom
       theme to be applied. *)
    else
      set current settings of tabs of (every window whose id is windowID) to settings set themeName
    end if

  end repeat

end tell

EOD
