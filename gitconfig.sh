#!/bin/sh

git config --global alias.fetchall "fetch --all --prune"
git config --global alias.ff "merge --ff-only"
git config --global alias.fixup "commit --amend --no-edit"
git config --global alias.hash "rev-parse HEAD"
git config --global alias.olog "log --oneline"
git config --global alias.shash "rev-parse --short HEAD"
git config --global alias.shortstat "diff --shortstat"
git config --global alias.smerge "merge --squash"
git config --global alias.stat "diff --stat"

git config --global core.pager delta
git config --global core.excludesfile '~/.gitignore'

git config --global	diff.algorithm histogram

git config --global init.defaultBranch master

git config --global pager.branch false
git config --global pager.stash false
git config --global pager.tag false

git config --global pull.ff only
