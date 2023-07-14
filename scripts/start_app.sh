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

# Exit the script with a success message
echo "Application start script completed successfully."
exit 0
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