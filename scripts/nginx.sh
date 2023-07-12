#!/bin/bash

sudo systemctl daemon-reload
sudo rm -f /etc/nginx/sites-enabled/default

sudo cp /home/ubuntu/new-repo/nginx/nginx.conf /etc/nginx/sites-available/blog
sudo ln -s /etc/nginx/sites-available/blog /etc/nginx/sites-enabled/

sudo gpasswd -a www-data ubuntu
sudo systemctl restart nginx

# Exit the script with a success message
echo "Nginx configuration completed successfully."
exit 0


