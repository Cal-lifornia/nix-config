#!/usr/bin/env bash

paths=$(yazi "$2" --chooser-file=/dev/stdout)

if [[ -n "$paths" ]]; then
	zellij action toggle-floating-panes
	zellij action send-keys "Esc" # send <Escape> key
	zellij action write-chars ":$1 $paths"
	zellij action send-keys "Enter" # send <Enter> key
else
	zellij action toggle-floating-panes
fi
