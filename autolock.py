#!/usr/bin/env python3

import http.server
import random
import string
import ssl
import os

PORT = 14970

init = 0

key = ""
key_file = "/home/mitch/.config/autolock/autolock_key"
ssl_keyfile = "/home/mitch/.config/autolock/ssl_key"
ssl_certfile = "/home/mitch/.config/autolock/ssl_cert"

def new_key():
	global key
	key = ''.join(random.SystemRandom().choice(string.ascii_lowercase + string.ascii_uppercase + string.digits) for _ in range(15))
	f = open(key_file, "w")
	f.write(key)
	f.close()

def lock(k):
	if (k == key) or init:
		os.system("qdbus-qt4 org.freedesktop.ScreenSaver /ScreenSaver Lock")
		new_key()
		return True
	else:
		return False

def unlock(k):
	if (k == key) or init:
		os.system("qdbus-qt4 | grep kscreenlocker | sed 's/org.kde.//' | xargs kquitapp")
		new_key()
		return True
	else:
		return False

class HTTPHandler(http.server.BaseHTTPRequestHandler):
	def do_GET(self):
		action = self.path.split('?')[0]
		if(action == "/lock"):
			data = self.path.split('?')[1]
			if(lock(data.split('=')[1])):
				self.send_response(200)
				self.send_header("Content-type", "text/plain")
				self.end_headers()
				self.wfile.write(b"a=")
				self.wfile.write(key.encode('utf-8'))
			else:
				self.send_response(401)
				self.send_header("Content-type", "text/plain")
				self.end_headers()
				self.wfile.write(b"bad")
		if(action == "/unlock"):
			data = self.path.split('?')[1]
			if(unlock(data.split('=')[1])):
				self.send_response(200)
				self.send_header("Content-type", "text/plain")
				self.end_headers()
				self.wfile.write(b"a=")
				self.wfile.write(key.encode('utf-8'))
			else:
				self.send_response(401)
				self.send_header("Content-type", "text/plain")
				self.end_headers()
				self.wfile.write(b"bad")


f = open(key_file, "r")
key = f.read().strip()
f.close()

print(key)

server = http.server.HTTPServer(('0.0.0.0	', PORT), HTTPHandler)
server.socket = ssl.wrap_socket (server.socket, certfile=ssl_certfile, keyfile=ssl_keyfile, server_side=True)
print('Started http server')
server.serve_forever()