#!/usr/bin/env bash

sudo apt install -y python3-pip
sudo apt install -y virtualenv
sudo apt install -y nginx
sudo apt install -y gunicorn
sudo dpkg --configure -a
sudo apt-get install -f