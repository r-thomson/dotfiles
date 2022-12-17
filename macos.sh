# Enable press-and-hold key repeat
defaults write -g ApplePressAndHoldEnabled -bool no

# Prevent the dock from being accidentally resized or moved
defaults write com.apple.Dock size-immutable -bool yes
defaults write com.apple.Dock position-immutable -bool yes
killall Dock
# defaults write com.apple.Dock tilesize -int 48

# Always show proxy icons in window titlebars
defaults write com.apple.universalaccess showWindowTitlebarIcons -bool true

# Always show file extensions in Finder
defaults write -g AppleShowAllExtensions -bool true

# Search the current folder by default in Finder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Don't write .DS_Store files on external drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Save screenshots to a folder instead of the desktop
mkdir -p ~/Pictures/Screenshots
defaults write com.apple.screencapture location ~/Pictures/Screenshots

# When opening TextEdit, start with a new empty plaintext file
defaults write com.apple.TextEdit NSShowAppCentricOpenPanelInsteadOfUntitledFile -bool false
defaults write com.apple.TextEdit RichText -bool false
