#!/bin/sh

sudo cp ./*.service ./*.timer /etc/systemd/system/
sudo systemctl daemon-reload

