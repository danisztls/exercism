#!/usr/bin/env bash
# Download all exercises from a Exercism track and save time

# @author: Daniel Souza <me@posix.dev.br>
# @license: MIT

# Usage: get-exercises.sh <lang>

# Debug
# exit when a command has a non-zero exit status
# note: '||:' at the end of a pipe mask a non-zero exit
set -e

# exit when referencing undefined variable
# note: $* and $@ are exceptions
set -u

# exit if any command in a pipe fail
set -o pipefail

# Utils
# decorators
reset="\e[0m"
strong="\e[1;39m"
blue="\e[1;34m"
# red="\e[1;31m"
yellow="\e[1;33m"
green="\e[1;32m"

# Main
lang="$1"

echo -e "${strong}${yellow}Getting list of exercises\t${reset}\n\n"

exercises=$(
  curl -LS "https://exercism.io/tracks/${lang}/exercises" |
  grep -o "tracks/${lang}/exercises/[^&]*" |
  sed "s/tracks\/${lang}\/exercises\///"
)

n=$(wc -l <<< "$exercises")
i=0

mkdir -p "${lang}"
pushd "${lang}" &>/dev/null

echo -e "${strong}${yellow}\nDownloading ${n} exercises...${reset}\n\n"
while read -r exercise; do
  echo -e "${strong}\n${i}. ${blue}${exercise}...${reset}"
  exercism download --exercise="${exercise}" --track="${lang}"
  i=$(( i + 1))
done <<< "$exercises"
popd &>/dev/null

echo -e "${strong}${green}\nAll done!${reset}\n"
