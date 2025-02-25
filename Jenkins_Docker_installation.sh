#!/bin/bash

# Exit script on error
set -e

# -------------------------
# Install Jenkins
# -------------------------
echo "Installing dependencies..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y openjdk-17-jdk gnupg curl gzip git net-tools
java -version

echo "Adding Jenkins GPG key and repository..."
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "Installing Jenkins..."
sudo apt update
sudo apt install -y jenkins

echo "Enabling and starting Jenkins service..."
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins --no-pager

# -------------------------
# Install Docker
# -------------------------
echo "Installing required packages for Docker..."
sudo apt install -y apt-transport-https ca-certificates software-properties-common

echo "Adding Docker GPG key and repository..."
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo tee /usr/share/keyrings/docker-archive-keyring.asc > /dev/null
echo "deb [signed-by=/usr/share/keyrings/docker-archive-keyring.asc] https://download.docker.com/linux/debian bookworm stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Installing Docker..."
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Enabling and starting Docker service..."
sudo systemctl enable docker
sudo systemctl start docker

echo "Checking Docker status..."
sudo systemctl status docker --no-pager

# -------------------------
# Add Jenkins User to Docker Group
# -------------------------
echo "Adding Jenkins user to the Docker group..."
sudo usermod -aG docker jenkins

echo "Restarting Jenkins to apply Docker group changes..."
sudo systemctl restart jenkins

# -------------------------
# Display Jenkins Initial Admin Password
# -------------------------
echo "Retrieving Jenkins initial admin password..."
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

echo "Access Jenkins at: http://your-server-ip:8080"
