#!/usr/bin/env bash

if [ -t 1 ]; then
  RB_RED=$(printf '\033[38;5;196m')
  RB_ORANGE=$(printf '\033[38;5;202m')
  RB_YELLOW=$(printf '\033[38;5;226m')
  RB_GREEN=$(printf '\033[38;5;082m')
  RB_BLUE=$(printf '\033[38;5;021m')
  RB_INDIGO=$(printf '\033[38;5;093m')
  RB_VIOLET=$(printf '\033[38;5;163m')

  RED=$(printf '\033[31m')
  GREEN=$(printf '\033[32m')
  YELLOW=$(printf '\033[33m')
  BLUE=$(printf '\033[34m')
  BOLD=$(printf '\033[1m')
  UNDER=$(printf '\033[4m')
  RESET=$(printf '\033[m')
else
  RB_RED=""
  RB_ORANGE=""
  RB_YELLOW=""
  RB_GREEN=""
  RB_BLUE=""
  RB_INDIGO=""
  RB_VIOLET=""

  RED=""
  GREEN=""
  YELLOW=""
  BLUE=""
  UNDER=""
  BOLD=""
  RESET=""
fi

./ohmyzsh/tools/upgrade.sh

printf "\n${BLUE}%s${NORMAL}\n" "Updating ohmyzsh plugins and themes"

for plugin in custom/*/*/; do
  printf "${YELLOW}%s${NORMAL}\n" "${plugin%/}"
  git -C "$plugin" pull --rebase origin master
done

printf "${BLUE}%s${NORMAL}\n" "Hooray! Custom plugins and themes have been updated and/or are at the current version."
