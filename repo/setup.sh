
# auxiliary functions
# http://stackoverflow.com/a/14914070/4021739
relpath () {
  [ $# -ge 1 ] && [ $# -le 2 ] || return 1
  current="${2:+"$1"}"
  target="${2:-"$1"}"
  [ "$target" != . ] || target=/
  target="/${target##/}"
  [ "$current" != . ] || current=/
  current="${current:="/"}"
  current="/${current##/}"
  appendix="${target##/}"
  relative=''
  while appendix="${target#"$current"/}"
  [ "$current" != '/' ] && [ "$appendix" = "$target" ]; do
    if [ "$current" = "$appendix" ]; then
      relative="${relative:-.}"
      echo "${relative#/}"
      return 0
    fi
    current="${current%/*}"
    relative="$relative${relative:+/}.."
  done
  relative="$relative${relative:+${appendix:+/}}${appendix#/}"
  echo "$relative"
}

output_result() {
  reset=$(tput sgr0)
  if test $1 -eq 0
  then
    green=$(tput setaf 2)
    echo " ${green}✓${reset}"
  else
    red=$(tput setaf 1)
    echo " ${red}✘${reset}"
  fi
}



bold=`tput bold`
normal=`tput sgr0`





ROOT_DIR=$(git rev-parse --show-toplevel)
GIT_DIR=$ROOT_DIR/$(git rev-parse --git-dir)
if test $GIT_DIR = '/'
then
  echo 'git directory not found'
  exit 1
fi
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
REL_PATH=$(relpath "$GIT_DIR" "$DIR")

# setup hooks
echo '--- setting up git hooks'
FILES=$(find "$DIR/hooks" -type f)
REL_HOOKS_PATH=$(relpath "$GIT_DIR/hooks" "$DIR/hooks")
for HOOK_FILE in $FILES
do
  HOOK_NAME=$(basename $HOOK_FILE)
  echo -n "creating hook ${bold}$HOOK_NAME${normal}..."
  rm -f "$GIT_DIR/hooks/$HOOK_NAME" && ln -s "$REL_HOOKS_PATH/$HOOK_NAME" "$GIT_DIR/hooks/$HOOK_NAME"
  output_result $?
done
echo ""

# setup config
if test -e "$DIR/config/config"
  then
  echo "--- setting up git config"
  echo -n "adding include path..."
  git config core.include "$REL_PATH/config/config"
  output_result $?
  echo ""
fi

# custom commands
echo '--- enabling project custom git commands'
FILES=$(find "$DIR/commands" -type f)
for COMMAND_FILE in $FILES
do
  COMMAND_NAME=$(basename $COMMAND_FILE)
  COMMAND_NAME_SHORT=$(echo "$COMMAND_NAME" | sed -e 's/^git-//g')
  echo -n "enabling command ${bold}$COMMAND_NAME_SHORT${normal} (file $COMMAND_NAME)..."
  COMMAND='!f() { repo/commands/'$COMMAND_NAME' "$@" ; } ; f'
  git config alias.$COMMAND_NAME_SHORT "$COMMAND"
  output_result $?
done
