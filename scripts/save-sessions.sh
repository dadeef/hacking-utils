#!/bin/bash

# This script saves the current terminal session to a file in the ~/sessions directory.
# `source` this from .bashrc or .zshrc to automatically save sessions.
# Based on the example at the end of chapter 2 of "Black Hat Bash" by Dolev Fahri and Nick Aleks.

FILENAME=$(date +%Y-%m-%d-%H:%M:%S).log

if [[ ! -d ~/sessions ]]; then
	mkdir ~/sessions
fi

# Starting a script session
if [[ -z $SCRIPT ]]; then
	export SCRIPT="$HOME/sessions/$FILENAME"
	echo "script = ${SCRIPT}"

	# if on MacOS
	if [[ "$(uname)" == "Darwin" ]]; then
		touch "${SCRIPT}"
		# no -f option for MacOS
		script -q "${SCRIPT}"
    else
		# For Linux
		script -q -f "${SCRIPT}"
	fi
fi
