# Deploy Portainer container
echo "Deploying Portainer container..."

# Create a volume for Portainer data
docker volume create portainer_data

# Run Portainer container
docker run -d \
  --name=portainer \
  --restart=always \
  -p 8000:8000 \
  -p 9443:9443 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  portainer/portainer-ce:latest

# Print completion message
echo "Docker and Portainer installation completed successfully!"
echo "Please log out and log back in for group changes to take effect."
echo "Access Portainer at: https://<your-server-ip>:9443"