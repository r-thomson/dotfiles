# Enable press-and-hold key repeat
defaults write -g ApplePressAndHoldEnabled -bool no

# Disable clicking desktop to hide windows
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false

# Disable switch to space when switching to application
defaults write -g AppleSpacesSwitchOnActivate -bool false

# Prevent the dock from being accidentally resized or moved
defaults write com.apple.Dock size-immutable -bool yes
defaults write com.apple.Dock position-immutable -bool yes
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

# Disable iOS-like text replacement
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
defaults write -g NSAutomaticCapitalizationEnabled -bool false
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false

# Keyboard shortcuts
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 52 "<dict><key>enabled</key><false/></dict>"  # Turn Dock hiding on/off
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 190 "<dict><key>enabled</key><false/></dict>"  # Quick Note

# When opening TextEdit, start with a new empty plaintext file
defaults write com.apple.TextEdit NSShowAppCentricOpenPanelInsteadOfUntitledFile -bool false
defaults write com.apple.TextEdit RichText -bool false

killall Dock
