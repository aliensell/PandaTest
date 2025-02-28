#!/bin/bash

# Update package lists
sudo apt update

# Install dependencies for Docker Compose
sudo apt install -y curl jq

# Install Docker Compose plugin
sudo apt-get install -y docker-compose-plugin

# Verify Docker Compose installation
docker compose version

# Create a directory for Prometheus and Grafana setup
mkdir -p ~/monitoring && cd ~/monitoring

# Create a docker-compose.yml file
cat <<EOF > docker-compose.yml
version: '3.7'

services:
  prometheus:
    image: prom/prometheus:latest
    container_name: prometheus
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml
    ports:
      - "9090:9090"
    restart: unless-stopped

  grafana:
    image: grafana/grafana:latest
    container_name: grafana
    ports:
      - "3000:3000"
    restart: unless-stopped
    environment:
      - GF_SECURITY_ADMIN_PASSWORD=admin
    volumes:
      - grafana-storage:/var/lib/grafana

volumes:
  grafana-storage:
EOF

# Create Prometheus configuration file
cat <<EOF > prometheus.yml
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['localhost:9090']

EOF

# Start services using Docker Compose
sudo docker compose up -d

# Output success message
echo "Grafana and Prometheus installation complete."
echo "Access Grafana at http://localhost:3000 (admin/admin)"
