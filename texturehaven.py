#!/usr/bin/env python3

import os
import sys
import requests

DL_RES = "1k"
DL_FMT = "jpg"


def download_extract(texture, res, fmt):
    url = "https://texturehaven.com/files/textures/zip/{1}/{0}/{0}_{1}_{2}.zip".format(texture, res, fmt)
    print("Downloading: " + texture)
    os.system("wget -q " + url)
    os.system("7z -o{0} x {0}_{1}_{2}.zip > /dev/null".format(texture, res, fmt))
    os.remove("{0}_{1}_{2}.zip".format(texture, res, fmt))


if len(sys.argv) == 1:
    print("Fetching new textures")
    r = requests.get("https://texturehaven.com/php/tex1_list.php")
    textures = map(
        lambda x: x.split('=')[1],
        sorted(r.text.split(','))
    )

    for texture in textures:
        if not os.path.exists(texture):
            download_extract(texture, DL_RES, DL_FMT)
    exit(0)

elif len(sys.argv) == 3:
    print("Fetching new resolution")
    DL_RES = sys.argv[2].lower()
    DL_FMT = "jpg"
    download_extract(sys.argv[1], DL_RES, DL_FMT)

elif len(sys.argv) == 4:
    print("Fetching new resolution")
    DL_RES = sys.argv[2].lower()
    DL_FMT = sys.argv[3].lower()
    download_extract(sys.argv[1], DL_RES, DL_FMT)
