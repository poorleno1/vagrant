#!/bin/bash

# Enable debug mode (optional)
set -x

# Update package list
echo "Updating package list..."
sudo apt update

# Install dependencies
echo "Installing required dependencies..."
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker's official GPG key
echo "Adding Docker's GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Set up the Docker repository
echo "Setting up Docker repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package list again to include Docker repository
echo "Updating package list with Docker repository..."
sudo apt update

# Install Docker Engine and related components
echo "Installing Docker Engine..."
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Start and enable Docker service
echo "Starting and enabling Docker service..."
sudo systemctl start docker
sudo systemctl enable docker

# Add current user to the Docker group (optional, to avoid using 'sudo' with Docker commands)
echo "Adding user to the Docker group..."
sudo usermod -aG docker vagrant
sudo usermod -aG docker $(whoami)
 
# Print completion message
echo "Docker installation completed successfully!"
echo "Please log out and log back in for group changes to take effect."