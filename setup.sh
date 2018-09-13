#!/bin/bash

export RED="\e[31m"
export GREEN="\e[32m"
export YELLOW="\e[33m"
export BLUE="\e[34m"
export ESC="\e[m"

export BASE_URL='https://raw.github.com/matsune/dotfiles/master'

sudo apt-get update
sudo apt-get install curl

function load() {
	echo -e "${BLUE}---------------->>> Setup $1${ESC}"
	if [ -e ./$1/setup.sh ]; then
		./$1/setup.sh
	else
		echo -e "${RED}Could not found ./$1/setup.sh${ESC}"
	fi
}

TOOLS=$(find . -type d | grep ./ | cut -c 3-)
for TOOL in $TOOLS; do
	load $TOOL
done

