#!/usr/bin/env sh

# export repository files (as defined in .gitattributes)
TEMP_DIR=$(mktemp -d /tmp/git-config-bootstrap-XXXXX)
TARGET_DIR=${1:-$TEMP_DIR}
git archive HEAD | tar -x -C "$TEMP_DIR"

# replace base path
find "$TEMP_DIR" -type f -exec sed -i'' -e "s|\$ROOT_DIR|$TARGET_DIR|g" {} \;

# copy files if target-directory is given as first argument
if [ "$TEMP_DIR" != "$TARGET_DIR" ]; then
  cp -a "$TEMP_DIR/." "$TARGET_DIR"
fi

# activate in respective git-config
git config ${2:-} --unset-all include.path .gitconfig-repo
git config ${2:-} --unset-all include.path .gitconfig-custom
git config ${2:-} --add include.path .gitconfig-repo
git config ${2:-} --add include.path .gitconfig-custom

# print output directory
echo "installed to '$TARGET_DIR'"
