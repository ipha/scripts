#!/bin/sh

sudo cp ./*.service ./*.timer /etc/systemd/system/
sudo cp ./user/*.service /etc/systemd/user/

[ -f /usr/lib/systemd/system/certbot-renew.service ] && sudo rm /etc/systemd/system/certbot-renew.service
[ -f /usr/lib/systemd/system/certbot-renew.timer ] && sudo rm /etc/systemd/system/certbot-renew.timer

sudo systemctl daemon-reload
