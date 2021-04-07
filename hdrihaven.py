#!/usr/bin/env python3

import os
import sys
import requests

DL_RES = "4k"


def download_extract(texture, res):
    url = "https://hdrihaven.com/files/hdris/{0}_{1}.hdr".format(texture, res)
    print("Downloading: " + texture)
    os.system("wget -q " + url)


if len(sys.argv) == 1:
    print("Fetching new textures")
    r = requests.get("https://hdrihaven.com/php/tex1_list.php")
    textures = map(
        lambda x: x.split('=')[1],
        sorted(r.text.split(','))
    )

    for texture in textures:
        if not os.path.exists("{0}_{1}.hdr".format(texture, DL_RES)):
            download_extract(texture, DL_RES)
    exit(0)

elif len(sys.argv) == 3:
    print("Fetching new resolution")
    DL_RES = sys.argv[2].lower()
    download_extract(sys.argv[1], DL_RES)
