#!/usr/bin/bash 

sed -i 's/\[]/\["54.144.250.113"]/' /home/ubuntu/new-repo/project/settings.py

python manage.py migrate 
python manage.py makemigrations     
python manage.py collectstatic
sudo service gunicorn restart
sudo service nginx restart
#sudo tail -f /var/log/nginx/error.log
#sudo systemctl reload nginx
#sudo tail -f /var/log/nginx/error.log
#sudo nginx -t
#sudo systemctl restart gunicorn
#sudo systemctl status gunicorn
#sudo systemctl status nginx
# Check the status
#systemctl status gunicorn
# Restart:
#sudo systemctl restart gunicorn
#gunicorn --bind 0.0.0.0:8000 project.wsgi:application
#sudo systemctl restart nginx