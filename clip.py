#!/usr/bin/env python2

import gtk
import os

def clip_changed(clipboard, event):
	text = clipboard.wait_for_text()
	
	if "youtube.com/watch" in text:
		os.system("youtube-viewer --really-quiet -I " + text)

clipboard = gtk.clipboard_get()
clipboard.connect('owner-change', clip_changed)

gtk.main()