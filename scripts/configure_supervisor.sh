#!/bin/bash

# Install Supervisor
sudo apt-get update
sudo apt-get install -y supervisor

# Reread and update Supervisor configurations
sudo supervisorctl reread
sudo supervisorctl update

# Restart Nginx and Supervisor
sudo systemctl restart nginx
sudo systemctl restart supervisor
