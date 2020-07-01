#!/usr/bin/env bash


# Gratuitously stolen from @mathiasbynens
# https://github.com/mathiasbynens/dotfiles/blob/main/.macos

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Set highlight color to blue
defaults write NSGlobalDomain AppleHighlightColor -string "0.497966 0.592192 0.643057"

# Set sidebar icon size to medium
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# Disable the over-the-top focus ring animation
defaults write NSGlobalDomain NSUseAnimatedFocusRing -bool false

# Increase window resize speed for Cocoa applications
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Display ASCII control characters using caret notation in standard text views
# Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`
defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

# Disable Resume system-wide
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true


# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false


###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Use scroll gesture with the Ctrl (^) modifier key to zoom
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
# Follow the keyboard focus while zoomed in
defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

# Disable the Character Accents Popup
defaults write -g ApplePressAndHoldEnabled -bool false

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Set language and text formats
# Note: if you’re in the US, replace `EUR` with `USD`, `Centimeters` with
# `Inches`, `en_GB` with `en_US`, and `true` with `false`.
defaults write NSGlobalDomain AppleLanguages -array "en" "de"
defaults write NSGlobalDomain AppleLocale -string "en_GB@currency=EUR"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

###############################################################################
# Energy saving                                                               #
###############################################################################

# Enable lid wakeup
sudo pmset -a lidwake 1

# Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on

# Sleep the display after 15 minutes
sudo pmset -a displaysleep 15

###############################################################################
# Screen                                                                      #
###############################################################################

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Pictures/Screenshots"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Enable subpixel font rendering on non-Apple LCDs
# Reference: https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
defaults write NSGlobalDomain AppleFontSmoothing -int 1

# Enable HiDPI display modes (requires restart)
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

###############################################################################
# Finder                                                                      #
###############################################################################

# Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

# Finder: disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Set Desktop as the default location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Finder: show hidden files by default
#defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Remove the spring loading delay for directories
defaults write NSGlobalDomain com.apple.springing.delay -float 0

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Automatically open a new Finder window when a volume is mounted
#defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
#defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
#defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Show item info near icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

# Show item info to the right of the icons on the desktop
/usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom false" ~/Library/Preferences/com.apple.finder.plist

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Increase grid spacing for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist

# Increase the size of icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Show the ~/Library folder
if [[ $(xattr -l ~/Library | grep com.apple.FinderInfo) == "" ]]
    then
        :
    else
        xattr -d com.apple.FinderInfo ~/Library
fi
chflags nohidden ~/Library


# Show the /Volumes folder
sudo chflags nohidden /Volumes


###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################

# Enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 58

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you don’t use
# the Dock to launch apps.
#defaults write com.apple.dock persistent-apps -array

# Show only open applications in the Dock
#defaults write com.apple.dock static-only -bool true

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Don’t group windows by application in Mission Control
# (i.e. use the old Exposé behavior instead)
defaults write com.apple.dock expose-group-by-app -bool false

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0
# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Add a spacer to the left side of the Dock (where the applications are)
#defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
# Add a spacer to the right side of the Dock (where the Trash is)
defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'



###############################################################################
# Safari & WebKit                                                             #
###############################################################################

# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Press Tab to highlight each item on a web page
defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true

# Show the full URL in the address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Allow hitting the Backspace key to go to the previous page in history
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

# Hide Safari’s bookmarks bar by default
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Hide Safari’s sidebar in Top Sites
defaults write com.apple.Safari ShowSidebarInTopSites -bool false

# Disable Safari’s thumbnail cache for History and Top Sites
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Remove useless icons from Safari’s bookmarks bar
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Enable continuous spellchecking
defaults write com.apple.Safari WebContinuousSpellCheckingEnabled -bool true
# Disable auto-correct
defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false

# Disable AutoFill
defaults write com.apple.Safari AutoFillFromAddressBook -bool false
defaults write com.apple.Safari AutoFillPasswords -bool false
defaults write com.apple.Safari AutoFillCreditCardData -bool false
defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false

# Warn about fraudulent websites
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

# Disable plug-ins
defaults write com.apple.Safari WebKitPluginsEnabled -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2PluginsEnabled -bool false

# Disable Java
defaults write com.apple.Safari WebKitJavaEnabled -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabledForLocalFiles -bool false

# Block pop-up windows
defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false

# Disable auto-playing video
#defaults write com.apple.Safari WebKitMediaPlaybackAllowsInline -bool false
#defaults write com.apple.SafariTechnologyPreview WebKitMediaPlaybackAllowsInline -bool false
#defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2AllowsInlineMediaPlayback -bool false
#defaults write com.apple.SafariTechnologyPreview com.apple.Safari.ContentPageGroupIdentifier.WebKit2AllowsInlineMediaPlayback -bool false

