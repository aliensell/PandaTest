Manual

1. Environment preparation

For environment was choosed VM on Debian 12

For preparing environment in console execute:

  chmod +x Jenkins_Docker_installation.sh
  
  chmod +x install_monitoring.sh
  
  ./Jenkins_Docker_installation.sh
  
  ./install_monitoring.sh


2. Jenkins configuration

By link localhost:8080 finishing standard installation and creating pipeline

  Jenkins Dashboard -> New Item -> pipeline
    configure: 
    definition -> pipeline script from scm
    scm -> git
    repository URL - https://github.com/aliensell/PandaTest.git
    branch -> main

  Jenkins pipeline (Jenkinsfile) consists steps for preparing tag, build image, run http server in docker container, test with http request and cleanup
  
3. Monitoring configuration

Add Prometheus as a Data Source in Grafana. Open Grafana (http://localhost:3000), go to Configuration → Data Sources, Click "Add data source" and select Prometheus
URL -> http://prometheus:9090, Save and test

Creating a new dashboard with prometheus data source with two vidgets by using next metrics:
  container cpu usage metrics    -> container_cpu_load_average_10s{image!=""}
  container memory usage metrics -> container_memory_max_usage_bytes{image!=""}
  
Creating two alerts by using memory by container more than 110Mb and CPU usage more than 80%
Screens with details in attached *.png images
