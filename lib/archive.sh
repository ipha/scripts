#!/bin/bash

archive_list () {
    case $1 in
        *.tar)      tar tf  "$1";;
        *.tar.*)    tar tf  "$1";;
        *.tgz)      tar tf  "$1";;
        *.zip)      7z l    "$1";;
        *.rar)      7z l    "$1";;
        *.7z)       7z l    "$1";;
        *)
            echo "WTF is this? Lets try 7zip"
            7z l "$1"
        ;;
    esac
}

archive_extract () {
    case $1 in
        *.tar)      tar xf  "$1";;
        *.tar.*)    tar xf  "$1";;
        *.tgz)      tar xf  "$1";;
        *.bz2)      bunzip2 "$1";;
        *.gz)       gunzip  "$1";;
        *.xz)       xz -d   "$1";;
        *.lz4)      lz4 -d  "$1";;
        *.lzo)      lzop -d "$1";;
        *.zip)      7z x    "$1";;
        *.rar)      7z x    "$1";;
        *.7z)       7z x    "$1";;
        *)
            echo "WTF is this? Lets try 7zip" >&2
            7z x "$file"
        ;;
    esac
}

archive_cat () {
    type=$(file -b "$1" | awk '{ print $1 }')
    case $type in
        "gzip")     zcat        "$1";;
        "bzip2")    bzcat       "$1";;
        "XZ")       xzcat       "$1";;
        "lzop")     lzop -dcf   "$1";;
        "LZ4")      lz4cat      "$1";;
        "LZMA")     lzcat       "$1";;
        "Zstandard")zstdcat     "$1";;
        "PGP")      gpg -d -o - "$1";;
        "ASCII")    cat         "$1";;
        "UTF-8")    cat         "$1";;
        *)
            echo "${1}: unknown type (${type})" >&2
        ;;
    esac
}

if [ ! -f "$1" ]; then
    exit 1
fi

#
# Symlink commands

# List
if [ "$(basename "$0")" == "t" ]; then
    for file in "$@"; do
        archive_list "$file"
    done
    exit 0
fi

# Extract
if [ "$(basename "$0")" == "x" ]; then
    for file in "$@"; do
        archive_extract "$file"
    done
    exit 0
fi

# Print
if [ "$(basename "$0")" == "qcat" ]; then
    for file in "$@"; do
        archive_cat "$file"
    done
    exit 0
fi
