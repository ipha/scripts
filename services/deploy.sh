#!/bin/sh

sudo cp ./*.service ./*.timer /etc/systemd/system/
sudo cp ./user/*.service /etc/systemd/user/
sudo systemctl daemon-reload