# Enable “Do Not Track”
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Update extensions automatically
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true

###############################################################################
# Mail                                                                        #
###############################################################################

# Disable send and reply animations in Mail.app
defaults write com.apple.mail DisableReplyAnimations -bool true
defaults write com.apple.mail DisableSendAnimations -bool true

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Display emails in threaded mode, sorted by date (oldest at the top)
defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "yes"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortedDescending" -string "yes"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortOrder" -string "received-date"

# Disable inline attachments (just show the icons)
defaults write com.apple.mail DisableInlineAttachmentViewing -bool true

# Disable automatic spell checking
defaults write com.apple.mail SpellCheckingBehavior -string "NoSpellCheckingEnabled"


###############################################################################
# Time Machine                                                                #
###############################################################################

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

###############################################################################
# Activity Monitor                                                            #
###############################################################################

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

###############################################################################
# Address Book, Dashboard, iCal, TextEdit, and Disk Utility                   #
###############################################################################

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0
# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# Enable the debug menu in Disk Utility
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

# Auto-play videos when opened with QuickTime Player
defaults write com.apple.QuickTimePlayerX MGPlayMovieOnOpen -bool true

###############################################################################
# Mac App Store                                                               #
###############################################################################

# Enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# Install System data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

# Automatically download apps purchased on other Macs
defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1

# Turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true

###############################################################################
# Photos                                                                      #
###############################################################################

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true


###############################################################################
# Google Chrome & Google Chrome Canary                                        #
###############################################################################

# Disable the all too sensitive backswipe on trackpads
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false

# Disable the all too sensitive backswipe on Magic Mouse
defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false

# Use the system-native print preview dialog
defaults write com.google.Chrome DisablePrintPreview -bool true

# Expand the print dialog by default
defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true


###############################################################################
# BetterTouchTool						                                      #
###############################################################################

