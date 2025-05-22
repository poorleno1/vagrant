!#/bin/bash

#!/bin/bash

# Update package lists
sudo apt-get update

# Install https support for apt
sudo apt-get install -y apt-transport-https

# Add InfluxData GPG key
wget -q https://repos.influxdata.com/influxdata-archive_compat.key
echo '393e8779c89ac8d958f81f942f9ad7fb82a25e133faddaf92e15b16e6ac9ce4c influxdata-archive_compat.key' | sha256sum -c && cat influxdata-archive_compat.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/influxdata-archive_compat.gpg > /dev/null

# Add InfluxData repository
echo 'deb [signed-by=/etc/apt/trusted.gpg.d/influxdata-archive_compat.gpg] https://repos.influxdata.com/debian stable main' | sudo tee /etc/apt/sources.list.d/influxdata.list

# Update package lists again
sudo apt-get update

# Install InfluxDB 2.0
sudo apt-get install -y influxdb2

# Start InfluxDB service
sudo systemctl start influxdb

# Enable InfluxDB to start on boot
sudo systemctl enable influxdb

# Verify the installation
influxd version

echo "InfluxDB 2.0 has been installed and started. You can now set it up by running 'influx setup'."


# Set your desired values
USERNAME="admin"
PASSWORD="Polska123"
ORG_NAME="nclarity"
BUCKET_NAME="bucket1"
ADMIN_TOKEN="your_admin_token"

# Run the influx setup command
influx setup \
  --username "$USERNAME" \
  --password "$PASSWORD" \
  --org "$ORG_NAME" \
  --bucket "$BUCKET_NAME" \
  --retention 0 \
  --force

# Check if the setup was successful
if [ $? -eq 0 ]; then
    echo "InfluxDB setup completed successfully"
else
    echo "InfluxDB setup failed"
    exit 1
fi