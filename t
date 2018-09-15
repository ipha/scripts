#!/bin/bash

if [ ! -f "$1" ] ; then
    exit 1
fi

for file in "$@"; do
	case $1 in
		*.tar)		tar tf	"$file";;
		*.tar.*)	tar tf	"$file";;
		*.tgz)		tar tf	"$file";;
		*.zip)		7z l	"$file";;
		*.rar)		7z l	"$file";;
		*.7z)		7z l	"$file";;
		*)
			echo "WTF is this? Lets try 7zip"
			7z l "$file"
		;;
	esac
done
