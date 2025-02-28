#!/bin/bash

echo "Updating system packages..."
sudo apt update -y
sudo apt install -y docker.io docker-compose curl wget tar

# Enable Docker API metrics
echo "Enabling Docker API Metrics..."
sudo mkdir -p /etc/docker
cat <<EOF | sudo tee /etc/docker/daemon.json
{
  "metrics-addr": "0.0.0.0:9323",
  "experimental": true
}
EOF

sudo systemctl restart docker

# Create Prometheus config
echo "Creating Prometheus configuration..."
mkdir -p prometheus_data
echo "global:
  scrape_interval: 5s
scrape_configs:
  - job_name: 'docker'
    metrics_path: '/metrics'
    static_configs:
      - targets: ['host.docker.internal:9323']" > prometheus.yml

# Create a Docker Compose file
echo "Creating Docker Compose file..."
cat <<EOF | sudo tee docker-compose.yml
version: '3.7'

services:
  prometheus:
    image: prom/prometheus:latest
    container_name: prometheus
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml
      - ./prometheus_data:/prometheus
    ports:
      - "9090:9090"
    restart: unless-stopped

  grafana:
    image: grafana/grafana:latest
    container_name: grafana
    ports:
      - "3000:3000"
    restart: unless-stopped
EOF

# Start Prometheus and Grafana using Docker Compose
echo "Starting Prometheus and Grafana containers..."
docker-compose up -d

# Print status
echo "Installation complete. Prometheus and Grafana are running in containers."
echo "Access Grafana at http://localhost:3000 (admin/admin)"
