#!/bin/bash

# Install Supervisor
sudo apt-get update
sudo apt-get install -y supervisor

# Create Supervisor configuration file for Django application
sudo tee /etc/supervisor/conf.d/gunicorn.conf > /dev/null << EOL
[program:gunicorn]
command=/home/ubuntu/env/bin/gunicorn --workers 3 --bind unix:/home/ubuntu/new-repo/project/app.sock project.wsgi:application
directory=/home/ubuntu/new-repo
user=ubuntu
autostart=true
autorestart=true
stderr_logfile= /var/log/gunicorn/gunicorn.err.log 

stdout_logfile= /var/log/gunicorn/gunicorn.out.log 

  

[group:guni] 

programs:gunicorn
EOL

# Reread and update Supervisor configurations
sudo supervisorctl reread
sudo supervisorctl update

# Restart Nginx and Supervisor
sudo systemctl restart nginx
sudo systemctl restart supervisor
