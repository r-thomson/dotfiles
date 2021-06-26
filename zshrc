#
# .zshrc
#
# This file is run for interactive sessions. Use it for personal customization
# like prompts, completion, aliases, etc.
#

# =================
# General Usability
# =================

setopt NO_CASE_GLOB # Case-insensitive globbing (~/d* => ~/Documents)
setopt INTERACTIVECOMMENTS # Enable comments in the command line

# =======
# History
# =======

setopt SHARE_HISTORY # Share history across multiple sessions
setopt EXTENDED_HISTORY # Save timestamps to the history file
setopt HIST_IGNORE_DUPS # Don't save the same command twice in a row

# ======
# Prompt
# ======

# Enable Git integration
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats ' %F{red}(%b)'
zstyle ':vcs_info:git:*' actionformats ' %F{red}(%b|%a)'

setopt PROMPT_SUBST
PROMPT=$'%F{238}%~${vcs_info_msg_0_}%f\n %# '
PROMPT2=$' %F{238}%_%f > '

# =====================
# Aliases and Functions
# =====================

alias rm="rm -i" # Make rm more safe
alias ls="ls -p" # Add trailing slash to directories
alias trash="trash -F" # Ensures "put back" still works
alias vscode="code"
history() { builtin history $1 1 | less +G }
bundleid() { osascript -e "id of app '$1'" }
copyip() { "ipconfig getifaddr en0 | pbcopy" }
copyuuid() { "echo -n `uuidgen` | tr '[:upper:]' '[:lower:]' | pbcopy" }

# ===========
# Completions
# ===========

# Allow case-insensitive completions (but prefer exact matches)
zstyle ':completion:*' matcher-list \
	'' \
	'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'

# Homebrew completions
if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# Initialize the completion system; run commands like zstyle before this
autoload -Uz compinit && compinit
