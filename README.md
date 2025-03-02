Manual

1. Environment preparation

For environment was choosed VM on Debian 12

For preparing environment in console execute:

  chmod +x Jenkins_Docker_installation.sh
  
  chmod +x install_monitoring.sh
  
  ./Jenkins_Docker_installation.sh
  
  ./install_monitoring.sh


2. Jenkins configuration

manage plugins and add:
build monitor view
git plugin

Jenkins Dashboard -> New Item -> pipeline
configure: 
definition -> pipeline script from scm
scm -> git
repository URL - https://github.com/aliensell/PandaTest.git
branch -> main

3. Monitoring configuration

python httpserver.py -> for manual run
curl -i http://127.0.0.1:8888/hello -> for test

Add Prometheus as a Data Source in Grafana
Open Grafana (http://localhost:3000).
Go to Configuration → Data Sources.
Click "Add data source" and select Prometheus. 
http://<ip of prometheus pod>:9090
Save and test

import dashboard in grafana with ID 893 and 179

container cpu usage metrics ->    container_cpu_load_average_10s{image!=""}

container memory usage metrics -> container_memory_max_usage_bytes{image!=""}
query for alert -> container_memory_max_usage_bytes{image!=""} > 15000000
