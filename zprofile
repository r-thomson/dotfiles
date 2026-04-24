# .zprofile
# 
# This file is sourced SECOND for login shells. On macOS, the system
# sets the PATH in /etc/zprofile, so PATH setup should be done here.

eval "$(/opt/homebrew/bin/brew shellenv)"  # Homebrew setup
