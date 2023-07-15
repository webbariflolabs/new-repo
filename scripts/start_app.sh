#!/usr/bin/bash

sed -i 's/\[]/\["3.25.133.235"]/' /home/ubuntu/new-repo/project/settings.py

python3 manage.py migrate 
python3 manage.py makemigrations     
python3 manage.py collectstatic
sudo systemctl restart nginx
sudo systemctl restart gunicorn
gunicorn --bind 0.0.0.0:8000 project.wsgi:application

# Reread and update Supervisor configurations
sudo supervisorctl reread
sudo supervisorctl update

# Restart Nginx and Supervisor
sudo systemctl restart nginx
sudo systemctl restart supervisor
