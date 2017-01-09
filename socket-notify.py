#!/usr/bin/env python3

import socket
import os
from systemd.daemon import listen_fds

DURATION = 30 * 1000


def readlines(sock, recv_buffer=4096):
    buffer = b''
    data = True
    while data:
        data = sock.recv(recv_buffer)
        buffer += data
        while buffer.find(b'\n') != -1:
            line, buffer = buffer.split(b'\n', 1)
            yield line.decode("utf-8")
    return


def do_that_socket_thing():
    fds = listen_fds()
    for fd in fds:
        sock = socket.fromfd(fd, socket.AF_INET, socket.SOCK_STREAM)
        conn, addr = sock.accept()
        for line in readlines(conn):
            args = line.split(';')
            os.execl("/usr/bin/notify-send", "-t " + str(DURATION), args[0], args[1])
        sock.close()

if __name__ == "__main__":
    do_that_socket_thing()
