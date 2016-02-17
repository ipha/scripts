#!/usr/bin/env python3

import sys

width = 80
last_newline = 0

if len(sys.argv) >= 2:
    try:
        width = int(sys.argv[1])
    except ValueError:
        print("Invalid line width")

for line in sys.stdin:
    sline = line.rstrip()
    if sline == "":
        last_newline += 1
    else:
        if last_newline > 1:
            print("\n" * (last_newline - 1), end="")
        last_newline = 0

        words = sline.split(' ')
        chars = 0
        for word in words:
            if chars + len(word) + 1 > width:
                print("\n", end="")
                chars = 0
            print(word + " ", end="")
            chars += len(word) + 1
        print("\n", end="")
