#!/bin/bash

if [ ! -f "$1" ] ; then
    exit 1
fi

for file in "$@"; do
	case $1 in
		*.tar)		tar xf	"$file";;
		*.tar.*)	tar xf	"$file";;
		*.tgz)		tar xf	"$file";;
		*.bz2)		bunzip2	"$file";;
		*.gz)		gunzip	"$file";;
		*.xz)		xz -d	"$file";;
		*.lz4)		lz4 -d	"$file";;
		*.lzo)		lzop -d	"$file";;
		*.zip)		7z x	"$file";;
		*.rar)		7z x	"$file";;
		*.7z)		7z x	"$file";;
		*)
			echo "WTF is this? Lets try 7zip" >&2
			7z x "$file"
		;;
	esac
done
