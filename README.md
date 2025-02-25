1. Environment preparation

Intsall Debian 12 VM

in console execute:
chmod +x install_jenkins_docker.sh
./install_jenkins_docker.sh

in Jenkins
Go to Jenkins Dashboard → Manage Jenkins → Manage Plugins and be ensure that plugin 'Git plugin' was installed

Go to Jenkins Dashboard → New Item → Freestyle Project.
Under Source Code Management, select Git.
Enter the public GitHub repository URL - https://github.com/aliensell/PandaTest.git
