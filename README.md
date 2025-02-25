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
