################################################################################
# Globals
################################################################################

echo "Globals - turn off press and hold"
defaults write -g ApplePressAndHoldEnabled -bool false

echo "Globals - turn off quicklook window animation"
defaults write -g QLPanelAnimationDuration -int 0

echo "Globals - turn off windows animation"
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

echo "Globals - disable the menubar transparency"
defaults write com.apple.universalaccess reduceTransparency -bool true

echo "Globals - expanding the save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

echo "Globals - disable smart quotes and smart dashes"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

echo "Globals - automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

echo "Globals - enabling full keyboard access for all controls (enable Tab in modal dialogs, menu windows, etc.)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo "Globals - setting keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 1

echo "Globals - disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

################################################################################
# Energy Saver
################################################################################

echo "Energy Saver - disable hibernation"
sudo pmset -a hibernatemode 0

echo "Energy Saver - remove the sleep image file"
sudo rm /Private/var/vm/sleepimage
sudo touch /Private/var/vm/sleepimage
sudo chflags uchg /Private/var/vm/sleepimage

# echo "Energy Saver - disable system-wide resume"
# defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

echo "Energy Saver - speeding up wake from sleep to 24 hours from an hour"
sudo pmset -a standbydelay 86400

echo "Energy Saver - disable app nap"
defaults write NSGlobalDomain NSAppSleepDisabled -bool true

echo "Energy Saver - turn off keyboard illumination when computer is not used for 5 minutes"
defaults write com.apple.BezelServices kDimTime -int 300

echo "Energy Saver - disable display from automatically adjusting brightness"
sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Display Enabled" -bool false

echo "Energy Saver - disable keyboard from automatically adjusting backlight brightness in low light"
sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Keyboard Enabled" -bool false

################################################################################
# Dock
################################################################################

echo "Dock - reset to default"
defaults delete com.apple.dock

echo "Dock - killing process"
killall Dock
sleep 3

echo "Dock - turn on autohide"
defaults write com.apple.dock autohide -int 1

echo "Dock - turn off autohide animation"
defaults write com.apple.dock autohide-time-modifier -int 0

echo "Dock - turn off autohide delay"
defaults write com.apple.dock autohide-delay -int 0

echo "Dock - turn off app launch animation"
defaults write com.apple.dock launchanim -int 0

echo "Dock - turn off magnification"
defaults write com.apple.dock magnification -int 0

echo "Dock - set minimize effect to scale"
defaults write com.apple.dock mineffect -string scale

echo "Dock - minimize windows to application"
defaults write com.apple.dock minimize-to-application -int 1

echo "Dock - place the dock to the right side"
defaults write com.apple.dock orientation -string right

echo "Dock - set hot corner top left to app expose"
defaults write com.apple.dock wvous-tl-corner -int 3
defaults write com.apple.dock wvous-tl-modifier -int 0

echo "Dock - turn off expose animation"
defaults write com.apple.dock expose-animation-duration -int 0

echo "Dock - kill dashboard"
defaults write com.apple.dashboard mcx-disabled -bool true

echo "Dock - turn off launchpad animation"
defaults write com.apple.dock springboard-show-duration -int 0
defaults write com.apple.dock springboard-hide-duration -int 0

echo "Dock - translucent icons for hidden apps"
defaults write com.apple.dock showhidden -bool true

echo "Dock - killing process"
killall Dock
sleep 3

echo "Dock - remove apps"
defaults delete com.apple.dock persistent-apps

echo "Dock - remove other stuff"
defaults delete com.apple.dock persistent-others

echo "Dock - killing process"
killall Dock
sleep 3

################################################################################
# Finder
################################################################################

echo "Finder - show status bar in Finder by default"
defaults write com.apple.finder ShowStatusBar -bool true

echo "Finder - display full POSIX path as Finder window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

echo "Finder - disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "Finder - use column view in all Finder windows by default"
defaults write com.apple.finder FXPreferredViewStyle Clmv

echo "Finder - avoid creation of .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "Finder - disable disk image verification"
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

################################################################################
# Safari
################################################################################

echo "Safari - don't send search queries to Apple"
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

echo "Safari - hiding bookmarks bar by default"
defaults write com.apple.Safari ShowFavoritesBar -bool false

echo "Safari - hiding sidebar in Top Sites"
defaults write com.apple.Safari ShowSidebarInTopSites -bool false

echo "Safari - disabling thumbnail cache for History and Top Sites"
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

echo "Safari - enabling debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

echo "Safari - making search banners default to Contains instead of Starts With"
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

echo "Safari - removing useless icons from bookmarks bar"
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

echo "Safari - enabling the Develop menu and the Web Inspector"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true

################################################################################
# Terminal
################################################################################

echo "Terminal - enabling UTF-8 in Terminal.app"
defaults write com.apple.terminal StringEncodings -array 4

################################################################################
# Time Machine
################################################################################

echo "Time Machine - prevent Time Machine from prompting to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

echo "Time Machine - disable local Time Machine backups"
hash tmutil &> /dev/null && sudo tmutil disablelocal

################################################################################
# Transmission
################################################################################

echo "Transmission - setting up an incomplete downloads folder in Downloads"
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Downloads/Incomplete"

echo "Transmission - setting auto-add folder to be Downloads"
defaults write org.m0k.transmission AutoImportDirectory -string "${HOME}/Downloads"

echo "Transmission - don't prompt for confirmation before downloading"
defaults write org.m0k.transmission DownloadAsk -bool false

echo "Transmission - trash original torrent files after adding them"
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

echo "Transmission - hiding the donate message"
defaults write org.m0k.transmission WarningDonate -bool false

echo "Transmission - hiding the legal disclaimer"
defaults write org.m0k.transmission WarningLegal -bool false

echo "Transmission - setting up the best block list"
defaults write org.m0k.transmission EncryptionRequire -bool true
defaults write org.m0k.transmission BlocklistAutoUpdate -bool true
defaults write org.m0k.transmission BlocklistNew -bool true
defaults write org.m0k.transmission BlocklistURL -string "http://john.bitsurge.net/public/biglist.p2p.gz"