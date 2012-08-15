#!/bin/bash

if [ -f "$1" ] ; then
	case $1 in
		
		*.tar)		tar xf "$1"	;;
		*.tar.*)	tar xf "$1"	;;
		*.bz2)		bunzip2 "$1"	;;
		*.gz)		gunzip "$1"	;;
		*.zip)		unzip "$1"	;;
		*.rar)		unrar x "$1"	;;
		*.7z)		7z x "$1"	;;
	esac
fi
