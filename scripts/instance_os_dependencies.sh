#!/usr/bin/env bash

# Update package lists
sudo apt update

# Install Python packages
pip3 install --upgrade pip
Sudo python3 -m venv env 
virtualenv /home/ubuntu/env
source /home/ubuntu/env/bin/activate

# Install necessary packages
sudo apt install -y python3-pip virtualenv nginx gunicorn

# Configure any pending package installations
sudo dpkg --configure -a

# Resolve any dependency issues
sudo apt-get install -f -y

# Exit the script with a success message
echo "Instance OS dependencies installation completed successfully."
exit 0
