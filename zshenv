#
# .zshenv
#
# This file is always run, even in scripts with the zsh shebang. Use it for
# basic functional configuration like PATH.
#

export GPG_TTY=$(tty)  # Required for GPG signing

export DO_NOT_TRACK=0
export HOMEBREW_NO_ANALYTICS=1
