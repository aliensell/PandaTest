def imagetag = ''
def imagename = 'python_http_server'
def containername = 'http-server-container'
def containeripaddress = ''

pipeline {
    agent any
    stages {
        stage('Prepare image tag') {
            steps {
                script {
                    def currentYear = new Date().format('yyyy')
                    imagetag = currentYear + '.' + BUILD_ID
                    println('Image tag is: ' + imagetag)
                }
            }
        }
        stage('Build image') {
            steps {
                script {
                    sh """
                    docker build -t ${imagename}:${imagetag} -f Dockerfile .
                    docker images
                    """
                }
            }
        }
        stage('Run http server in container') {
            steps {
                script {
                    sh """
                    docker run -d -p 8888:8888 --name ${containername} ${imagename}:${imagetag}
                    docker ps            
                    """
                    containeripaddress = sh(script: "docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ${containername}", returnStdout: true).trim()
                    println('Container IP is : ' + containeripaddress)
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    sh """
                    curl -i http://${containeripaddress}:8888/hello
                    """
                }
            }
        }
    }
    post {
       cleanup {
           sh """
           docker stop ${containername}
           docker rm ${containername}
           docker rmi ${imagename}:${imagetag}
           """
           cleanWs()
       } 
    }
}
