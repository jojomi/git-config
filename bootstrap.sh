#!/usr/bin/env sh

# export repository files (as defined in .gitattributes)
DIR=${1:-$(mktemp -d /tmp/git-config-bootstrap-XXXXX)}
git archive HEAD | tar -x -C "$DIR"

# activate in respective git-config
git config ${2:-} --unset-all include.path .gitconfig-repo
git config ${2:-} --unset-all include.path .gitconfig-custom
git config ${2:-} --add include.path .gitconfig-repo
git config ${2:-} --add include.path .gitconfig-custom

# print output directory
echo "installed to '$DIR'"