# Window Snapping Settings
defaults write com.hegenberg.BetterTouchTool BSTCornerRoundness -int 7
defaults write com.hegenberg.BetterTouchTool BSTSnapAreaAnimationDuration -float 0.02
defaults write com.hegenberg.BetterTouchTool BTTWindowSnappingHighPerformanceMode -int 1
defaults write com.hegenberg.BetterTouchTool previewWindowBackgroundColor -string '<62706c69 73743030 d4010203 0405062b 2c582476 65727369 6f6e5824 6f626a65 63747359 24617263 68697665 72542474 6f701200 0186a0a7 07081319 1d242855 246e756c 6cd5090a 0b0c0d0e 0f101112 5c4e5343 6f6d706f 6e656e74 73554e53 5247425c 4e53436f 6c6f7253 70616365 5f10124e 53437573 746f6d43 6f6c6f72 53706163 65562463 6c617373 4f103330 2e313933 31343638 35383820 302e3139 33313436 38353838 20302e31 39333134 36383538 3820302e 32363538 37323537 39324f10 34302e31 34353137 35313434 3120302e 31343532 30323336 38352030 2e313435 31363834 32333720 302e3236 35383732 35373932 00100180 028006d3 140d1516 1718554e 53494343 594e5353 70616365 49448003 8005100c d21a0d1b 1c574e53 2e646174 614f1102 24000002 24617070 6c040000 006d6e74 72524742 2058595a 2007e100 07000700 0d001600 20616373 70415050 4c000000 00415050 4c000000 00000000 00000000 00000000 000000f6 d6000100 000000d3 2d617070 6cca1a95 82257f10 4d389913 d5d1ea15 82000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 0a646573 63000000 fc000000 65637072 74000001 64000000 23777470 74000001 88000000 14725859 5a000001 9c000000 14675859 5a000001 b0000000 14625859 5a000001 c4000000 14725452 43000001 d8000000 20636861 64000001 f8000000 2c625452 43000001 d8000000 20675452 43000001 d8000000 20646573 63000000 00000000 0b446973 706c6179 20503300 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00746578 74000000 00436f70 79726967 68742041 70706c65 20496e63 2e2c2032 30313700 0058595a 20000000 000000f3 51000100 00000116 cc58595a 20000000 00000083 df00003d bfffffff bb58595a 20000000 0000004abf0000b1 3700000a b958595a 20000000 00000028 38000011 0b0000c8 b9706172 61000000 00000300 00000266 660000f2 a700000d 59000013 d000000a 5b736633 32000000 0000010c 42000005 defffff3 26000007 930000fd 90fffffb a2fffffd a3000003 dc0000c0 6e8004d2 1e1f2021 5a24636c 6173736e 616d6558 24636c61 73736573 5d4e534d 75746162 6c654461 7461a320 2223564e 53446174 61584e53 4f626a65 6374d21e 1f25265c 4e53436f 6c6f7253 70616365 a227235c 4e53436f 6c6f7253 70616365 d21e1f29 2a574e53 436f6c6f 72a22923 5f100f4e 534b6579 65644172 63686976 6572d12d 2e54726f 6f748001 00080011 001a0023 002d0032 0037003f 00450050 005d0063 00700085 008c00c2 00f900fb 00fd00ff 0106010c 01160118 011a011c 01210129 03510353 03580363 036c037a 037e0385 038e0393 03a003a3 03b003b5 03bd03c0 03d203d5 03da0000 00000000 02010000 00000000 002f0000 00000000 00000000 00000000 03dc>'
defaults write com.hegenberg.BetterTouchTool previewWindowBorderColor -string '<62706c69 73743030 d4010203 0405062b 2c582476 65727369 6f6e5824 6f626a65 63747359 24617263 68697665 72542474 6f701200 0186a0a7 07081319 1d242855 246e756c 6cd5090a 0b0c0d0e 0f101112 5c4e5343 6f6d706f 6e656e74 73554e53 5247425c 4e53436f 6c6f7253 70616365 5f10124e 53437573 746f6d43 6f6c6f72 53706163 65562463 6c617373 47302030 20302031 46302030 20300010 01800280 06d3140d 15161718 554e5349 4343594e 53537061 63654944 80038005 100cd21a 0d1b1c57 4e532e64 6174614f 11022400 00022461 70706c04 0000006d 6e747252 47422058 595a2007 e1000700 07000d00 16002061 63737041 50504c00 00000041 50504c00 00000000 00000000 00000000 00000000 00f6d600 01000000 00d32d61 70706cca 1a958225 7f104d38 9913d5d1 ea158200 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000a64 65736300 0000fc00 00006563 70727400 00016400 00002377 74707400 00018800 00001472 58595a00 00019c00 00001467 58595a00 0001b000 00001462 58595a00 0001c40000001472 54524300 0001d800 00002063 68616400 0001f800 00002c62 54524300 0001d800 00002067 54524300 0001d800 00002064 65736300 00000000 00000b44 6973706c 61792050 33000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000074 65787400 00000043 6f707972 69676874 20417070 6c652049 6e632e2c 20323031 37000058 595a2000 00000000 00f35100 01000000 0116cc58 595a2000 00000000 0083df00 003dbfff ffffbb58 595a2000 00000000 004abf00 00b13700 000ab958 595a2000 00000000 00283800 00110b00 00c8b970 61726100 00000000 03000000 02666600 00f2a700 000d5900 0013d000 000a5b73 66333200 00000000 010c4200 0005deff fff32600 00079300 00fd90ff fffba2ff fffda300 0003dc00 00c06e80 04d21e1f 20215a24 636c6173 736e616d 65582463 6c617373 65735d4e 534d7574 61626c65 44617461 a3202223 564e5344 61746158 4e534f62 6a656374 d21e1f25 265c4e53 436f6c6f 72537061 6365a227 235c4e53 436f6c6f 72537061 6365d21e 1f292a57 4e53436f 6c6f72a2 29235f10 0f4e534b 65796564 41726368 69766572 d12d2e54 726f6f74 80010008 0011001a 0023002d 00320037 003f0045 0050005d 00630070 0085008c 0094009b 009d009f 00a100a8 00ae00b8 00ba00bc 00be00c3 00cb02f3 02f502fa 0305030e 031c0320 03270330 03350342 03450352 0357035f 03620374 0377037c 00000000 00000201 00000000 0000002f 00000000 00000000 00000000 0000037e>'


###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Activity Monitor" \
	"Address Book" \
	"BetterTouchTool" \
	"Calendar" \
	"cfprefsd" \
	"Contacts" \
	"Dock" \
	"Finder" \
	"Google Chrome Canary" \
	"Google Chrome" \
	"Mail" \
	"Messages" \
	"Opera" \
	"Photos" \
	"Safari" \
	"SizeUp" \
	"Spectacle" \
	"SystemUIServer" \
	"Terminal" \
	"Transmission" \
	"Tweetbot" \
	"Twitter" \
	"iCal"; do
	killall "${app}" &> /dev/null
done
echo "Done. Note that some of these changes require a logout/restart to take effect."