#!/usr/bin/bash
sudo cp /home/ubuntu/new-repo/gunicorn/gunicorn.socket  /etc/systemd/system/gunicorn.socket
sudo cp /home/ubuntu/new-repo/gunicorn/gunicorn.service  /etc/systemd/system/gunicorn.service

sudo systemctl enable gunicorn.service
sudo systemctl start gunicorn.service

# Start Gunicorn server
gunicorn project.wsgi:application --bind 127.0.0.1:8000 --workers 3 --log-level=info --daemon

exit 0