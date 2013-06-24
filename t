#!/bin/bash

if [ -f "$1" ] ; then
	case $1 in
		*.tar)		tar tf	"$1";;
		*.tar.*)	tar tf	"$1";;
		*.zip)		7z l	"$1";;
		*.rar)		7z l	"$1";;
		*.7z)		7z l	"$1";;
	esac
fi
