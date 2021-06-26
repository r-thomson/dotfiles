#
# .zshenv
#
# This file is always run, even in scripts with the zsh shebang. Use it for
# basic functional configuration like PATH.
#

export PATH="/usr/local/sbin:$PATH" # Some Homebrew packages want this

export GPG_TTY=$(tty) # Required for GPG signing
