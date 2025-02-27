1. Environment preparation

Intsall Debian 12 VM

in console execute:
chmod +x install_jenkins_docker.sh
./install_jenkins_docker.sh

in Jenkins

manage plugins and add:
build monitor view
git plugin

Jenkins Dashboard -> New Item -> pipeline
configure: 
definition -> pipeline script from scm
scm -> git
repository URL - https://github.com/aliensell/PandaTest.git
branch -> main

python httpserver.py -> for manual run
curl -i http://127.0.0.1:8888/hello -> for test

Add Prometheus as a Data Source in Grafana
Open Grafana (http://localhost:3000).
Go to Configuration → Data Sources.
Click "Add data source" and select Prometheus. 
http://<ip of prometheus pod>:9090
Save and test
