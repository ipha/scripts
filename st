#!/bin/bash

if xrandr | grep -e " connected [^(]" | sed -e "s/\([A-Z0-9]\+\) connected.*/\1/" | grep "DVI-I-1"; then
	xrandr --output DVI-I-1 --off
else
	xrandr --output DVI-I-1 --left-of DVI-I-2 --auto
fi
