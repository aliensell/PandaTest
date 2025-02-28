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
    networks:
      - monitoring
    restart: unless-stopped
   
  docker-daemon:
    image: docker:dind
    container_name: docker_engine_metrics
    privileged: true
    ports:
      - "9323:9323"
    networks:
      - monitoring
    restart: unless-stopped
    volumes:
      - /var/lib/docker:/var/lib/docker
      - /var/run/docker.sock:/var/run/docker.sock
    command: ["--experimental", "--metrics-addr=0.0.0.0:9323"]
    
  grafana:
    image: grafana/grafana:latest
    container_name: grafana
    ports:
      - "3000:3000"
    networks:
      - monitoring
    restart: unless-stopped
    environment:
      - GF_SECURITY_ADMIN_PASSWORD=admin
    volumes:
      - grafana-storage:/var/lib/grafana

networks:
  monitoring:
    driver: bridge

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
      - targets: ['prometheus:9090']
      
  - job_name: 'docker'
    static_configs:
      - targets: ['host.docker.internal:9323']

EOF

# Start services using Docker Compose
sudo docker compose up -d

# Output success message
echo "Grafana and Prometheus installation complete."
echo "Access Grafana at http://localhost:3000 (admin/admin)"
