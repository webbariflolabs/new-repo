#!/usr/bin/bash
sudo cp /home/ubuntu/new-repo/gunicorn/gunicorn.socket  /etc/systemd/system/gunicorn.socket
sudo cp /home/ubuntu/new-repo/gunicorn/gunicorn.service  /etc/systemd/system/gunicorn.service

sudo systemctl enable gunicorn.service
sudo systemctl start gunicorn.service

# Start Gunicorn server
gunicorn --bind 0.0.0.0:8000 project.wsgi:application

exit 0