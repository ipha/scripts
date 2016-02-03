#!/bin/bash

if [ -f "$1" ] ; then
	case $1 in
		*.tar)		tar xf	"$1";;
		*.tar.*)	tar xf	"$1";;
		*.tgz)		tar xf	"$1";;
		*.bz2)		bunzip2	"$1";;
		*.gz)		gunzip	"$1";;
		*.xz)		xz -d	"$1";;
		*.lz4)		lz4 -d	"$1";;
		*.lzo)		lzop -d	"$1";;
		*.zip)		7z x	"$1";;
		*.rar)		7z x	"$1";;
		*.7z)		7z x	"$1";;
		*)
			echo "WTF is this? Lets try 7zip"
			7z x "$1"
		;;
	esac
fi
